<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Vans_model extends CI_Model{
	/* CREATE */
	
	/**
	 *
	 * Insert new van using column-value array data representation
	 *
	 * @param array $data
	 * @return int|string ID of the newly inserted record
	 *
	 */
	function new_van($data) {
		$this->db->insert('vans', $data);
	
		return $this->db->insert_id();
	}
	
	/* READ */
	
	/**
	 * Gets all vans
	 *
	 * @return array
	 *
	 */
	function get_vans() {
		$returnVal = NULL;
		
		$this->db->from('vans');
		$this->db->order_by('v_no', 'ASC');
		$query = $this->db->get();
		
		if( $query->num_rows() > 0 ) {
			$returnVal = $query->result();
		}
		
		return $returnVal;
	}
	
	/**
	 * Get van details by its number
	 *
	 * @param string $str
	 * @return object
	 */
	function get_van_by_no($str) {
		$returnVal = NULL;
		
		$this->db->from('vans');
		$this->db->where('v_no', strtoupper($str));
		$this->db->limit(1);
		$query = $this->db->get();
		
		if( $query->num_rows() == 1 ) {
			$returnVal = $query->result();
			$returnVal = $returnVal[0];
		}
		
		return $returnVal;
	}
	
	/* UPDATE */
	/* DELETE */
}