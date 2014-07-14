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

/*
*
* FSC OUTBOUND REPORT
*
*/

	function fsc_dispatch_standings_shippers() {

		$this->load->model('reports_model');

		$data = $this->reports_model->fsc_dispatch_standings_shippers();

		echo json_encode($data);

	}

	function fsc_dispatch_standings_truckers() {

		$this->load->model('reports_model');

		$data = $this->reports_model->fsc_dispatch_standings_truckers();

		echo json_encode($data);

	}

	function fsc_pending_shippers() {

		$this->load->model('reports_model');

		$data = $this->reports_model->fsc_pending_shippers();

		echo json_encode($data);

	}

	function fsc_pending_truckers() {

		$this->load->model('reports_model');

		$data = $this->reports_model->fsc_pending_truckers();

		echo json_encode($data);

	}

	function fsc_empty_vans_for_stuffing_shippers() {

		$this->load->model('reports_model');

		$data = $this->reports_model->fsc_empty_vans_for_stuffing_shippers();

		echo json_encode($data);

	}


	function fsc_empty_vans_for_stuffing_truckers() {

		$this->load->model('reports_model');

		$data = $this->reports_model->fsc_empty_vans_for_stuffing_truckers();

		echo json_encode($data);

	}


/*
*
* END FSC OUTBOUND REPORT
*
*/

	function defective_vans_report() {

		$this->load->model('reports_model');

		$data = $this->reports_model->defective_vans();

		echo json_encode($data);

	}

	function empty_vans_report_shippers() {

		$this->load->model('reports_model');

		$data = $this->reports_model->empty_vans_running_balance_shippers();

		echo json_encode($data);

	}

	function empty_vans_report_truckers() {

		$this->load->model('reports_model');

		$data = $this->reports_model->empty_vans_running_balance_truckers();

		echo json_encode($data);

	}

	function di_stripping_packmats() {

		$this->load->model('reports_model');

		$data = $this->reports_model->di_stripping_packmats();

		echo json_encode($data);
	}

	function di_stripping_rawmats_shippers() {

		$this->load->model('reports_model');

		$data = $this->reports_model->di_stripping_rawmats_shippers();

		echo json_encode($data);
		
	}

	function di_stripping_rawmats_truckers() {

		$this->load->model('reports_model');

		$data = $this->reports_model->di_stripping_rawmats_truckers();

		echo json_encode($data);
		
	}

	function di_stripping_greencoffee() {

		$this->load->model('reports_model');

		$data = $this->reports_model->di_stripping_greencoffee();

		echo json_encode($data);
		
	}


	function di_empty_for_return() {

		$this->load->model('reports_model');

		$data = $this->reports_model->di_empty_for_return();

		echo json_encode($data);

	}

	function di_defective_vans_shippers() {

		$this->load->model('reports_model');

		$data = $this->reports_model->di_defective_vans_shippers();

		echo json_encode($data);

	}

	function di_defective_vans_truckers() {

		$this->load->model('reports_model');

		$data = $this->reports_model->di_defective_vans_truckers();

		echo json_encode($data);

	}

	function di_finished_goods_shippers() {

		$this->load->model('reports_model');

		$data = $this->reports_model->di_finished_goods_shippers();

		echo json_encode($data);

	}

	function di_finished_goods_truckers() {

		$this->load->model('reports_model');

		$data = $this->reports_model->di_finished_goods_truckers();

		echo json_encode($data);

	}

	function di_semi_finished_goods_shippers() {

		$this->load->model('reports_model');

		$data = $this->reports_model->di_semi_finished_goods_shippers();

		echo json_encode($data);

	}

	function di_semi_finished_goods_truckers() {

		$this->load->model('reports_model');

		$data = $this->reports_model->di_semi_finished_goods_truckers();

		echo json_encode($data);

	}

	function di_rework_powder_shippers() {

		$this->load->model('reports_model');

		$data = $this->reports_model->di_rework_powder_shippers();

		echo json_encode($data);
	}

	function di_rework_powder_truckers() {
		
		$this->load->model('reports_model');

		$data = $this->reports_model->di_rework_powder_truckers();

		echo json_encode($data);
	}

	function di_hold_products_shippers() {

		$this->load->model('reports_model');

		$data = $this->reports_model->di_hold_products_shippers();

		echo json_encode($data);

	}

	function di_hold_products_truckers() {

		$this->load->model('reports_model');

		$data = $this->reports_model->di_hold_products_truckers();

		echo json_encode($data);

	}

	function di_for_processing_late_over_shippers() {

		$this->load->model('reports_model');

		$data = $this->reports_model->di_for_processing_late_over_shippers();

		echo json_encode($data);

	}

	function di_for_processing_late_over_truckers() {

		$this->load->model('reports_model');

		$data = $this->reports_model->di_for_processing_late_over_truckers();

		echo json_encode($data);

	}

}