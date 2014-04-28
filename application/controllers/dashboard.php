<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Dashboard extends MY_Controller {
/*
	function __construct(){
		parent::__construct();
		$this->is_logged_in();
	}
	
	//checks if the user is already logged in
	function is_logged_in(){
		$u_id = $this->session->userdata('u_id');
		
		if(!isset($u_id)){
			redirect('/login');
		}
	}
*/
	# Index
	function index() {

		$current_user = $this->session->userdata(SESSION_VAR);
		$layout = $current_user['u_isadmin'] ? 'crud_pages_layout.tpl' : 'non_crud_pages_layout.tpl';
		
		$this->smarty->assign('layout', $layout);
		$this->smarty->assign('page_css', 'admin.css');
		$this->smarty->assign('page', 'home');
		$this->smarty->view('pages/dashboard.tpl');
	}

	function test() {
		$data['username'] = $this->session->userdata[SESSION_VAR]['u_username'];

		echo json_encode($data);
	}

}

?>