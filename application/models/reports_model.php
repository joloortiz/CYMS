<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Reports_model extends CI_Model{

	function dispatch_standings_fulls() {

		$sql = "
			SELECT s.s_name, vt.vt_name, sum(case vt.vt_name when '40' then 2 else 1 end) as TEU
			FROM tcards tc
			INNER JOIN shippers s
			ON tc.s_id = s.s_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
			INNER JOIN tcard_types tt
			ON tc.tt_id = tt.tt_id
			LEFT JOIN exit_passes e
			ON e.tc_id = tc.tc_id
			WHERE 	(tc.tc_datestuffed IS NOT NULL || tc.tc_datesealed IS NOT NULL || e.e_id IS NOT NULL) && 
					((s.s_id = 2 && vt.vt_id = 1) || 
					(s.s_id = 2 && vt.vt_id = 2) ||
					(s.s_id = 3 && vt.vt_id = 1) || 
					(s.s_id = 4 && vt.vt_id = 1) || 
					(s.s_id = 5 && vt.vt_id = 1) ||
					(s.s_id = 6 && vt.vt_id = 1) ||
					(s.s_id = 6 && vt.vt_id = 2) ||
					(s.s_id = 7 && vt.vt_id = 1) ||
					(s.s_id = 7 && vt.vt_id = 2) ||
					(s.s_id = 8 && vt.vt_id = 3) ||
					(s.s_id = 9 && vt.vt_id = 3) ||
					(s.s_id = 10 && vt.vt_id = 1) || 
					(s.s_id = 11 && vt.vt_id = 1) ||
					(s.s_id = 11 && vt.vt_id = 2)) && 
					(tt.tt_id != 6 && tc.tc_status != 'EMPTY') && 
					(tc.is_blocked = FALSE && tc.is_defective = FALSE) && 
					(e.e_date = CURDATE())
			GROUP by vt.vt_name, s.s_name;
		";

		$query = $this->db->query($sql);

		return $query->result();

	}

	function dispatch_standings_exfac() {

		$sql = "
			SELECT s.s_name, vt.vt_name, sum(case vt.vt_name when '40' then 2 else 1 end) as TEU
			FROM tcards tc
			INNER JOIN shippers s
			ON tc.s_id = s.s_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
			INNER JOIN tcard_types tt
			ON tc.tt_id = tt.tt_id
			LEFT JOIN exit_passes e
			ON e.tc_id = tc.tc_id
			WHERE 	(tc.tc_datestuffed IS NOT NULL || tc.tc_datesealed IS NOT NULL || e.e_id IS NOT NULL) && 
					((s.s_id = 2 && vt.vt_id = 1) || 
					(s.s_id = 3 && vt.vt_id = 1) || 
					(s.s_id = 4 && vt.vt_id = 1) || 
					(s.s_id = 13 && vt.vt_id = 3) ||
					(s.s_id = 10 && vt.vt_id = 1) || 
					(s.s_id = 11 && vt.vt_id = 1) || 
					(s.s_id = 11 && vt.vt_id = 2)) && 
					(tt.tt_id = 6) && 
					(tc.is_blocked = FALSE && tc.is_defective = FALSE) &&
					(e.e_date = CURDATE())
			GROUP by vt.vt_name, s.s_name;		
		";

		$query = $this->db->query($sql);

		return $query->result();

	}

	function pending_fulls_sealed() {

		$sql = "
			SELECT s.s_name, vt.vt_name, sum(case vt.vt_name when '40' then 2 else 1 end) as TEU
			FROM tcards tc
			INNER JOIN shippers s
			ON tc.s_id = s.s_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
			INNER JOIN tcard_types tt
			ON tc.tt_id = tt.tt_id
			LEFT JOIN exit_passes e
			ON e.tc_id = tc.tc_id
			WHERE 	(tc.tc_datesealed IS NOT NULL && e.e_id IS NULL) && 
					(tc.tc_datestuffed IS NOT NULL && tc.tc_dn != '') && 
					((s.s_id = 2 && vt.vt_id = 1) || 
					(s.s_id = 2 && vt.vt_id = 2) ||
					(s.s_id = 3 && vt.vt_id = 1) || 
					(s.s_id = 4 && vt.vt_id = 1) || 
					(s.s_id = 5 && vt.vt_id = 1) ||
					(s.s_id = 6 && vt.vt_id = 1) ||
					(s.s_id = 6 && vt.vt_id = 2) ||
					(s.s_id = 7 && vt.vt_id = 1) ||
					(s.s_id = 7 && vt.vt_id = 2) ||
					(s.s_id = 8 && vt.vt_id = 3) ||
					(s.s_id = 9 && vt.vt_id = 3) ||
					(s.s_id = 10 && vt.vt_id = 1) || 
					(s.s_id = 11 && vt.vt_id = 1) ||
					(s.s_id = 11 && vt.vt_id = 2)) && 
					(tt.tt_id != 6 && tc.tc_status != 'EMPTY') && 
					(tc.is_blocked = FALSE && tc.is_defective = FALSE)
			GROUP by vt.vt_name, s.s_name;	
		";

		$query = $this->db->query($sql);

		return $query->result();	

	}

	function pending_fulls_unsealed() {

		$sql = "
			SELECT s.s_name, vt.vt_name, sum(case vt.vt_name when '40' then 2 else 1 end) as TEU
			FROM tcards tc
			INNER JOIN shippers s
			ON tc.s_id = s.s_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
			INNER JOIN tcard_types tt
			ON tc.tt_id = tt.tt_id
			LEFT JOIN exit_passes e
			ON e.tc_id = tc.tc_id
			WHERE 	(tc.tc_datesealed IS NULL && e.e_id IS NULL) && 
					(tc.tc_datestuffed IS NOT NULL && tc.tc_dn != '') && 
					((s.s_id = 2 && vt.vt_id = 1) || 
					(s.s_id = 2 && vt.vt_id = 2) ||
					(s.s_id = 3 && vt.vt_id = 1) || 
					(s.s_id = 4 && vt.vt_id = 1) || 
					(s.s_id = 5 && vt.vt_id = 1) ||
					(s.s_id = 6 && vt.vt_id = 1) ||
					(s.s_id = 6 && vt.vt_id = 2) ||
					(s.s_id = 7 && vt.vt_id = 1) ||
					(s.s_id = 7 && vt.vt_id = 2) ||
					(s.s_id = 8 && vt.vt_id = 3) ||
					(s.s_id = 9 && vt.vt_id = 3) ||
					(s.s_id = 10 && vt.vt_id = 1) || 
					(s.s_id = 11 && vt.vt_id = 1) ||
					(s.s_id = 11 && vt.vt_id = 2)) && 
					(tt.tt_id != 6 && tc.tc_status != 'EMPTY') && 
					(tc.is_blocked = FALSE && tc.is_defective = FALSE)
			GROUP by vt.vt_name, s.s_name;		
		";

		$query = $this->db->query($sql);

		return $query->result();	

	}

	function pending_exfac_sealed() {

		$sql = "
			SELECT s.s_name, vt.vt_name, sum(case vt.vt_name when '40' then 2 else 1 end) as TEU
			FROM tcards tc
			INNER JOIN shippers s
			ON tc.s_id = s.s_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
			INNER JOIN tcard_types tt
			ON tc.tt_id = tt.tt_id
			LEFT JOIN exit_passes e
			ON e.tc_id = tc.tc_id
			WHERE 	(tc.tc_datesealed IS NOT NULL && e.e_id IS NULL) && 
					(tc.tc_datestuffed IS NOT NULL && tc.tc_dn != '') && 
					((s.s_id = 2 && vt.vt_id = 1) || 
					(s.s_id = 3 && vt.vt_id = 1) || 
					(s.s_id = 4 && vt.vt_id = 1) || 
					(s.s_id = 13 && vt.vt_id = 3) ||
					(s.s_id = 10 && vt.vt_id = 1) || 
					(s.s_id = 11 && vt.vt_id = 1) ||
					(s.s_id = 11 && vt.vt_id = 1)) && 
					(tt.tt_id = 6) && 
					(tc.is_blocked = FALSE && tc.is_defective = FALSE)
			GROUP by vt.vt_name, s.s_name;			
		";

		$query = $this->db->query($sql);

		return $query->result();		

	}

	function pending_exfac_unsealed() {

		$sql = "
			SELECT s.s_name, vt.vt_name, sum(case vt.vt_name when '40' then 2 else 1 end) as TEU
			FROM tcards tc
			INNER JOIN shippers s
			ON tc.s_id = s.s_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
			INNER JOIN tcard_types tt
			ON tc.tt_id = tt.tt_id
			LEFT JOIN exit_passes e
			ON e.tc_id = tc.tc_id
			WHERE 	(tc.tc_datesealed IS NULL && e.e_id IS NULL) && 
					(tc.tc_datestuffed IS NOT NULL && tc.tc_dn != '') &&
					((s.s_id = 2 && vt.vt_id = 1) || 
					(s.s_id = 3 && vt.vt_id = 1) || 
					(s.s_id = 4 && vt.vt_id = 1) || 
					(s.s_id = 13 && vt.vt_id = 3) ||
					(s.s_id = 10 && vt.vt_id = 1) || 
					(s.s_id = 11 && vt.vt_id = 1) ||
					(s.s_id = 11 && vt.vt_id = 1)) && 
					(tt.tt_id = 6) && 
					(tc.is_blocked = FALSE && tc.is_defective = FALSE)
			GROUP by vt.vt_name, s.s_name;		
		";

		$query = $this->db->query($sql);

		return $query->result();		

	}

	function empty_vans_running_balance_shippers() {

		$sql = "
			SELECT tc.tc_id, s.s_id, s.s_name, vt.vt_id, vt.vt_name, count(tc.tc_id) as vans
			FROM tcards tc
			INNER JOIN shippers s
			ON tc.s_id = s.s_id
			INNER JOIN truckers t
			ON tc.t_id = t.t_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
			INNER JOIN tcard_types tt
			ON tc.tt_id = tt.tt_id
			INNER JOIN tcard_type_group ttg
			ON tt.ttg_id = ttg.ttg_id
			LEFT JOIN exit_passes e
			ON e.tc_id = tc.tc_id
			WHERE 	(tc.tc_status = 'EMPTY' && e.e_id IS NULL) &&
					(ttg.ttg_name = 'Stuffing') && 
					((s.s_id = 2 && vt.vt_id = 1) || 
					(s.s_id = 2 && vt.vt_id = 2) || 
					(s.s_id = 3 && vt.vt_id = 1) || 
					(s.s_id = 4 && vt.vt_id = 1) || 
					(s.s_id = 6 && vt.vt_id = 1) || 
					(s.s_id = 6 && vt.vt_id = 2) || 
					(s.s_id = 5 && vt.vt_id = 1) || 
					(s.s_id = 9 && vt.vt_id = 1) || 
					(s.s_id = 11 && vt.vt_id = 1) ||
					(s.s_id = 11 && vt.vt_id = 2) ||
					(s.s_id = 13 && vt.vt_id = 1) ||
					(s.s_id = 18 && vt.vt_id = 1) ||
					(s.s_id = 19 && vt.vt_id = 1)) && 
					(tc.is_blocked = FALSE && tc.is_defective = FALSE)
			GROUP by vt.vt_name, s.s_name; 		
		";

		$query = $this->db->query($sql);

		return $query->result();

	}

	function empty_vans_running_balance_truckers() {

		$sql = "
			SELECT tc.tc_id, t.t_id, t.t_code, vt.vt_id, vt.vt_name, count(tc.tc_id) as vans
			FROM tcards tc
			INNER JOIN shippers s
			ON tc.s_id = s.s_id
			INNER JOIN truckers t
			ON tc.t_id = t.t_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
			INNER JOIN tcard_types tt
			ON tc.tt_id = tt.tt_id
			INNER JOIN tcard_type_group ttg
			ON tt.ttg_id = ttg.ttg_id
			LEFT JOIN exit_passes e
			ON e.tc_id = tc.tc_id
			WHERE 	(tc.tc_status = 'EMPTY' && e.e_id IS NULL) &&
					(ttg.ttg_name = 'Stuffing') && 
					((t.t_id = 4 && vt.vt_id = 1) ||
					 (t.t_id = 2 && vt.vt_id = 1) || 
					 (t.t_id = 4 && vt.vt_id = 1)) &&
					((s.s_id != 2) && 
					 (s.s_id != 2) && 
					 (s.s_id != 3) && 
					 (s.s_id != 4) && 
					 (s.s_id != 6) && 
					 (s.s_id != 6) && 
					 (s.s_id != 5) && 
					 (s.s_id != 9) && 
					 (s.s_id != 11) &&
					 (s.s_id != 11) &&
					 (s.s_id != 13) &&
					 (s.s_id != 18) &&
					 (s.s_id != 19)) &&
					(tc.is_blocked = FALSE && tc.is_defective = FALSE)
			GROUP by vt.vt_name, s.s_name; 		
		";

		$query = $this->db->query($sql);

		return $query->result();

	}

	function defective_vans() {

		$sql = "
			SELECT v.v_no, tc.tc_entrydate, s.s_id, s.s_name, t.t_id, t.t_name, vt.vt_id, vt.vt_name, tc.tc_block_reason
			FROM tcards tc
			INNER JOIN shippers s
			ON tc.s_id = s.s_id
			INNER JOIN truckers t
			ON tc.t_id = t.t_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
			INNER JOIN vans v
			on tc.v_id = v.v_id
			LEFT JOIN exit_passes e
			on e.tc_id = tc.tc_id
			WHERE is_blocked = TRUE && is_defective = TRUE && e.e_id IS NULL
			GROUP by vt.vt_name, s.s_name; 	
		";

		$query = $this->db->query($sql);

		return $query->result();

	}

	/*
	*
	* Daily Inventory Report
	* 
	*/

	function di_stripping_packmats() {

		$sql = "
			SELECT im.im_id, 
					vt.vt_id, 
					t.t_id, 
					im.im_name, 
					vt.vt_name,  
					t.t_name, 
					t.t_code, 
					count(tc.tc_id) as vans, 
					ttg.ttg_name, 
					im.im_category
			FROM tcards tc
			INNER JOIN vans v
			ON tc.v_id = v.v_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
			INNER JOIN truckers t
			ON tc.t_id = t.t_id
			INNER JOIN tcard_types tt
			ON tc.tt_id = tt.tt_id
			INNER JOIN tcard_type_group ttg
			ON tt.ttg_id = ttg.ttg_id
			LEFT JOIN tcard_incoming_materials tim
			ON tc.tc_id = tim.tc_id
			LEFT JOIN incoming_materials im
			ON im.im_id = tim.im_id
			LEFT JOIN exit_passes e
			ON e.tc_id = tc.tc_id
			WHERE 
				((im.im_id = 1 && vt.vt_id = 2 && t.t_id = 3) || 
			     
			     (im.im_id = 2 && vt.vt_id = 2 && t.t_id = 8) ||
			     
			     (im.im_id = 3 && vt.vt_id = 1 && t.t_id = 3) ||
			     
			     (im.im_id = 3 && vt.vt_id = 2 && t.t_id = 3) ||
			     
			     (im.im_id = 3 && vt.vt_id = 1 && t.t_id = 8) ||
			     
			     (im.im_id = 3 && vt.vt_id = 2 && t.t_id = 8) || 
			     
			     (im.im_id = 1 && vt.vt_id = 1 && t.t_id = 3) ||
			     
			     (im.im_id = 1 && vt.vt_id = 1 && t.t_id = 8) || 
			     
			     (im.im_id = 4 && vt.vt_id = 1 && t.t_id = 2) || 
			     
			     (im.im_id = 5 && vt.vt_id = 1 && t.t_id = 2) || 
			     
			     (im.im_id = 6 && vt.vt_id = 1 && t.t_id = 2) ||
			     
			     (im.im_id = 7 && vt.vt_id = 1 && t.t_id = 2) ||
			     
			     (im.im_id = 8 && vt.vt_id = 1 && t.t_id = 2) ||
			     
			     (im.im_id = 9 && vt.vt_id = 1 && t.t_id = 2) ||
			     
			     (im.im_id = 10 && vt.vt_id = 1 && t.t_id = 7) ||
			     
			     (im.im_id = 11 && vt.vt_id = 1 && t.t_id = 2) ||
			     
			     (im.im_id = 12 && vt.vt_id = 1 && t.t_id = 2) ||
			     
			     (im.im_id = 13 && vt.vt_id = 1 && t.t_id = 2) ||
			     
			     (im.im_id = 14 && vt.vt_id = 1 && t.t_id = 2) ||
			     
			     (im.im_id = 14 && vt.vt_id = 2 && t.t_id = 2) ||
			     
			     (im.im_id = 15 && vt.vt_id = 1 && t.t_id = 8) ||
			     
			     (im.im_id = 16 && vt.vt_id = 2 && t.t_id = 2) ||
			     
			     (im.im_id = 17 && vt.vt_id = 1 && t.t_id = 2) ||
			     
			     (im.im_id = 18 && vt.vt_id = 1 && t.t_id = 7) ||
			     
			     (im.im_id = 19 && vt.vt_id = 1 && t.t_id = 7) ||
			     
			     (im.im_id = 20 && vt.vt_id = 1 && t.t_id = 2) ||
			     
			     (im.im_id = 21 && vt.vt_id = 1 && t.t_id = 2) ||
			     
			     (im.im_id = 21 && vt.vt_id = 2 && t.t_id = 2) ||     
			     
			     (im.im_id = 22 && vt.vt_id = 1 && t.t_id = 2) ||
			     
			     (im.im_id = 23 && vt.vt_id = 4 && t.t_id = 2)     
			     
				)
			    &&
				(ttg.ttg_id = 2 && tt.tt_id = 3) &&
				(tc.tc_status = 'FULLS' && e.e_id IS NULL) &&
				(tc.is_blocked = FALSE && tc.is_defective = FALSE)
			GROUP BY im.im_name, vt.vt_name, t.t_name
		";

		$query = $this->db->query($sql);

		return $query->result();

	}

	function di_stripping_rawmats() {

		$sql = "
			SELECT im.im_id, 
					vt.vt_id, 
					t.t_id, 
					s.s_id,
					im.im_name, 
					vt.vt_name,  
					t.t_name,
					s.s_name, 
					t.t_code, 
					count(tc.tc_id) as vans, 
					ttg.ttg_name, 
					im.im_category
			FROM tcards tc
			INNER JOIN vans v
			ON tc.v_id = v.v_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
			INNER JOIN truckers t
			ON tc.t_id = t.t_id
			INNER JOIN shippers s
			ON tc.s_id = s.s_id
			INNER JOIN tcard_types tt
			ON tc.tt_id = tt.tt_id
			INNER JOIN tcard_type_group ttg
			ON tt.ttg_id = ttg.ttg_id
			LEFT JOIN tcard_incoming_materials tim
			ON tc.tc_id = tim.tc_id
			LEFT JOIN incoming_materials im
			ON im.im_id = tim.im_id
			LEFT JOIN exit_passes e
			ON e.tc_id = tc.tc_id
			WHERE 
				((im.im_id = 24 && vt.vt_id = 1 && t.t_id = 8) || 
			     
				 (im.im_id = 25 && vt.vt_id = 1 && t.t_id = 8) ||          
			     
				 (im.im_id = 26 && vt.vt_id = 1 && t.t_id = 8) || 

				 (im.im_id = 27 && vt.vt_id = 2 && t.t_id = 3) || 

				 (im.im_id = 27 && vt.vt_id = 1 && t.t_id = 3) || 

				 (im.im_id = 28 && vt.vt_id = 1 && t.t_id = 3) || 

				 (im.im_id = 29 && vt.vt_id = 1 && t.t_id = 7) || 

				 (im.im_id = 30 && vt.vt_id = 2 && t.t_id = 8) ||

				 (im.im_id = 31 && vt.vt_id = 2 && t.t_id = 8) ||

				 (im.im_id = 32 && vt.vt_id = 1 && t.t_id = 3) ||

				 (im.im_id = 33 && vt.vt_id = 1 && t.t_id = 3) ||  

				 (im.im_id = 34 && vt.vt_id = 1 && s.s_id = 3) || 

				 (im.im_id = 35 && vt.vt_id = 1 && t.t_id = 2) ||

				 (im.im_id = 36 && vt.vt_id = 1 && t.t_id = 3) ||  

				 (im.im_id = 37 && vt.vt_id = 1 && t.t_id = 3) || 

				 (im.im_id = 38 && vt.vt_id = 1 && t.t_id = 2) || 

				 (im.im_id = 39 && vt.vt_id = 1 && (s.s_id = 2 || s.s_id = 3)) || 

				 (im.im_id = 40 && vt.vt_id = 1 && (s.s_id = 2 || s.s_id = 3)) || 

				 (im.im_id = 41 && vt.vt_id = 1 && t.t_id = 2)

				)
			    &&
				(ttg.ttg_id = 2 && tt.tt_id = 4) && 
				(tc.tc_status = 'FULLS' && e.e_id IS NULL) &&
				(tc.is_blocked = FALSE && tc.is_defective = FALSE)
			GROUP BY im.im_name, vt.vt_name, t.t_name
		";

		$query = $this->db->query($sql);

		return $query->result();

	}

	function di_stripping_greencoffee() {

		$sql = "
			SELECT im.im_id, 
					vt.vt_id, 
					t.t_id, 
					s.s_id,
					im.im_name, 
					vt.vt_name,  
					t.t_name,
					s.s_name, 
					t.t_code, 
					count(tc.tc_id) as vans, 
					ttg.ttg_name, 
					im.im_category
			FROM tcards tc
			INNER JOIN vans v
			ON tc.v_id = v.v_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
			INNER JOIN truckers t
			ON tc.t_id = t.t_id
			INNER JOIN shippers s
			ON tc.s_id = s.s_id
			INNER JOIN tcard_types tt
			ON tc.tt_id = tt.tt_id
			INNER JOIN tcard_type_group ttg
			ON tt.ttg_id = ttg.ttg_id
			LEFT JOIN tcard_incoming_materials tim
			ON tc.tc_id = tim.tc_id
			LEFT JOIN incoming_materials im
			ON im.im_id = tim.im_id
			LEFT JOIN exit_passes e
			ON e.tc_id = tc.tc_id
			WHERE 
				((vt.vt_id = 1 && t.t_id = 3) || 

				 (vt.vt_id = 1 && t.t_id = 8) ||

				 (vt.vt_id = 1 && t.t_id = 7) ||

				 (vt.vt_id = 1 && t.t_id = 2) ||

				 (vt.vt_id = 1 && t.t_id = 4) ||

				 (vt.vt_id = 1 && t.t_id = 9) ||

				 (vt.vt_id = 1 && t.t_id = 1) ||

				 (vt.vt_id = 1 && t.t_id = 5) ||

				 (vt.vt_id = 1 && t.t_id = 6) ||

				 (vt.vt_id = 1 && t.t_id = 10) 

				)
			    &&
				(ttg.ttg_id = 2 && tt.tt_id = 1) && 
				(tc.tc_status = 'FULLS' && e.e_id IS NULL) &&
				(tc.is_blocked = FALSE && tc.is_defective = FALSE)
			GROUP BY im.im_name, vt.vt_name, t.t_name
		";

		$query = $this->db->query($sql);

		return $query->result();
	}

	function di_empty_for_return() {

		$sql = "
			SELECT 	tc.tc_id,
					s.s_id, 
					s.s_name,
					t.t_id, 
					t.t_name,
					vt.vt_id,  
					vt_name, 
					im.im_category,
					count(tc.tc_id) as vans
			FROM tcards tc
			INNER JOIN shippers s
			ON tc.s_id = s.s_id
            INNER JOIN truckers t
			ON tc.t_id = t.t_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
			INNER JOIN tcard_types tt
			ON tc.tt_id = tt.tt_id
			INNER JOIN tcard_type_group ttg
			ON tt.ttg_id = ttg.ttg_id
			LEFT JOIN exit_passes e
			ON e.tc_id = tc.tc_id
            LEFT JOIN tcard_incoming_materials tim
			ON tc.tc_id = tim.tc_id
			LEFT JOIN incoming_materials im
			ON im.im_id = tim.im_id
			WHERE 	(tc.tc_status = 'EMPTY' && e.e_id IS NULL) &&
					(ttg.ttg_name = 'Stripping') && 
					((t.t_id = 3 && vt.vt_id = 1) || 
					(t.t_id = 8 && vt.vt_id = 1) || 
					(t.t_id = 3 && vt.vt_id = 2) || 
					(t.t_id = 8 && vt.vt_id = 2) || 
					(t.t_id = 7 && vt.vt_id = 2) || 
					(t.t_id = 7 && vt.vt_id = 1) || 
					(t.t_id = 2 && vt.vt_id = 1) || 
					(t.t_id = 2 && vt.vt_id = 2) || 
					(t.t_id = 7 && vt.vt_id = 4) ||
					(t.t_id = 4 && vt.vt_id = 1)) && 
					(tc.is_blocked = FALSE && tc.is_defective = FALSE) && 
					im.im_category != 'TEMPLOAD'
			GROUP by im.im_category, vt.vt_name, t.t_name;
		";

		$query = $this->db->query($sql);

		return $query->result();

	}

	function di_defective_vans_shippers() {

		$sql = "
			SELECT v.v_no, tc.tc_entrydate, s.s_id, s.s_name, vt.vt_id, vt.vt_name, tc.tc_block_reason, count(tc.tc_id) as vans
			FROM tcards tc
			INNER JOIN shippers s
			ON tc.s_id = s.s_id
			INNER JOIN truckers t
			ON tc.t_id = t.t_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
			INNER JOIN vans v
			on tc.v_id = v.v_id
			LEFT JOIN exit_passes e
			on e.tc_id = tc.tc_id
			WHERE 	(is_blocked = TRUE && is_defective = TRUE && e.e_id IS NULL) &&
					((s.s_id = 4 && vt.vt_id = 1) ||
					 (s.s_id = 3 && vt.vt_id = 1) || 
					 (s.s_id = 19 && vt.vt_id = 1) ||				 
					 (s.s_id = 6 && vt.vt_id = 1) ||	
					 (s.s_id = 5 && vt.vt_id = 1) ||
					 (s.s_id = 17 && vt.vt_id = 1) ||
					 (s.s_id = 6 && vt.vt_id = 2) ||
					 (s.s_id = 2 && vt.vt_id = 1) ||
					 (s.s_id = 10 && vt.vt_id = 1))
			GROUP by s.s_name, vt.vt_name; 	
		";

		$query = $this->db->query($sql);

		return $query->result();

	}

	function di_defective_vans_truckers() {

		$sql = "
			SELECT v.v_no, tc.tc_entrydate, t.t_id, t.t_code, vt.vt_id, vt.vt_name, tc.tc_block_reason, count(tc.tc_id) as vans
			FROM tcards tc
			INNER JOIN shippers s
			ON tc.s_id = s.s_id
			INNER JOIN truckers t
			ON tc.t_id = t.t_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
			INNER JOIN vans v
			on tc.v_id = v.v_id
			LEFT JOIN exit_passes e
			on e.tc_id = tc.tc_id
			WHERE 	(is_blocked = TRUE && is_defective = TRUE && e.e_id IS NULL) &&
					((t.t_id = 7 && vt.vt_id = 1) ||
					 (t.t_id = 2 && vt.vt_id = 1) || 
					 (t.t_id = 4 && vt.vt_id = 1)
					 ) &&
					((s.s_id != 4) &&
					 (s.s_id != 3) && 
					 (s.s_id != 19) &&				 
					 (s.s_id != 6) &&	
					 (s.s_id != 5) &&
					 (s.s_id != 17) &&
					 (s.s_id != 6) &&
					 (s.s_id != 2) &&
					 (s.s_id != 10)
					)
			GROUP by t.t_code, vt.vt_name; 	
		";

		$query = $this->db->query($sql);

		return $query->result();

	}

	function di_finished_goods_shippers() {

		$sql = "
			SELECT 	m.m_id, 
					vt.vt_id, 
					s.s_id,
					m.m_description, 
					vt.vt_name,  
					s.s_name, 
					count(tc.tc_id) as vans,
                    tt.tt_name,
					ttg.ttg_name, 
					m.m_category,
                    m.m_type
			FROM tcards tc
			INNER JOIN vans v
			ON tc.v_id = v.v_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
			INNER JOIN truckers t
			ON tc.t_id = t.t_id
			INNER JOIN shippers s
			ON tc.s_id = s.s_id
			INNER JOIN tcard_types tt
			ON tc.tt_id = tt.tt_id
			INNER JOIN tcard_type_group ttg
			ON tt.ttg_id = ttg.ttg_id
			LEFT JOIN tcard_outgoing_materials tom
			ON tc.tc_id = tom.tc_id
			LEFT JOIN materials m
			ON m.m_id = tom.m_id
			LEFT JOIN exit_passes e
			ON e.tc_id = tc.tc_id
			WHERE 
            	((s.s_id = 20 && vt.vt_id = 1) ||
                 (s.s_id = 3 && vt.vt_id = 1) ||
                 (s.s_id = 19 && vt.vt_id = 1) ||
                 (s.s_id = 18 && vt.vt_id = 1) ||
                 (s.s_id = 17 && vt.vt_id = 1) ||
                 (s.s_id = 2 && vt.vt_id = 1) ||
                 (s.s_id = 2 && vt.vt_id = 2) ||
                 (s.s_id = 6 && vt.vt_id = 1) ||
                 (s.s_id = 6 && vt.vt_id = 2) ||
                 (s.s_id = 5 && vt.vt_id = 1)
                ) &&
				(ttg.ttg_id = 3 && m.m_category = 'FG' && tc.tc_dn != '') && 
				(tc.tc_status = 'FULLS' && e.e_id IS NULL && m.m_id IS NOT NULL) &&
				(tc.is_blocked = FALSE && tc.is_defective = FALSE)
			GROUP BY m.m_type, vt.vt_name, s.s_name, t.t_code
		";

		$query = $this->db->query($sql);

		return $query->result();
	}

		function di_finished_goods_truckers() {

		$sql = "
			SELECT 	m.m_id, 
					vt.vt_id, 
					t.t_id, 
					m.m_description, 
					vt.vt_name,  
					t.t_code, 
					count(tc.tc_id) as vans,
                    tt.tt_name,
					ttg.ttg_name, 
					m.m_category,
                    m.m_type
			FROM tcards tc
			INNER JOIN vans v
			ON tc.v_id = v.v_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
			INNER JOIN truckers t
			ON tc.t_id = t.t_id
			INNER JOIN shippers s
			ON tc.s_id = s.s_id
			INNER JOIN tcard_types tt
			ON tc.tt_id = tt.tt_id
			INNER JOIN tcard_type_group ttg
			ON tt.ttg_id = ttg.ttg_id
			LEFT JOIN tcard_outgoing_materials tom
			ON tc.tc_id = tom.tc_id
			LEFT JOIN materials m
			ON m.m_id = tom.m_id
			LEFT JOIN exit_passes e
			ON e.tc_id = tc.tc_id
			WHERE 
            	((t.t_id = 7 && vt.vt_id = 1) ||
                 (t.t_id = 4 && vt.vt_id = 1) ||
                 (t.t_id = 2 && vt.vt_id = 1) ||
                 (t.t_id = 10 && vt.vt_id = 1)
                ) && 
				((s.s_id != 20) &&
				 (s.s_id != 3) &&
				 (s.s_id != 19) &&
				 (s.s_id != 18) &&
				 (s.s_id != 17) &&
				 (s.s_id != 2) &&
				 (s.s_id != 6) &&
				 (s.s_id != 5)			
				) &&
				(ttg.ttg_id = 3 && m.m_category = 'FG' && tc.tc_dn != '') && 
				(tc.tc_status = 'FULLS' && e.e_id IS NULL && m.m_id IS NOT NULL) &&
				(tc.is_blocked = FALSE && tc.is_defective = FALSE)
			GROUP BY m.m_type, vt.vt_name, t.t_code
		";

		$query = $this->db->query($sql);

		return $query->result();
	}

	function di_semi_finished_goods_shippers() {

		$sql = "
			SELECT 	m.m_id, 
					vt.vt_id, 
					s.s_id,
					m.m_description, 
					vt.vt_name,  
					s.s_name, 
					count(tc.tc_id) as vans,
                    tt.tt_name,
					ttg.ttg_name, 
					m.m_category,
                    m.m_type,
                    tc.tc_id
			FROM tcards tc
			INNER JOIN vans v
			ON tc.v_id = v.v_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
			INNER JOIN truckers t
			ON tc.t_id = t.t_id
			INNER JOIN shippers s
			ON tc.s_id = s.s_id
			INNER JOIN tcard_types tt
			ON tc.tt_id = tt.tt_id
			INNER JOIN tcard_type_group ttg
			ON tt.ttg_id = ttg.ttg_id
			LEFT JOIN tcard_outgoing_materials tom
			ON tc.tc_id = tom.tc_id
			LEFT JOIN materials m
			ON m.m_id = tom.m_id
			LEFT JOIN exit_passes e
			ON e.tc_id = tc.tc_id
			WHERE 
            	((s.s_id = 20 && vt.vt_id = 1) ||
                 (s.s_id = 3 && vt.vt_id = 1) ||
                 (s.s_id = 19 && vt.vt_id = 1) ||
                 (s.s_id = 17 && vt.vt_id = 1) ||
                 (s.s_id = 2 && vt.vt_id = 1) ||
                 (s.s_id = 2 && vt.vt_id = 2) ||
                 (s.s_id = 16 && vt.vt_id = 1) ||
                 (s.s_id = 18 && vt.vt_id = 1) ||
                 (s.s_id = 6 && vt.vt_id = 1) ||
                 (s.s_id = 6 && vt.vt_id = 2) ||
                 (s.s_id = 5 && vt.vt_id = 1)
                ) &&
				(ttg.ttg_id = 3 && m.m_category = 'SFG' && tc.tc_dn != '') && 
				(tc.tc_status = 'FULLS' && e.e_id IS NULL && m.m_id IS NOT NULL) &&
				(tc.is_blocked = FALSE && tc.is_defective = FALSE)
			GROUP BY m.m_type, vt.vt_name, s.s_name
		";

		$query = $this->db->query($sql);

		return $query->result();
	}

	function di_semi_finished_goods_truckers() {

		$sql = "
			SELECT 	m.m_id, 
					vt.vt_id, 
					t.t_id, 
					m.m_description, 
					vt.vt_name,  
					t.t_code, 
					count(tc.tc_id) as vans,
                    tt.tt_name,
					ttg.ttg_name, 
					m.m_category,
                    m.m_type,
                    tc.tc_id
			FROM tcards tc
			INNER JOIN vans v
			ON tc.v_id = v.v_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
			INNER JOIN truckers t
			ON tc.t_id = t.t_id
			INNER JOIN shippers s
			ON tc.s_id = s.s_id
			INNER JOIN tcard_types tt
			ON tc.tt_id = tt.tt_id
			INNER JOIN tcard_type_group ttg
			ON tt.ttg_id = ttg.ttg_id
			LEFT JOIN tcard_outgoing_materials tom
			ON tc.tc_id = tom.tc_id
			LEFT JOIN materials m
			ON m.m_id = tom.m_id
			LEFT JOIN exit_passes e
			ON e.tc_id = tc.tc_id
			WHERE 
            	((t.t_id = 7 && vt.vt_id = 1) ||
                 (t.t_id = 4 && vt.vt_id = 1) ||
                 (t.t_id = 2 && vt.vt_id = 1)
                ) &&
				((s.s_id != 20) &&
				 (s.s_id != 3) &&
				 (s.s_id != 19) &&
				 (s.s_id != 17) &&
				 (s.s_id != 2) &&
				 (s.s_id != 16) &&
				 (s.s_id != 18) &&	 
				 (s.s_id != 6) &&
				 (s.s_id != 5)				
				) &&
				(ttg.ttg_id = 3 && m.m_category = 'SFG' && tc.tc_dn != '') && 
				(tc.tc_status = 'FULLS' && e.e_id IS NULL && m.m_id IS NOT NULL) &&
				(tc.is_blocked = FALSE && tc.is_defective = FALSE)
			GROUP BY m.m_type, vt.vt_name, t.t_code
		";

		$query = $this->db->query($sql);

		return $query->result();
	}

	function di_hold_products_shippers() {

		$sql = "
			SELECT 	m.m_id, 
					vt.vt_id, 
					s.s_id,
					m.m_description, 
					vt.vt_name,  
					s.s_name, 
					count(tc.tc_id) as vans,
                    tt.tt_name,
					ttg.ttg_name, 
					m.m_category,
                    m.m_type,
                    tc.tc_id
			FROM tcards tc
			INNER JOIN vans v
			ON tc.v_id = v.v_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
			INNER JOIN truckers t
			ON tc.t_id = t.t_id
			INNER JOIN shippers s
			ON tc.s_id = s.s_id
			INNER JOIN tcard_types tt
			ON tc.tt_id = tt.tt_id
			INNER JOIN tcard_type_group ttg
			ON tt.ttg_id = ttg.ttg_id
			LEFT JOIN tcard_outgoing_materials tom
			ON tc.tc_id = tom.tc_id
			LEFT JOIN materials m
			ON m.m_id = tom.m_id
			LEFT JOIN exit_passes e
			ON e.tc_id = tc.tc_id
			WHERE 
            	((s.s_id = 20 && vt.vt_id = 1) ||
                 (s.s_id = 3 && vt.vt_id = 1) ||
                 (s.s_id = 19 && vt.vt_id = 1) ||
                 (s.s_id = 17 && vt.vt_id = 1) ||
                 (s.s_id = 2 && vt.vt_id = 1) ||
                 (s.s_id = 2 && vt.vt_id = 2) ||
                 (s.s_id = 6 && vt.vt_id = 1) ||
                 (s.s_id = 6 && vt.vt_id = 2) ||
                 (s.s_id = 5 && vt.vt_id = 1)
                ) &&
				(ttg.ttg_id = 3) && 
				(tc.tc_status = 'FULLS' && e.e_id IS NULL && m.m_id IS NOT NULL) &&
				(tc.is_blocked = TRUE && tc.is_defective = FALSE)
			GROUP BY m.m_type, vt.vt_name, s.s_name
		";

		$query = $this->db->query($sql);

		return $query->result();

	}

	function di_hold_products_truckers() {

		$sql = "
			SELECT 	m.m_id, 
					vt.vt_id, 
					t.t_id, 
					m.m_description, 
					vt.vt_name,  
					t.t_code, 
					count(tc.tc_id) as vans,
                    tt.tt_name,
					ttg.ttg_name, 
					m.m_category,
                    m.m_type,
                    tc.tc_id
			FROM tcards tc
			INNER JOIN vans v
			ON tc.v_id = v.v_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
			INNER JOIN truckers t
			ON tc.t_id = t.t_id
			INNER JOIN shippers s
			ON tc.s_id = s.s_id
			INNER JOIN tcard_types tt
			ON tc.tt_id = tt.tt_id
			INNER JOIN tcard_type_group ttg
			ON tt.ttg_id = ttg.ttg_id
			LEFT JOIN tcard_outgoing_materials tom
			ON tc.tc_id = tom.tc_id
			LEFT JOIN materials m
			ON m.m_id = tom.m_id
			LEFT JOIN exit_passes e
			ON e.tc_id = tc.tc_id
			WHERE 
            	((t.t_id = 7 && vt.vt_id = 1) ||
                 (t.t_id = 4 && vt.vt_id = 1) ||
                 (t.t_id = 2 && vt.vt_id = 1)
                ) &&
				((s.s_id != 20) &&
				 (s.s_id != 3) &&
				 (s.s_id != 19) &&
				 (s.s_id != 17) &&
				 (s.s_id != 2) &&
				 (s.s_id != 6) &&
				 (s.s_id != 5)				
				) &&
				(ttg.ttg_id = 3) && 
				(tc.tc_status = 'FULLS' && e.e_id IS NULL && m.m_id IS NOT NULL) &&
				(tc.is_blocked = TRUE && tc.is_defective = FALSE)
			GROUP BY m.m_type, vt.vt_name, t.t_code
		";

		$query = $this->db->query($sql);

		return $query->result();
	}

	function di_for_processing_late_over_shippers() {

		$sql = "
			SELECT	vt.vt_id, 
					vt.vt_name,
					s.s_id,  
					s.s_name, 
					sum(case when tc.tc_dn != '' AND e.e_id IS NULL then 1 else 0 end) as for_processing,
                    sum(case when e.e_id IS NOT NULL AND e.e_driver = '' AND e.e_plateno = '' then 1 else 0 end) as late_over
			FROM tcards tc
			INNER JOIN vans v
			ON tc.v_id = v.v_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
			INNER JOIN truckers t
			ON tc.t_id = t.t_id
			INNER JOIN shippers s
			ON tc.s_id = s.s_id
			INNER JOIN tcard_types tt
			ON tc.tt_id = tt.tt_id
			INNER JOIN tcard_type_group ttg
			ON tt.ttg_id = ttg.ttg_id
			LEFT JOIN tcard_outgoing_materials tom
			ON tc.tc_id = tom.tc_id
			LEFT JOIN materials m
			ON m.m_id = tom.m_id
			LEFT JOIN exit_passes e
			ON e.tc_id = tc.tc_id
			WHERE 
            	((s.s_id = 20 && vt.vt_id = 1) ||
                 (s.s_id = 3 && vt.vt_id = 1) ||
                 (s.s_id = 19 && vt.vt_id = 1) ||
                 (s.s_id = 6 && vt.vt_id = 1) ||
          		 (s.s_id = 7 && vt.vt_id = 1) ||
                 (s.s_id = 2 && vt.vt_id = 1) ||
                 (s.s_id = 2 && vt.vt_id = 2) ||
                 (s.s_id = 5 && vt.vt_id = 1) ||
                 (s.s_id = 16 && vt.vt_id = 1) 
                ) &&
				(ttg.ttg_id = 3) && 
				(tc.tc_status = 'FULLS' && m.m_id IS NOT NULL) &&
				(tc.is_blocked = FALSE && tc.is_defective = FALSE)
			GROUP BY s.s_name, vt.vt_name
		";

		$query = $this->db->query($sql);

		return $query->result();

	}

	function di_for_processing_late_over_truckers() {

		$sql = "
			SELECT 	vt.vt_id, 
					vt.vt_name,
					s.s_id,  
					s.s_name, 
					sum(case when tc.tc_dn != '' AND e.e_id IS NULL then 1 else 0 end) as for_processing,
                    sum(case when e.e_id IS NOT NULL AND e.e_driver = '' AND e.e_plateno = '' then 1 else 0 end) as late_over
			FROM tcards tc
			INNER JOIN vans v
			ON tc.v_id = v.v_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
			INNER JOIN truckers t
			ON tc.t_id = t.t_id
			INNER JOIN shippers s
			ON tc.s_id = s.s_id
			INNER JOIN tcard_types tt
			ON tc.tt_id = tt.tt_id
			INNER JOIN tcard_type_group ttg
			ON tt.ttg_id = ttg.ttg_id
			LEFT JOIN tcard_outgoing_materials tom
			ON tc.tc_id = tom.tc_id
			LEFT JOIN materials m
			ON m.m_id = tom.m_id
			LEFT JOIN exit_passes e
			ON e.tc_id = tc.tc_id
			WHERE 
            	((t.t_id = 7 && vt.vt_id = 1) ||
                 (t.t_id = 2 && vt.vt_id = 1)
                ) &&
				((s.s_id != 20) &&
				 (s.s_id != 3) &&
				 (s.s_id != 19) &&
				 (s.s_id != 6) &&
				 (s.s_id != 7) &&
				 (s.s_id != 2) &&
				 (s.s_id != 5) &&
				 (s.s_id != 16)				
				) &&
				(ttg.ttg_id = 3) && 
				(tc.tc_status = 'FULLS' && m.m_id IS NOT NULL) &&
				(tc.is_blocked = FALSE && tc.is_defective = FALSE)
			GROUP BY m.m_type, vt.vt_name, t.t_code
		";

		$query = $this->db->query($sql);

		return $query->result();
	}
}

?>
