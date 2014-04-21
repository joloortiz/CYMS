<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Van_types_model extends CI_Model{
	
	/* CREATE */
	function new_van_type($data) {
		$this->db->insert('van_types', $data);
	
		return $this->db->insert_id();
	}
	
	/* READ */
	function record_count() {
        return $this->db->count_all('van_types');
    }

    # Get Van Types for pagination
    function p_van_types($limit, $offset) {
        $query = $this->db->get('van_types', $limit, $offset);
		return $query->result();
   }

	function get_van_types() {
		$returnVal = NULL;
		$this->db->from('van_types');
		$this->db->order_by('vt_name', 'ASC');
		$query = $this->db->get();
	
		if( $query->num_rows() > 0 ) {
			$returnVal = $query->result();
		}
	
		return $returnVal;
	
	}
	
	function get_van_type_by_id($id) {
		$returnVal = NULL;
	
		$this->db->from('van_types');
		$this->db->where('vt_id', $id);
		$query = $this->db->get();
	
		if( $query->num_rows() == 1 ) {
			$returnVal = $query->result();
			$returnVal = $returnVal[0];
		}
	
		return $returnVal;
	}
	
	/* UPDATE */
	function update_van_type($id, $data) {
		$this->db->where('vt_id', $id);
		$query = $this->db->update('van_types', $data);
	
		if( $this->db->affected_rows() == 1 ){
			return $query;
		}
	}
	
	/* DELETE */
	function purge_type( $id ) {
		$this->db->where('vt_id', $id);
		$this->db->delete('van_types');
	}
	
}