<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Tcard_model extends CI_Model{
	
	/* CREATE */
	
	/**
	 *
	 * Insert new T-card using column-value array data representation
	 *
	 * @param array $data
	 * @return int|string ID of the newly inserted record
	 *
	 */
	function new_card($data) {
		$tcard_id = $this->_insert_id();
		
		$this->db->set('tc_id', $tcard_id);
		$this->db->insert('tcards', $data);
		
		return $tcard_id;
	}
	
	/**
	 *
	 * Insert new T-card type using column-value array data representation
	 *
	 * @param array $data
	 * @return int|string ID of the newly inserted record
	 *
	 */
	function new_type($data) {
		$this->db->insert('tcard_types', $data);
		
		return $this->db->insert_id();
	}
	
	/**
	 *
	 * Insert new T-card position using column-value array data representation
	 *
	 * @param array $data
	 * @return int|string ID of the newly inserted record
	 *
	 */
	function new_card_position($data) {
		$this->db->insert('tcard_position', $data);
	
		return $this->db->insert_id();
	}
	
	function new_tcard_incoming_material( $data ) {
		$this->db->insert('tcard_incoming_materials', $data);
		
		return $this->db->insert_id();
	}
	
	function new_tcard_exitpass($data) {
		$this->db->insert('exit_passes', $data);
		
		return $this->db->insert_id();
	}
	
	/* READ */
	
	/**
	 * Get T-card details by ID.
	 * The selection <b>display_chars</b> is a 3-character representation of the card van no. 
	 *
	 * @param int|string $id
	 * @return object
	 */
	function get_tcard_by_id( $id ){
		$returnVal = NULL;
	
		$this->db->select(' tc.*,
							v.v_no,
							SUBSTRING(v.v_no, 1, 3) AS display_chars,
							s.s_name,
							s.s_code,
							s.s_color,
							tt.tt_name,
							tt.tt_color,
							tp.tp_id,
							vt.vt_name,
							e.e_id,
							e.e_serial,
							e.e_van_class,
							e.e_date,
							e.e_timeout,
							e.e_destination,
							e.e_plateno,
							e.e_particulars,
							e.e_driver,
							(SELECT tp_position FROM tcard_position WHERE tc_id = tc.tc_id ORDER BY tp_timestamp DESC LIMIT 1) AS tp_position,
							(SELECT tp_left FROM tcard_position WHERE tc_id = tc.tc_id ORDER BY tp_timestamp DESC LIMIT 1) AS tp_left,
							(SELECT tp_top FROM tcard_position WHERE tc_id = tc.tc_id ORDER BY tp_timestamp DESC LIMIT 1) AS tp_top',
				FALSE);
		
		$this->db->from('tcards tc');
		$this->db->join('tcard_position tp', 'tp.tc_id = tc.tc_id');
		$this->db->join('vans v', 'tc.v_id = v.v_id');
		$this->db->join('shippers s', 'tc.s_id = s.s_id');
		$this->db->join('van_types vt', 'tc.vt_id = vt.vt_id');
		$this->db->join('tcard_types tt', 'tc.tt_id = tt.tt_id');
		$this->db->join('exit_passes e', 'tc.tc_id = e.tc_id', 'left');
		$this->db->where('tc.tc_id', $id);
		$this->db->order_by('tp.tp_timestamp', 'DESC');
		$this->db->limit(1);
		$query = $this->db->get();
	
		if( $query->num_rows() == 1 ) {
			$returnVal = $query->result();
			$returnVal = $returnVal[0];
		}
	
		return $returnVal;
	}
	
	function get_tcard_block_status($id) {
		$returnVal = NULL;
		
		$this->db->select('is_blocked');
		$this->db->from('tcards');
		$this->db->where('tc_id', $id);
		$query = $this->db->get();
		
		if( $query->num_rows() === 1 ) {
			$returnVal = $query->result();
			$returnVal = $returnVal[0];
		}
		
		return $returnVal;
	}
	
	/**
	 * Get all T-cards including the details where the exit date has not yet been supplied.
	 *
	 * @return array
	 */
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
		$this->db->join('exit_passes e', 'tc.tc_id = e.tc_id', 'left');
		$this->db->where('e.e_timeout IS NULL');
		$this->db->order_by('v.v_no');
		$query = $this->db->get();
	
		if( $query->num_rows() > 0 ) {
			$returnVal = $query->result();
		}
	
		return $returnVal;
	}
	
	/**
	 * Gets the number of existing records that don't have the ID of 1 and are not deleted
	 *
	 * @return int
	 *
	 */
	function record_count() {
		$this->db->from('tcard_types');
		$this->db->where('is_deleted <>', '1');
		
        return $this->db->count_all_results();
    }

    # Get Tcard Types for pagination
    /**
     * Get limited number of T-card types. This function is used for pagination.
     *
     * @param int $limit
     * @param int $offset
     * @return array
     *
     */
    function p_types($limit, $offset) {
		$this->db->from('tcard_types tt');
		$this->db->join('tcard_type_group ttg', 'tt.ttg_id = ttg.ttg_id', 'left');
		$this->db->order_by('tt.tt_name', 'ASC');
		$this->db->where('tt.is_deleted <>', '1');
		$this->db->limit($limit, $offset);
		$query = $this->db->get();
		
		return $query->result();
   	}

   	/**
   	 * Get all T-card types that are not marked as "deleted"
   	 *
   	 * @return array
   	 *
   	 */
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
	
	/**
	 * Get T-card type details by ID
	 *
	 * @param int|string $id
	 * @return object
	 */
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
	
	function get_type_groups() {
		$returnVal = NULL;
		
		$this->db->from('tcard_type_group');
		$query = $this->db->get();
		
		if( $query->num_rows() > 0 ) {
			$returnVal = $query->result();
		}
		
		return $returnVal;
	}
	
	function get_card_incoming_materials( $tc_id ) {
		$returnVal = NULL;
		
		$this->db->from('tcard_incoming_materials');
		$this->db->where('tc_id', $tc_id);
		$query = $this->db->get();
		
		if( $query->num_rows() > 0 ) {
			$returnVal = $query->result();
		}
		
		return $returnVal;
	}
	
	function get_card_current_incoming_materials( $tc_id ) {
		$returnVal = NULL;
		
		$this->db->from('tcard_incoming_materials');
		$this->db->where('tc_id', $tc_id);
		$this->db->where('is_deleted', FALSE);
		
		$query = $this->db->get();
		
		if( $query->num_rows() > 0 ) {
			$returnVal = $query->result();
		}
		
		return $returnVal;
	}
	
	function get_tcard_exit_pass( $id ) {
		$returnVal = NULL;
		
		$this->db->from('exit_passes');
		$this->db->where('tc_id', $id);
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
	 * Update T-card using column-value array data representation
	 *
	 * @param int|string $id
	 * @param array $data
	 * @return object
	 */
	function update_tcard( $id, $data ) {
		$this->db->where('tc_id', $id);
		$query = $this->db->update('tcards', $data);
	}
	
	/**
	 *
	 * Update T-card type using column-value array data representation
	 *
	 * @param int|string $id
	 * @param array $data
	 * @return object
	 */
	function update_type($id, $data) {
		$this->db->where('tt_id', $id);
		$query = $this->db->update('tcard_types', $data);
	
		if( $this->db->affected_rows() == 1 ){
			return $query;
		}
	}
	
	function unset_exfac_types() {
		$this->db->where('is_exfactory', TRUE);
		$this->db->update('tcard_types', array('is_exfactory' => FALSE));
	}
	
	function update_tcard_exitpass( $tcard_id, $data ) {
		$this->db->where('tc_id', $tcard_id);
		$this->db->update('exit_passes', $data);
	}
	
	/* DELETE */
	
	/**
	 *
	 * Set the record with the supplied ID as "deleted"
	 *
	 * @param int|string $id
	 */
	function purge_type( $type_id ) {
		$data = array(
			'is_deleted' => TRUE
		);
		
		$this->db->where('tt_id', $type_id);
		$query = $this->db->update('tcard_types', $data);
	}

	function flush_tcard_incoming_materials( $tcard_id ) {
		$data = array(
			'is_deleted' => TRUE
		);
		
		$this->db->where('tc_id', $tcard_id);
		$this->db->update('tcard_incoming_materials', $data);
	}
	
	
	/* PRIVATE */
	
	/**
	 * 
	 * Fetches the next T-card ID for new record.
	 * <code>fnTcardID()</code> is a MySql stored function/procedure that creates the next T-card ID. 
	 * 
	 * @return string
	 */
	private function _insert_id() {
		$this->db->select('(fnTcardID()) AS id', FALSE);
		
		$query = $this->db->get();
		$tcard = $query->result();
		$tcard = $tcard[0];
		
		return $tcard->id;
	}

}