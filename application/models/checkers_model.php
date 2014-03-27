<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Checkers_model extends CI_Model{
	/* CREATE */
	/* READ */
	function get_checkers() {
		$returnVal = NULL;
		
		$this->db->from('checkers');
		$this->db->where('c_id <>', '1');
		$this->db->order_by('c_firstname ASC, c_lastname ASC, c_mi ASC');
		$query = $this->db->get();
		
		if( $query->num_rows() > 0 ) {
			$returnVal = $query->result();
		}
		
		return $returnVal;
	}
	
	/* UPDATE */
	/* DELETE */
}