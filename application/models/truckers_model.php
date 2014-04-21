<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Truckers_model extends CI_Model{
	
	/* CREATE */
	function new_trucker($data) {
		$this->db->insert('truckers', $data);
	
		return $this->db->insert_id();
	}
	
	/* READ */
	function record_count() {
		$this->db->from('truckers');
		$this->db->where('t_id <>', '1');
		$this->db->where('is_deleted <>', TRUE);
		
		return $this->db->count_all_results();
    }

    # Get Trukers for pagination
    function p_truckers($limit, $offset) {
    	$this->db->from('truckers');
    	$this->db->where('t_id <>', '1');
    	$this->db->where('is_deleted <>', TRUE);
    	$this->db->order_by('t_name ASC, t_code ASC');
    	$this->db->limit($limit, $offset);
    	$query = $this->db->get();
    	
		return $query->result();
   }

	function get_truckers() {
		$returnVal = NULL;
		$this->db->from('truckers');
		$this->db->where('t_id <>', '1');
    	$this->db->where('is_deleted <>', TRUE);
		$this->db->order_by('t_name ASC, t_code ASC');
		$query = $this->db->get();
	
		if( $query->num_rows() > 0 ) {
			$returnVal = $query->result();
		}
	
		return $returnVal;
	
	}
	
	function get_trucker_by_id($id) {
		$returnVal = NULL;
	
		$this->db->from('truckers');
		$this->db->where('t_id', $id);
		$query = $this->db->get();
	
		if( $query->num_rows() == 1 ) {
			$returnVal = $query->result();
			$returnVal = $returnVal[0];
		}
	
		return $returnVal;
	}
	
	/* UPDATE */
	function update_trucker($id, $data) {
		$this->db->where('t_id', $id);
		$query = $this->db->update('truckers', $data);
	
		if( $this->db->affected_rows() == 1 ){
			return $query;
		}
	}
	
	/* DELETE */
	function purge_trucker( $id ) {
		$data = array(
			'is_deleted' => TRUE
		);
		
		$this->db->where('t_id', $id);
		$query = $this->db->update('truckers', $data);
	}
	
}