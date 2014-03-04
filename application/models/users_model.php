<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Users_model extends CI_Model{
	
	# Get Users
	function get_users() {
		$this->db->where('u_isadmin', FALSE);
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
}