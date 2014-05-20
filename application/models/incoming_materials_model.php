<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Incoming_materials_model extends CI_Model{
	
	/* CREATE */
	
	/**
	 *
	 * Insert new material using column-value array data representation
	 *
	 * @param array $data
	 * @return int|string ID of the newly inserted record
	 *
	 */
	function new_incoming_material($data) {
		$this->db->insert('incoming_materials', $data);
	
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
		$this->db->from('incoming_materials');
		$this->db->where('is_deleted <>', '1');
		
        return $this->db->count_all_results();
    }

    # Get Materials for pagination
    /**
     * Get limited number of materials. This function is used for pagination.
     *
     * @param int $limit
     * @param int $offset
     * @return array
     *
     */
    function p_incoming_materials($limit, $offset) {
		$this->db->from('incoming_materials');
		$this->db->where('is_deleted <>', '1');
		$this->db->order_by('im_name', 'ASC');
		$this->db->limit($limit, $offset);
        $query = $this->db->get();
        
		return $query->result();
   }

   /**
    * Gets the materials excluding the deleted ones and the record having the ID 1
    *
    * @return array
    *
    */
	function get_incoming_materials() {
		$returnVal = NULL;
		$this->db->from('incoming_materials');
		$this->db->where('is_deleted <>', '1');
		$this->db->order_by('im_category ASC, im_name ASC');
		$query = $this->db->get();
	
		if( $query->num_rows() > 0 ) {
			$returnVal = $query->result();
		}
	
		return $returnVal;
	
	}
	
	/**
	 * Get material details by ID
	 *
	 * @param int|string $id
	 * @return object
	 */
	function get_incoming_material_by_id($id) {
		$returnVal = NULL;
	
		$this->db->from('incoming_materials');
		$this->db->where('im_id', $id);
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
	 * Update material using column-value array data representation
	 *
	 * @param int|string $id
	 * @param array $data
	 * @return object
	 */
	function update_incoming_material($id, $data) {
		$this->db->where('im_id', $id);
		$query = $this->db->update('incoming_materials', $data);
	
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
	function purge_material( $id ) {
		$data = array(
			'is_deleted' => TRUE
		);
		
		$this->db->where('im_id', $id);
		$query = $this->db->update('incoming_materials', $data);
	}
	
	function unpurge_tcard_incoming_material( $id ) {
		$data = array(
			'is_deleted' => FALSE
		);
		
		$this->db->where('tim_id', $id);
		$query = $this->db->update('tcard_incoming_materials', $data);
	}
	
}