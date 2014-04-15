<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Truckers_model extends CI_Model{
	
	/* CREATE */
	function new_trucker($data) {
		$this->db->insert('truckers', $data);
	
		return $this->db->insert_id();
	}
	
	/* READ */
	function get_truckers() {
		$returnVal = NULL;
		$this->db->from('truckers');
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
		$this->db->where('t_id', $id);
		$this->db->delete('truckers');
	}
	
}