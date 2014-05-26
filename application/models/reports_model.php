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
					(s.s_name = 'MSKU' && vt.vt_name = 'FCTC')) && (tt.tt_name != 'EXFACTORY' && tt.tt_name != 'EMPTY')
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
					(s.s_name = 'MSKU' && vt.vt_name = 'FCTC')) && (tt.tt_name = 'EXFACTORY')
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
					(s.s_name = 'MSKU' && vt.vt_name = 'FCTC')) && (tt.tt_name != 'EXFACTORY' && tt.tt_name != 'EMPTY')
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
					(s.s_name = 'MSKU' && vt.vt_name = 'FCTC')) && (tt.tt_name != 'EXFACTORY' && tt.tt_name != 'EMPTY')
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
					(s.s_name = 'MSKU' && vt.vt_name = 'FCTC')) && (tt.tt_name = 'EXFACTORY')
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
					(s.s_name = 'MSKU' && vt.vt_name = 'FCTC')) && (tt.tt_name = 'EXFACTORY')
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
					(s.s_name = 'SSR' && vt.vt_name = '420') || 
					(s.s_name = 'GOTHONG' && vt.vt_name = '20') || 
					(s.s_name = 'TST' && vt.vt_name = '20') || 
					(s.s_name = 'MSKU' && vt.vt_name = 'FCTC') || 
					(s.s_name = 'SKMTI' && vt.vt_name = '20'))
			GROUP by vt.vt_name, s.s_name; 		
		";

		$query = $this->db->query($sql);

		return $query->result();
	}

}

?>