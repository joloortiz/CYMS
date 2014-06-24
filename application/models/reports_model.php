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
			WHERE ((tc.tc_datestuffed IS NOT NULL || tc.tc_datesealed IS NOT NULL || e.e_date IS NOT NULL) && 
					(s.s_name = 'NMC' && vt.vt_name = '20') || 
					(s.s_name = 'NMC' && vt.vt_name = '40') ||
					(s.s_name = 'SOLID' && vt.vt_name = '20') || 
					(s.s_name = '2GO' && vt.vt_name = '20') || 
					(s.s_name = 'GOTHONG' && vt.vt_name = '20') ||
					(s.s_name = 'SSR' && vt.vt_name = '20') ||
					(s.s_name = 'SSR' && vt.vt_name = '40') ||
					(s.s_name = 'COFIPAC' && vt.vt_name = '20') ||
					(s.s_name = 'COFIPAC' && vt.vt_name = '40') ||
					(s.s_name = 'CDC' && vt.vt_name = 'WINGVAN') ||
					(s.s_name = 'TST' && vt.vt_name = 'WINGVAN') ||
					(s.s_name = 'TW' && vt.vt_name = '20') || 
					(s.s_name = 'MSKU' && vt.vt_name = 'FCTC')) && (tt.tt_name != 'EXFACTORY' && tt.tt_name != 'EMPTY') && (tc.is_blocked = FALSE && tc.is_defective = FALSE)
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
			WHERE (tc.tc_datestuffed IS NOT NULL || tc.tc_datesealed IS NOT NULL || e.e_date IS NOT NULL) && 
					((s.s_name = 'NMC' && vt.vt_name = '20') || 
					(s.s_name = 'SOLID' && vt.vt_name = '20') || 
					(s.s_name = '2GO' && vt.vt_name = '20') || 
					(s.s_name = 'SKMI' && vt.vt_name = 'WINGVAN') ||
					(s.s_name = 'TW' && vt.vt_name = '20') || 
					(s.s_name = 'MSKU' && vt.vt_name = 'FCTC')) && (tt.tt_name = 'EXFACTORY') && (tc.is_blocked = FALSE && tc.is_defective = FALSE)
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
			WHERE (tc.tc_datesealed IS NOT NULL && e.e_date IS NULL) && 
					((s.s_name = 'NMC' && vt.vt_name = '20') || 
					(s.s_name = 'NMC' && vt.vt_name = '40') ||
					(s.s_name = 'SOLID' && vt.vt_name = '20') || 
					(s.s_name = '2GO' && vt.vt_name = '20') || 
					(s.s_name = 'GOTHONG' && vt.vt_name = '20') ||
					(s.s_name = 'SSR' && vt.vt_name = '20') ||
					(s.s_name = 'SSR' && vt.vt_name = '40') ||
					(s.s_name = 'COFIPAC' && vt.vt_name = '20') ||
					(s.s_name = 'COFIPAC' && vt.vt_name = '40') ||
					(s.s_name = 'CDC' && vt.vt_name = 'WINGVAN') ||
					(s.s_name = 'TST' && vt.vt_name = 'WINGVAN') ||
					(s.s_name = 'TW' && vt.vt_name = '20') || 
					(s.s_name = 'MSKU' && vt.vt_name = 'FCTC')) && (tt.tt_name != 'EXFACTORY' && tt.tt_name != 'EMPTY') && (tc.is_blocked = FALSE && tc.is_defective = FALSE)
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
			WHERE (tc.tc_datesealed IS NULL && e.e_date IS NULL) && 
					((s.s_name = 'NMC' && vt.vt_name = '20') || 
					(s.s_name = 'NMC' && vt.vt_name = '40') ||
					(s.s_name = 'SOLID' && vt.vt_name = '20') || 
					(s.s_name = '2GO' && vt.vt_name = '20') || 
					(s.s_name = 'GOTHONG' && vt.vt_name = '20') ||
					(s.s_name = 'SSR' && vt.vt_name = '20') ||
					(s.s_name = 'SSR' && vt.vt_name = '40') ||
					(s.s_name = 'COFIPAC' && vt.vt_name = '20') ||
					(s.s_name = 'COFIPAC' && vt.vt_name = '40') ||
					(s.s_name = 'CDC' && vt.vt_name = 'WINGVAN') ||
					(s.s_name = 'TST' && vt.vt_name = 'WINGVAN') ||
					(s.s_name = 'TW' && vt.vt_name = '20') || 
					(s.s_name = 'MSKU' && vt.vt_name = 'FCTC')) && (tt.tt_name != 'EXFACTORY' && tt.tt_name != 'EMPTY') && (tc.is_blocked = FALSE && tc.is_defective = FALSE)
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
			WHERE (tc.tc_datesealed IS NOT NULL && e.e_date IS NULL) && 
					((s.s_name = 'NMC' && vt.vt_name = '20') || 
					(s.s_name = 'SOLID' && vt.vt_name = '20') || 
					(s.s_name = '2GO' && vt.vt_name = '20') || 
					(s.s_name = 'SKMI' && vt.vt_name = 'WINGVAN') ||
					(s.s_name = 'TW' && vt.vt_name = '20') || 
					(s.s_name = 'MSKU' && vt.vt_name = 'FCTC')) && (tt.tt_name = 'EXFACTORY') && (tc.is_blocked = FALSE && tc.is_defective = FALSE)
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
			WHERE (tc.tc_datesealed IS NULL && e.e_date IS NULL) && 
					((s.s_name = 'NMC' && vt.vt_name = '20') || 
					(s.s_name = 'SOLID' && vt.vt_name = '20') || 
					(s.s_name = '2GO' && vt.vt_name = '20') || 
					(s.s_name = 'SKMI' && vt.vt_name = 'WINGVAN') ||
					(s.s_name = 'TW' && vt.vt_name = '20') || 
					(s.s_name = 'MSKU' && vt.vt_name = 'FCTC')) && (tt.tt_name = 'EXFACTORY') && (tc.is_blocked = FALSE && tc.is_defective = FALSE)
			GROUP by vt.vt_name, s.s_name;		
		";

		$query = $this->db->query($sql);

		return $query->result();		

	}

	function empty_vans_running_balance() {

		$sql = "
			SELECT tc.tc_id, s.s_name, vt_name, count(tc.tc_id) as vans
			FROM tcards tc
			INNER JOIN shippers s
			ON tc.s_id = s.s_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
			INNER JOIN tcard_types tt
			ON tc.tt_id = tt.tt_id
			WHERE (tt.tt_name = 'EMPTY') &&
					((s.s_name = 'NMC' && vt.vt_name = '20') || 
					(s.s_name = 'NMC' && vt.vt_name = '40') || 
					(s.s_name = 'SOLID' && vt.vt_name = '20') || 
					(s.s_name = '2GO' && vt.vt_name = '20') || 
					(s.s_name = 'SSR' && vt.vt_name = '20') || 
					(s.s_name = 'SSR' && vt.vt_name = '40') || 
					(s.s_name = 'GOTHONG' && vt.vt_name = '20') || 
					(s.s_name = 'TST' && vt.vt_name = '20') || 
					(s.s_name = 'MSKU' && vt.vt_name = 'FCTC') || 
					(s.s_name = 'SKMTI' && vt.vt_name = '20')) && (tc.is_blocked = FALSE && tc.is_defective = FALSE)
			GROUP by vt.vt_name, s.s_name; 		
		";

		$query = $this->db->query($sql);

		return $query->result();

	}

	function defective_vans() {

		$sql = "
			SELECT v.v_no, tc.tc_entrydate, s.s_name, vt_name, tc.tc_block_reason
			FROM tcards tc
			INNER JOIN shippers s
			ON tc.s_id = s.s_id
			INNER JOIN van_types vt
			ON tc.vt_id = vt.vt_id
			INNER JOIN vans v
			on tc.v_id = v.v_id
			LEFT JOIN exit_passes e
			on e.tc_id = tc.tc_id
			WHERE is_blocked = TRUE && is_defective = TRUE && e.e_date IS NULL
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
			     
			     (im.im_id = 18 && vt.vt_id = 1 && t.t_id = 2) ||
			     
			     (im.im_id = 19 && vt.vt_id = 1 && t.t_id = 7) ||
			     
			     (im.im_id = 20 && vt.vt_id = 1 && t.t_id = 2) ||
			     
			     (im.im_id = 21 && vt.vt_id = 1 && t.t_id = 2) ||
			     
			     (im.im_id = 21 && vt.vt_id = 2 && t.t_id = 2) ||     
			     
			     (im.im_id = 22 && vt.vt_id = 1 && t.t_id = 2) ||
			     
			     (im.im_id = 23 && vt.vt_id = 4 && t.t_id = 2)     
			     
				)
			    &&
				(ttg.ttg_name = 'STRIPPING' && tt.tt_name = 'PACK MATS')
			GROUP BY im.im_name, vt.vt_name, t.t_name
		";

		$query = $this->db->query($sql);

		return $query->result();

	}

}

?>
