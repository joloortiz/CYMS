<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Checkers_model extends CI_Model{
	/* CREATE */
	
	/**
	 * 
	 * Insert new checker using column-value array data representation
	 * 
	 * @param array $data
	 * @return int|string ID of the newly inserted record
	 * 
	 */
	function new_checker($data) {
		$this->db->insert('checkers', $data);
	
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
		$this->db->from('checkers');
		$this->db->where('c_id <>', '1');
		$this->db->where('is_deleted <>', TRUE);
	
		return $this->db->count_all_results();
	}
	
	/**
	 * Get limited number of checkers. This function is used for pagination.
	 *
	 * @param int $limit
	 * @param int $offset
	 * @return array
	 *
	 */
	function p_checkers($limit, $offset) {
		$this->db->from('checkers');
		$this->db->where('c_id <>', '1');
		$this->db->where('is_deleted <>', TRUE);
		$this->db->order_by('c_firstname ASC, c_lastname ASC, c_mi ASC');
		$this->db->limit($limit, $offset);
		$query = $this->db->get();
		 
		return $query->result();
	}
	
	/**
	 * Gets the checkers excluding the deleted ones and the record having the ID 1
	 *
	 * @return array
	 *
	 */
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
	
	/**
	 * Get checker details by ID
	 * 
	 * @param int|string $id
	 * @return object
	 */
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
	
	/**
	 * 
	 * Update checker using column-value array data representation
	 * 
	 * @param int|string $id
	 * @param array $data
	 * @return object
	 */
	function update_checker($id, $data) {
		$this->db->where('c_id', $id);
		$query = $this->db->update('checkers', $data);
	
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
	function purge_checker( $id ) {
		$data = array(
				'is_deleted' => TRUE
		);
	
		$this->db->where('c_id', $id);
		$query = $this->db->update('checkers', $data);
	}
}