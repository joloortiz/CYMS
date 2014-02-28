<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Users_model extends CI_Model{
	
	# Get Users
	function get_users() {
		$this->db->where('isadmin', FALSE);
		$query = $this->db->get('users');
		return $query->result_array();
	}
/*
	function is_username_existing($username){
		$this->db->where('username', $username);
		$query = $this->db->get('users');


	}
*/
}