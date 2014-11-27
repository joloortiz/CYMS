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
	
	function new_tcard_outgoing_material( $data ) {
		$this->db->insert('tcard_outgoing_materials', $data);
	
		return $this->db->insert_id();
	}
	
	function new_tcard_exitpass($data) {
		$serial = $this->exitpass_serial();
		
		$this->db->set('e_serial', $serial);
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
							tt.ttg_id,
							tp.tp_id,
							tp.tp_position,
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
// 		$this->db->join('materials m', 'tc.m_id = m.m_id', 'left');
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
	
	function get_simple_tcard_by_id( $id ) {
		$returnVal = NULL;
		
		$this->db->from('tcards');
		$this->db->where('tc_id', $id);
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
	
	function get_card_outgoing_materials( $tc_id ) {
		$returnVal = NULL;
	
		$this->db->from('tcard_outgoing_materials');
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
	
	function get_card_current_outgoing_materials( $tc_id ) {
		$returnVal = NULL;
	
		$this->db->from('tcard_outgoing_materials');
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
		
		$this->db->select('e.*, vt.vt_name, v.v_no, tc.tc_sealno, tc.tc_dn, s.s_name');
		$this->db->from('exit_passes e');
		$this->db->join('tcards tc', 'e.tc_id = tc.tc_id');
		$this->db->join('van_types vt', 'tc.vt_id = vt.vt_id');
		$this->db->join('vans v', 'tc.v_id = v.v_id');
		$this->db->join('shippers s', 'tc.s_id = s.s_id');
		$this->db->where('e.tc_id', $id);
		$query = $this->db->get();
		
		if( $query->num_rows() == 1 ) {
			$returnVal = $query->result();
			$returnVal = $returnVal[0];
		}
		
		return $returnVal;
	}
	
	function get_empty_vans( $except=NULL ) {
		$returnVal = NULL;
		
		$this->db->select('tc.*, v.v_no');
		$this->db->from('tcards tc');
		$this->db->join('exit_passes e', 'e.tc_id = tc.tc_id', 'left');
		$this->db->join('vans v', 'tc.v_id = v.v_id');
		$this->db->where('tc.tc_status', 'EMPTY');
		$this->db->where('e.e_timeout IS NULL');
		
		if( $except ) {
			$this->db->where('tc.tc_id <>', $except);
		}
		
		$this->db->order_by('tc.tc_entrydate', 'DESC');
		$query = $this->db->get();
		
		if( $query->num_rows() > 0 ) {
			$returnVal = $query->result();
		}
		
		return $returnVal;
	}
	
	function get_type_by_name( $str ) {
		$returnVal = NULL;
		
		$this->db->from('tcard_types');
		$this->db->where('tt_name', strtoupper( $str ));
		$query = $this->db->get();
		
		if( $query->num_rows() == 1 ) {
			$returnVal = $query->result();
			$returnVal = $returnVal[0];
		}
		
		return $returnVal;
	}
	
	function get_card_by_van_shipper_trucker( $v_no, $s_id, $t_id, $tc_id ) {
		$returnVal = NULL;
		
		$this->db->select('tc.*');
		$this->db->from('vans v');
		$this->db->join('tcards tc', 'v.v_id = tc.v_id');
		$this->db->join('exit_passes e', 'tc.tc_id = e.tc_id', 'left');
		$this->db->where('v.v_no', $v_no);
		$this->db->where('tc.s_id', $s_id);
		$this->db->where('tc.t_id', $t_id);
		$this->db->where('e.e_timeout IS NOT NULL');
		
		if( $tc_id != '' ) {
			$this->db->where('tc.tc_id <>', $tc_id);
		}
		
		$query = $this->db->get();
		
		if( $query->num_rows() > 0 ) {
			$returnVal = $query->result();
		}
		
		return $returnVal;		
		
	}
	
	function filter_tcard( $filter_data ) {
		
		$returnVal = NULL;
		
		$this->db->select('tc.tc_id, v.v_no, e.e_timeout');
		$this->db->from('tcards tc');
		$this->db->join('vans v', 'tc.v_id = v.v_id');
		$this->db->join('exit_passes e', 'e.tc_id = tc.tc_id', 'left');
		$this->db->join('tcard_incoming_materials tim', 'tc.tc_id = tim.tc_id', 'left');
		$this->db->join('tcard_outgoing_materials tom', 'tc.tc_id = tom.tc_id', 'left');
		
		// Tcard Type
		if( $filter_data['tcard_type'] ) {
			$this->db->where('tc.tt_id', $filter_data['tcard_type']);
		}
		
		// Van Type
		if( $filter_data['van_type'] ) {
			$this->db->where('tc.vt_id', $filter_data['van_type']);
		}
				
		// Van No
		if( $filter_data['van_no'] ) {
			$this->db->where('v.v_no LIKE "%'. $filter_data['van_no'] .'%"');
		}
		
		// Bin No
		if( $filter_data['bin_no'] ) {
			$this->db->where('tc.tc_bin LIKE "%'. $filter_data['bin_no'] .'%"');
		}
		
		// Shipper
		if( $filter_data['shipper'] ) {
			$this->db->where('tc.s_id', $filter_data['shipper']);
		}
		
		// Trucker
		if( $filter_data['trucker'] ) {
			$this->db->where('tc.t_id', $filter_data['trucker']);
		}
		
		// Batch Code
		if( $filter_data['batch_code'] ) {
			$this->db->where('tc.tc_batchcode LIKE "%'. $filter_data['batch_code'] .'%"');
		}
		
		// Seal No
		if( $filter_data['seal_no'] ) {
			$this->db->where('tc.tc_sealno LIKE "%'. $filter_data['seal_no'] .'%"');
		}
		
		// DN No
		if( $filter_data['dn'] ) {
			$this->db->where('tc.tc_dn LIKE "%'. $filter_data['dn'] .'%"');
		}
		
		// Status
		if( $filter_data['status'] ) {
			$this->db->where('tc.tc_status LIKE "%'. $filter_data['status'] .'%"');
		}
		
		// Incoming Materials
		if( $filter_data['incoming_mat'] ) {
			$this->db->where_in('tim.im_id', $filter_data['incoming_mat']);
			$this->db->where('tim.is_deleted <>', TRUE);
			$this->db->group_by('tim.tc_id');
			$this->db->having('COUNT(tim.im_id) = '. count($filter_data['incoming_mat']), FALSE);
		}
		
		// Outgoing Materials
		if( $filter_data['outgoing_mat'] ) {
			$this->db->where_in('tom.m_id', $filter_data['outgoing_mat']);
			$this->db->where('tom.is_deleted <>', TRUE);
			$this->db->group_by('tom.tc_id');
			$this->db->having('COUNT(tom.m_id) = '. count($filter_data['outgoing_mat']), FALSE);
		}
		
		// Entry Date Range
		if( $filter_data['entry_from'] || $filter_data['entry_to'] ) {
// 			$this->db->where( 'tc.tc_entrydate BETWEEN '. ($filter_data['entry_from'] ? " '". $filter_data['entry_from'] ."'" : '0') .' AND '. ($filter_data['entry_to'] ? " DATE_ADD('". $filter_data['entry_to'] ."', INTERVAL 1 DAY)" : 'NOW()') );
			$this->db->where('DATE(tc.tc_entrydate) >= ' .  ($filter_data['entry_from'] ? " '". $filter_data['entry_from'] ."'" : '0') . ' AND DATE(tc.tc_entrydate) < '. ($filter_data['entry_to'] ? " DATE_ADD('". $filter_data['entry_to'] ."', INTERVAL 1 DAY)" : 'NOW()') );
		}
		
		// Exit Date Range
		if( $filter_data['exit_from'] || $filter_data['exit_to'] ) {
// 			$this->db->where( 'e.e_date BETWEEN '. ($filter_data['exit_from'] ? " '". $filter_data['exit_from'] ."'" : '0') .' AND '. ($filter_data['exit_to'] ? " DATE_ADD('". $filter_data['exit_to'] ."', INTERVAL 1 DAY)" : 'NOW()') );
			$this->db->where('DATE(e.e_date) >= ' .  ($filter_data['exit_from'] ? " '". $filter_data['exit_from'] ."'" : '0') . ' AND DATE(e.e_date) < '. ($filter_data['exit_to'] ? " DATE_ADD('". $filter_data['exit_to'] ."', INTERVAL 1 DAY)" : 'NOW()') );
			$this->db->where('e.e_timeout IS NOT NULL');
		}
		
		// Stuff Date Range
		if( $filter_data['stuff_from'] || $filter_data['stuff_to'] ) {
// 			$this->db->where( 'tc.tc_datestuffed BETWEEN '. ($filter_data['stuff_from'] ? " '". $filter_data['stuff_from'] ."'" : '0') .' AND '. ($filter_data['stuff_to'] ? " DATE_ADD('". $filter_data['stuff_to'] ."', INTERVAL 1 DAY)" : 'NOW()') );
			$this->db->where('DATE(tc.tc_datestuffed) >= ' .  ($filter_data['stuff_from'] ? " '". $filter_data['stuff_from'] ."'" : '0') . ' AND DATE(tc.tc_datestuffed) < '. ($filter_data['stuff_to'] ? " DATE_ADD('". $filter_data['stuff_to'] ."', INTERVAL 1 DAY)" : 'NOW()') );
		}
		
		// Strip Date Range
		if( $filter_data['strip_from'] || $filter_data['strip_to'] ) {
// 			$this->db->where( 'tc.tc_datestripped BETWEEN '. ($filter_data['strip_from'] ? " '". $filter_data['strip_from'] ."'" : '0') .' AND '. ($filter_data['strip_to'] ? " DATE_ADD('". $filter_data['strip_to'] ."', INTERVAL 1 DAY)" : 'NOW()') );
			$this->db->where('DATE(tc.tc_datestripped) >= ' .  ($filter_data['strip_from'] ? " '". $filter_data['strip_from'] ."'" : '0') . ' AND DATE(tc.tc_datestripped) < '. ($filter_data['strip_to'] ? " DATE_ADD('". $filter_data['strip_to'] ."', INTERVAL 1 DAY)" : 'NOW()') );
		}
		
		// Seal Date Range
		if( $filter_data['seal_from'] || $filter_data['seal_to'] ) {
// 			$this->db->where( 'tc.tc_datesealed BETWEEN '. ($filter_data['seal_from'] ? " '". $filter_data['seal_from'] ."'" : '0') .' AND '. ($filter_data['seal_to'] ? " DATE_ADD('". $filter_data['seal_to'] ."', INTERVAL 1 DAY)" : 'NOW()') );
			$this->db->where('DATE(tc.tc_datesealed) >= ' .  ($filter_data['seal_from'] ? " '". $filter_data['seal_from'] ."'" : '0') . ' AND DATE(tc.tc_datesealed) < '. ($filter_data['seal_to'] ? " DATE_ADD('". $filter_data['seal_to'] ."', INTERVAL 1 DAY)" : 'NOW()') );
		}
		
		// RDD Range
		if( $filter_data['rdd_from'] || $filter_data['rdd_to'] ) {
// 			$this->db->where( 'tc.tc_rdd BETWEEN '. ($filter_data['rdd_from'] ? " '". $filter_data['rdd_from'] ."'" : '0') .' AND '. ($filter_data['rdd_to'] ? " DATE_ADD('". $filter_data['rdd_to'] ."', INTERVAL 1 DAY)" : 'NOW()') );
			$this->db->where('DATE(tc.tc_rdd) >= ' .  ($filter_data['rdd_from'] ? " '". $filter_data['rdd_from'] ."'" : '0') . ' AND DATE(tc.tc_rdd) < '. ($filter_data['rdd_to'] ? " DATE_ADD('". $filter_data['rdd_to'] ."', INTERVAL 1 DAY)" : 'NOW()') );
		}
		
		// Block Date Range
		if( $filter_data['block_from'] || $filter_data['block_to'] ) {
// 			$this->db->where( 'tc.tc_dateblocked BETWEEN '. ($filter_data['block_from'] ? " '". $filter_data['block_from'] ."'" : '0') .' AND '. ($filter_data['block_to'] ? " DATE_ADD('". $filter_data['block_to'] ."', INTERVAL 1 DAY)" : 'NOW()') );
			$this->db->where('DATE(tc.tc_dateblocked) >= ' .  ($filter_data['block_from'] ? " '". $filter_data['block_from'] ."'" : '0') . ' AND DATE(tc.tc_dateblocked) < '. ($filter_data['block_to'] ? " DATE_ADD('". $filter_data['block_to'] ."', INTERVAL 1 DAY)" : 'NOW()') );
		}
		
		// Existing Vans Only
		if( $filter_data['existing_only'] ) {
			$this->db->where('e.e_timeout IS NULL');
		}
		
		// Previous Vans Only
		if( $filter_data['previous_only'] ) {
			$this->db->where('e.e_timeout IS NOt NULL');
		}
		
		$this->db->group_by('tc.tc_id');
		$this->db->order_by('tc.tc_entrydate', 'DESC');
		
		$query = $this->db->get();
		
		if( $query->num_rows() > 0 ) {
			$returnVal = $query->result();
		}
		
		return $returnVal;
	}
	
	function print_filter($id) {
	
		//concatinates all the IDs from the search filter
		$concatid = '';
	
		for($i = 0; $i<count($id); $i++) {
			if($i<(count($id) - 1)){
				$concatid .= "'" . $id[$i] . "',";
			} else {
				$concatid .= "'" . $id[$i] . "'";
			}
		}
	
		$sql = "
			SELECT 	tc.tc_id as 'tcid', 
					v.v_no as 'Van #', 
					s.s_name as 'Shipper', 
					t.t_name as 'Trucker', 
					vt.vt_name as 'Van Type', 
					tt.tt_name as 'Tcard Type', 
					tc.tc_bin as 'BIN Tag', 
					tc.tc_batchcode as 'Batch Code', 
					tc.tc_sealno as 'Seal #', 
					tc.tc_dn as 'DN #', 
					tc.tc_entrydate as 'Entry Date', 
					tc.tc_rdd as 'RDD',
					CONCAT(e.e_date,' ', e.e_timeout) as 'Exit Date',
					tc.tc_datestuffed as 'Date Stuffed',
					tc.tc_datesealed as 'Date Sealed',
					tc.tc_dateblocked as 'Date Blocked',
                    tc.tc_datestripped as 'Date Stripped',
					m.m_description as 'Material Desc(Outgoing)', 
					m.m_name as 'Material(Outgoing)', 
					CONCAT(u.u_lastname, u.u_firstname, u.u_mi) as 'CY Controller', 
					e.e_driver as 'Driver', 
					e.e_destination as 'Destination', 
					e.e_plateno as 'Plate #', 
					tc.tc_block_reason as 'Reason/Defect',
                    CASE WHEN e.e_date IS NULL THEN concat(datediff(now(), tc.tc_entrydate), ' day/s') END AS 'Dwell Time',
                    CASE WHEN e.e_date IS NULL THEN tp.tp_position END AS 'Position',
                    GROUP_CONCAT(im.im_name separator ', ') as 'Material(Incoming)', 
                    im.im_category as 'Material Group(Incoming)'
			FROM tcards tc
			INNER JOIN vans v
			ON tc.v_id = v.v_id
			INNER JOIN truckers t
			ON tc.t_id = t.t_id
			INNER JOIN shippers s
			ON tc.s_id = s.s_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
			INNER JOIN tcard_types tt
			ON tc.tt_id = tt.tt_id
			INNER JOIN users u
			ON tc.u_id = u.u_id
			LEFT JOIN tcard_incoming_materials tim
			ON tc.tc_id = tim.tc_id
            LEFT JOIN incoming_materials im
			ON im.im_id = tim.im_id
			LEFT JOIN tcard_outgoing_materials tom
			ON tc.tc_id = tom.tc_id
            LEFT JOIN materials m
			ON m.m_id = tom.m_id
			LEFT JOIN exit_passes e
			ON e.tc_id = tc.tc_id
            LEFT JOIN (SELECT *
				FROM (SELECT * 
					FROM tcard_position
					ORDER BY tp_timestamp DESC) as temptable
				GROUP BY tc_id) as tp
            ON tp.tc_id = tc.tc_id
			WHERE tc.tc_id in (" . $concatid . ")
			GROUP BY tc.tc_id;
		";
	
		$query = $this->db->query($sql);
	
		return $query->result();
	
	}
	
	function get_total_teu() {

		$sql = "
			SELECT sum(case vt.vt_id when 2 then 2 else 1 end) as TEU
			FROM tcards tc
            INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
            LEFT JOIN exit_passes e
			ON e.tc_id = tc.tc_id
            WHERE (e.e_driver = '' || e.e_plateno = '' || e.e_id IS NULL);
        ";

		$query = $this->db->query($sql);
	
		return $query->result();

	}

	function get_total_by_van_type() {

		$sql = "
			SELECT vt.vt_name, count(vt.vt_id) as vans
			FROM tcards tc
            INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
            LEFT JOIN exit_passes e
			ON e.tc_id = tc.tc_id
            WHERE (e.e_driver = '' || e.e_plateno = '' || e.e_id IS NULL) && (vt.vt_id != 3)
            GROUP BY vt.vt_id
        ";

		$query = $this->db->query($sql);
	
		return $query->result();
		
	}

	function get_total_by_tcard_type() {

		$sql = "
			SELECT tt.tt_id, tt.tt_name, count(tt.tt_id) as vans
			FROM tcards tc
            INNER JOIN tcard_types tt
			ON tc.tt_id = tt.tt_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
            LEFT JOIN exit_passes e
			ON e.tc_id = tc.tc_id
            WHERE (e.e_driver = '' || e.e_plateno = '' || e.e_id IS NULL) && (vt.vt_id != 3)
            GROUP BY tt.tt_id
        ";

		$query = $this->db->query($sql);
	
		return $query->result();		

	}

	function get_dwell_time_list() {

		$sql = "
			SELECT tc.tc_id, v.v_no, DATEDIFF(NOW(), tc_entrydate) as dwell_time
			FROM tcards tc
			INNER JOIN vans v
 			ON tc.v_id = v.v_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
			LEFT JOIN exit_passes e
			ON e.tc_id = tc.tc_id
			WHERE (e.e_driver = '' || e.e_plateno = '' || e.e_id IS NULL) && (vt.vt_id != 3) && (DATEDIFF(NOW(), tc_entrydate) > 7)
			ORDER BY tc_entrydate ASC
			LIMIT 5
        ";

		$query = $this->db->query($sql);
	
		return $query->result();		

	}
	
	function exitpass_serial() {
		$this->db->select('(fnExitPassNo()) AS serial', FALSE);
	
		$query = $this->db->get();
		$tcard = $query->result();
		$tcard = $tcard[0];
	
		return $tcard->serial;
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
	
	function update_tcard_exitpass( $tcard_id, $data ) {
		$this->db->where('tc_id', $tcard_id);
		$this->db->update('exit_passes', $data);
	}
	
	function update_tcard_incoming_materials( $tcard_id, $data ){
		$this->db->where('tc_id', $tcard_id);
		$this->db->update('tcard_incoming_materials', $data);
	}
	
	function update_tcard_outgoing_materials( $tcard_id, $data ){
		$this->db->where('tc_id', $tcard_id);
		$this->db->update('tcard_outgoing_materials', $data);
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
	
	function flush_tcard_outgoing_materials( $tcard_id ) {
		$data = array(
				'is_deleted' => TRUE
		);
	
		$this->db->where('tc_id', $tcard_id);
		$this->db->update('tcard_outgoing_materials', $data);
	}
	
	function purge_tcard_exit_pass( $tcard_id ) {
		$this->db->where( 'tc_id', $tcard_id );
		$this->db->delete( 'exit_passes' );
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