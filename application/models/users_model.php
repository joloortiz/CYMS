<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Users_model extends CI_Model{
	
	# Get Users
	function get_users() {
		$this->db->where('u_isadmin', FALSE);
		$query = $this->db->get('users');
		return $query->result_array();
	}

	function p_count($id, $is_admin) {
    	if($is_admin == FALSE)
    	$this->db->where('u_isadmin', FALSE);
        $this->db->where('u_isactive', TRUE);	
    	$this->db->where('u_id !=', $id);	
        $query = $this->db->get('users');
        return  $query->num_rows();
    }

    # Get Users for pagination
    function p_users($id, $is_admin, $limit, $offset) {
    	if($is_admin == FALSE)
    		$this->db->where('u_isadmin', FALSE);
    	$this->db->where('u_id !=', $id);
    	$this->db->where('u_isactive', TRUE);
        $query = $this->db->get('users', $limit, $offset);
		return $query->result_array();
   }

   	function get_by_username($username) {
		$this->db->where('u_username', $username);
		$query = $this->db->get('users');
		return $query->result_array();
	}

	function get_user_by_id($id) {
		$this->db->where('u_id', $id);
		$query = $this->db->get('users');
		return $query->result_array();
	}

	function is_username_existing($username){
		$this->db->where('u_username', $username);
		$query = $this->db->get('users');
		$total = $query->num_rows();

		if($total > 0){
			return TRUE;
		}
		else{
			return FALSE;
		}
	}

	function is_username_existing_edit($username, $id){
		$this->db->where('u_username', $username);
		$this->db->where('u_id !=', $id);
		$query = $this->db->get('users');
		$total = $query->num_rows();

		if($total > 0){
			return TRUE;
		}
		else{
			return FALSE;
		}
	}

	function is_password_valid($username, $password){
		$this->db->where('u_username', $username);
		$this->db->where('u_password', $password);
		$query = $this->db->get('users');
		$total = $query->num_rows();

		if($total > 0){
			return TRUE;
		}
		else{
			return FALSE;
		}
	}

	function is_account_active($username, $password){
		$this->db->where('u_username', $username);
		$this->db->where('u_password', $password);
		$this->db->where('u_isactive', TRUE);
		$query = $this->db->get('users');
		$total = $query->num_rows();

		if($total > 0){
			return TRUE;
		}
		else{
			return FALSE;
		}

	}

	# Create User 
    function Insert($data) {
        $this->db->insert('users', $data);
        return;
    }

    # Update
    function Update($data, $id) {
        $this->db->where('u_id', $id);
        $this->db->update('users', $data);
        return;
    }

    # Purge
    function Purge($data, $id) {
    	$this->db->where('u_id', $id);
    	$this->db->update('users', $data);
    	return;
    }
    
    # Delete
    function Delete($id) {
        $this->db->where('u_id', $id);
        $this->db->delete('users');
        return;
    }
}

?>