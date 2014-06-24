<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Reports extends MY_Controller {

	# Index
	function index() {

		$css = array(
				'reports.css',
				'reports-print.css'
		);

		$this->smarty->assign('page_css', $css);

		$js = array(
				'pages/reports.js'
		);

		$this->smarty->assign('page_js', $js);

		$data['page_title'] = "Reports";

		$current_user = $this->session->userdata(SESSION_VAR);
		$layout = $current_user['u_isadmin'] ? 'crud_pages_layout.tpl' : 'normal_user_layout.tpl'; 

		$this->smarty->assign('layout', $layout);
		$this->smarty->assign('page', 'reports');
		$this->smarty->view('pages/reports.tpl', $data);
	}

	function fsc_outbound_report() {
		$this->load->model('reports_model');

		$data = $this->reports_model->dispatch_standings_fulls();

		$data = array(
				'dispatch_standings_fulls' => $this->reports_model->dispatch_standings_fulls(),
				'dispatch_standings_exfac' => $this->reports_model->dispatch_standings_exfac(),
				'pending_fulls_sealed' => $this->reports_model->pending_fulls_sealed(),
				'pending_fulls_unsealed' => $this->reports_model->pending_fulls_unsealed(),
				'pending_exfac_sealed' => $this->reports_model->pending_exfac_sealed(),
				'pending_exfac_unsealed' => $this->reports_model->pending_exfac_unsealed(),
				'empty_vans_running_balance' => $this->reports_model->empty_vans_running_balance()
			);

		echo json_encode($data);
	}

	function defective_vans_report() {

		$this->load->model('reports_model');

		$data = $this->reports_model->defective_vans();

		echo json_encode($data);

	}

	function empty_vans_report() {

		$this->load->model('reports_model');

		$data = $this->reports_model->empty_vans_running_balance();

		echo json_encode($data);

	}

	function di_stripping_packmats() {

		$this->load->model('reports_model');

		$data = $this->reports_model->di_stripping_packmats();

		echo json_encode($data);
	}

}