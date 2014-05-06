<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Shippers_model extends CI_Model{
	/* CREATE */
	
	/**
	 * 
	 * Insert new shipper using column-value array data representation
	 *
	 * @param array $data
	 * @return int|string ID of the newly inserted record
	 *
	 */
	function new_shipper($data) {
		$this->db->insert('shippers', $data);
	
		return $this->db->insert_id();
	}
	
	/* READ */
	
	/**
	 * Gets the number of existing records that don't have the ID of 1 and are not deleted
	 *
	 * @return int
	 *
	 */
	function record_count() {
		$this->db->from('shippers');
		$this->db->where('s_id <>', '1');
		$this->db->where('is_deleted <>', TRUE);
		
        return $this->db->count_all_results();
    }

    # Get Shippers for pagination
    /**
	 * Get limited number of shippers. This function is used for pagination.
	 *
	 * @param int $limit
	 * @param int $offset
	 * @return array
	 *
	 */
    function p_shippers($limit, $offset) {
    	$this->db->from('shippers');
    	$this->db->where('s_id <>', '1');
		$this->db->where('is_deleted <>', TRUE);
    	$this->db->limit($limit, $offset);
		$this->db->order_by('s_name ASC, s_code ASC');
		
        $query = $this->db->get();
		return $query->result();
   	}

   	/**
   	 * Gets the shippers excluding the deleted ones and the record having the ID 1
   	 *
   	 * @return array
   	 *
   	 */
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
	
	/**
	 * Get shipper details by ID
	 *
	 * @param int|string $id
	 * @return object
	 */
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
	
	/**
	 *
	 * Update shipper using column-value array data representation
	 *
	 * @param int|string $id
	 * @param array $data
	 * @return object
	 */
	function update_shipper($id, $data) {
		$this->db->where('s_id', $id);
		$query = $this->db->update('shippers', $data);
	
		if( $this->db->affected_rows() == 1 ){
			return $query;
		}
	}
	
	/* DELETE */
	
	/**
	 *
	 * Set the record with the supplied ID as "deleted"
	 *
	 * @param int|string $id
	 */
	function purge_shipper( $id ) {
		$data = array(
			'is_deleted' => TRUE
		);
		
		$this->db->where('s_id', $id);
		$this->db->update('shippers', $data);
	}
}