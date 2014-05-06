<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Truckers_model extends CI_Model{
	
	/* CREATE */
	
	/**
	 *
	 * Insert new trucker using column-value array data representation
	 *
	 * @param array $data
	 * @return int|string ID of the newly inserted record
	 *
	 */
	function new_trucker($data) {
		$this->db->insert('truckers', $data);
	
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
		$this->db->from('truckers');
		$this->db->where('t_id <>', '1');
		$this->db->where('is_deleted <>', TRUE);
		
		return $this->db->count_all_results();
    }

    # Get Trukers for pagination
    /**
     * Get limited number of truckers. This function is used for pagination.
     *
     * @param int $limit
     * @param int $offset
     * @return array
     *
     */
    function p_truckers($limit, $offset) {
    	$this->db->from('truckers');
    	$this->db->where('t_id <>', '1');
    	$this->db->where('is_deleted <>', TRUE);
    	$this->db->order_by('t_name ASC, t_code ASC');
    	$this->db->limit($limit, $offset);
    	$query = $this->db->get();
    	
		return $query->result();
   }

   /**
    * Gets the truckers excluding the deleted ones and the record having the ID 1
    *
    * @return array
    *
    */
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
	
	/**
	 * Get trucker details by ID
	 *
	 * @param int|string $id
	 * @return object
	 */
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
	
	/**
	 *
	 * Update trucker using column-value array data representation
	 *
	 * @param int|string $id
	 * @param array $data
	 * @return object
	 */
	function update_trucker($id, $data) {
		$this->db->where('t_id', $id);
		$query = $this->db->update('truckers', $data);
	
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
	function purge_trucker( $id ) {
		$data = array(
			'is_deleted' => TRUE
		);
		
		$this->db->where('t_id', $id);
		$query = $this->db->update('truckers', $data);
	}
	
}