<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Tcard_model extends CI_Model{
	
	/* CREATE */
	function new_card($data) {
		$tcard_id = $this->_insert_id();
		
		$this->db->set('tc_id', $tcard_id);
		$this->db->insert('tcards', $data);
		
		return $tcard_id;
	}
	
	function new_type($data) {
		$this->db->insert('tcard_types', $data);
		
		return $this->db->insert_id();
	}
	
	function new_card_position($data) {
		$this->db->insert('tcard_position', $data);
	
		return $this->db->insert_id();
	}
	
	/* READ */
	function get_tcard_by_id( $id ){
		$returnVal = NULL;
	
		$this->db->select('tc.*, v.v_no, SUBSTRING(v.v_no, 1, 3) AS display_chars, s.s_name, s.s_code, s.s_color, tt.tt_name, tt.tt_color, tp.tp_id, tp.tp_position, tp.tp_left, tp.tp_top', FALSE);
	
		$this->db->from('tcards tc');
		$this->db->join('vans v', 'tc.v_id = v.v_id');
		$this->db->join('shippers s', 'tc.s_id = s.s_id');
		$this->db->join('tcard_types tt', 'tc.tt_id = tt.tt_id');
		$this->db->join('tcard_position tp', 'tc.tc_id = tp.tc_id', 'left');
		$this->db->where('tc.tc_id', $id);
		$query = $this->db->get();
	
		if( $query->num_rows() == 1 ) {
			$returnVal = $query->result();
			$returnVal = $returnVal[0];
		}
	
		return $returnVal;
	}
	
	function list_tcards() {
		$returnVal = NULL;
	
		$this->db->select('tc.*, v.v_no, SUBSTRING(v.v_no, 1, 3) AS display_chars, s.s_name, s.s_code, s.s_color, tt.tt_name, tt.tt_color', FALSE);
		$this->db->select('(SELECT tp_id FROM tcard_position WHERE tc_id = tc.tc_id ORDER BY tp_timestamp DESC LIMIT 1) AS tp_id', FALSE);
		$this->db->select('(SELECT tp_position FROM tcard_position WHERE tc_id = tc.tc_id ORDER BY tp_timestamp DESC LIMIT 1) AS tp_position', FALSE);
		$this->db->select('(SELECT tp_left FROM tcard_position WHERE tc_id = tc.tc_id ORDER BY tp_timestamp DESC LIMIT 1) AS tp_left', FALSE);
		$this->db->select('(SELECT tp_top FROM tcard_position WHERE tc_id = tc.tc_id ORDER BY tp_timestamp DESC LIMIT 1) AS tp_top', FALSE);
	
		$this->db->from('tcards tc');
		$this->db->join('vans v', 'tc.v_id = v.v_id');
		$this->db->join('shippers s', 'tc.s_id = s.s_id');
		$this->db->join('tcard_types tt', 'tc.tt_id = tt.tt_id');
		$this->db->where('tc.tc_exitdate IS NULL OR tc.tc_exitdate = 0');
		$this->db->order_by('v.v_no');
		$query = $this->db->get();
	
		if( $query->num_rows() > 0 ) {
			$returnVal = $query->result();
		}
	
		return $returnVal;
	}
	
	function record_count() {
		$this->db->from('tcard_types');
		$this->db->where('is_deleted <>', '1');
		
        return $this->db->count_all_results();
    }

    # Get Tcard Types for pagination
    function p_types($limit, $offset) {
		$this->db->from('tcard_types');
		$this->db->order_by('tt_name', 'ASC');
		$this->db->where('is_deleted <>', '1');
		$this->db->limit($limit, $offset);
		$query = $this->db->get();
		
		return $query->result();
   }

	function get_types() {
		$returnVal = NULL;
		$this->db->from('tcard_types');
		$this->db->where('is_deleted <>', '1');
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
	function update_tcard( $id, $data ) {
		$this->db->where('tc_id', $id);
		$query = $this->db->update('tcards', $data);
	}
	
	function update_type($id, $data) {
		$this->db->where('tt_id', $id);
		$query = $this->db->update('tcard_types', $data);
	
		if( $this->db->affected_rows() == 1 ){
			return $query;
		}
	}
	
	/* DELETE */
	function purge_type( $type_id ) {
		$data = array(
			'is_deleted' => TRUE
		);
		
		$this->db->where('tt_id', $type_id);
		$query = $this->db->update('tcard_types', $data);
	}
	
	
	
	
	/* PRIVATE */
	private function _insert_id() {
		$this->db->select('(fnTcardID()) AS id', FALSE);
		
		$query = $this->db->get();
		$tcard = $query->result();
		$tcard = $tcard[0];
		
		return $tcard->id;
	}

}