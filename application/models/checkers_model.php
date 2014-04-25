<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Checkers_model extends CI_Model{
	/* CREATE */
	function new_checker($data) {
		$this->db->insert('checkers', $data);
	
		return $this->db->insert_id();
	}
	
	/* READ */
	function record_count() {
		$this->db->from('checkers');
		$this->db->where('c_id <>', '1');
		$this->db->where('is_deleted <>', TRUE);
	
		return $this->db->count_all_results();
	}
	
	function p_checkers($limit, $offset) {
		$this->db->from('checkers');
		$this->db->where('c_id <>', '1');
		$this->db->where('is_deleted <>', TRUE);
		$this->db->order_by('c_firstname ASC, c_lastname ASC, c_mi ASC');
		$this->db->limit($limit, $offset);
		$query = $this->db->get();
		 
		return $query->result();
	}
	
	function get_checkers() {
		$returnVal = NULL;
		
		$this->db->from('checkers');
		$this->db->where('c_id <>', '1');
		$this->db->where('is_deleted <>', '1');
		$this->db->order_by('c_firstname ASC, c_lastname ASC, c_mi ASC');
		$query = $this->db->get();
		
		if( $query->num_rows() > 0 ) {
			$returnVal = $query->result();
		}
		
		return $returnVal;
	}
	
	function get_checker_by_id($id) {
		$returnVal = NULL;
	
		$this->db->from('checkers');
		$this->db->where('c_id', $id);
		$query = $this->db->get();
	
		if( $query->num_rows() == 1 ) {
			$returnVal = $query->result();
			$returnVal = $returnVal[0];
		}
	
		return $returnVal;
	}
	
	
	/* UPDATE */
	function update_checker($id, $data) {
		$this->db->where('c_id', $id);
		$query = $this->db->update('checkers', $data);
	
		if( $this->db->affected_rows() == 1 ){
			return $query;
		}
	}
	
	
	/* DELETE */
	function purge_checker( $id ) {
		$data = array(
				'is_deleted' => TRUE
		);
	
		$this->db->where('c_id', $id);
		$query = $this->db->update('checkers', $data);
	}
}