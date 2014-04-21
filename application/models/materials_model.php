<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Materials_model extends CI_Model{
	
	/* CREATE */
	function new_material($data) {
		$this->db->insert('materials', $data);
	
		return $this->db->insert_id();
	}
	
	/* READ */
	function record_count() {
        return $this->db->count_all("materials");
    }

    # Get Materials for pagination
    function p_materials($limit, $offset) {
        $query = $this->db->get('materials', $limit, $offset);
		return $query->result();
   }

	function get_materials() {
		$returnVal = NULL;
		$this->db->from('materials');
		$this->db->order_by('m_name ASC, m_type ASC');
		$query = $this->db->get();
	
		if( $query->num_rows() > 0 ) {
			$returnVal = $query->result();
		}
	
		return $returnVal;
	
	}
	
	function get_material_by_id($id) {
		$returnVal = NULL;
	
		$this->db->from('materials');
		$this->db->where('m_id', $id);
		$query = $this->db->get();
	
		if( $query->num_rows() == 1 ) {
			$returnVal = $query->result();
			$returnVal = $returnVal[0];
		}
	
		return $returnVal;
	}
	
	/* UPDATE */
	function update_material($id, $data) {
		$this->db->where('m_id', $id);
		$query = $this->db->update('materials', $data);
	
		if( $this->db->affected_rows() == 1 ){
			return $query;
		}
	}
	
	/* DELETE */
	function purge_material( $id ) {
		$this->db->where('m_id', $id);
		$this->db->delete('materials');
	}
}