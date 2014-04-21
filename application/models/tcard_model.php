<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Tcard_model extends CI_Model{
	
	/* CREATE */
	function new_type($data) {
		$this->db->insert('tcard_types', $data);
		
		return $this->db->insert_id();
	}
	
	function new_card_position($data) {
		$this->db->insert('tcard_position', $data);
	
		return $this->db->insert_id();
	}
	
	/* READ */
	function record_count() {
        return $this->db->count_all('tcard_types');
    }

    # Get Tcard Types for pagination
    function p_types($limit, $offset) {
        $query = $this->db->get('tcard_types', $limit, $offset);
		return $query->result();
   }

	function get_types() {
		$returnVal = NULL;
		$this->db->from('tcard_types');
		$this->db->order_by('tt_name', 'ASC');
		$query = $this->db->get();
		
		if( $query->num_rows() > 0 ) {
			$returnVal = $query->result();
		}
		
		return $returnVal;
		
	}
	
	function get_type_by_id($id) {
		$returnVal = NULL;
		
		$this->db->from('tcard_types');
		$this->db->where('tt_id', $id);
		$query = $this->db->get();
		
		if( $query->num_rows() == 1 ) {
			$returnVal = $query->result();
			$returnVal = $returnVal[0];
		}
		
		return $returnVal;
	}
	
	/* UPDATE */
	function update_type($id, $data) {
		$this->db->where('tt_id', $id);
		$query = $this->db->update('tcard_types', $data);
	
		if( $this->db->affected_rows() == 1 ){
			return $query;
		}
	}
	
	/* DELETE */
	function purge_type( $type_id ) {
		$this->db->where('tt_id', $type_id);
		$this->db->delete('tcard_types');
	}
}