<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Shippers_model extends CI_Model{
	/* CREATE */
	function new_shipper($data) {
		$this->db->insert('shippers', $data);
	
		return $this->db->insert_id();
	}
	
	/* READ */

	function record_count() {
		$this->db->from('shippers');
		$this->db->where('s_id <>', '1');
		$this->db->where('is_deleted <>', TRUE);
		
        return $this->db->count_all_results();
    }

    # Get Shippers for pagination
    function p_shippers($limit, $offset) {
    	$this->db->from('shippers');
    	$this->db->where('s_id <>', '1');
		$this->db->where('is_deleted <>', TRUE);
    	$this->db->limit($limit, $offset);
		$this->db->order_by('s_name ASC, s_code ASC');
		
        $query = $this->db->get();
		return $query->result();
   }

	function get_shippers() {
		$returnVal = NULL;
		
		$this->db->from('shippers');
		$this->db->where('s_id <>', '1');
		$this->db->where('is_deleted <>', TRUE);
		$this->db->order_by('s_name ASC, s_code ASC');
		$query = $this->db->get();
		
		if( $query->num_rows() > 0 ) {
			$returnVal = $query->result();
		}
		
		return $returnVal;
	}
	
	function get_shipper_by_id($id) {
		$returnVal = NULL;
	
		$this->db->from('shippers');
		$this->db->where('s_id', $id);
		$query = $this->db->get();
	
		if( $query->num_rows() == 1 ) {
			$returnVal = $query->result();
			$returnVal = $returnVal[0];
		}
	
		return $returnVal;
	}
	
	/* UPDATE */
	function update_shipper($id, $data) {
		$this->db->where('s_id', $id);
		$query = $this->db->update('shippers', $data);
	
		if( $this->db->affected_rows() == 1 ){
			return $query;
		}
	}
	
	/* DELETE */
	function purge_shipper( $id ) {
		$data = array(
			'is_deleted' => TRUE
		);
		
		$this->db->where('s_id', $id);
		$this->db->update('shippers', $data);
	}
}