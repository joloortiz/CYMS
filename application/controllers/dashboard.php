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
		$this->smarty->assign('layout', 'plain_layout.tpl');
		$this->smarty->view('pages/dashboard.tpl');
	}
}