<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login extends MY_Controller {

	/*
	function __construct(){
		parent::__construct();
		$this->is_logged_in();
	}
	
	//checks if the user is already logged in
	function is_logged_in(){
		$u_id = $this->session->userdata('u_id');
		
		if(isset($u_id)){
			redirect('/dashboard');
		}
	}
	*/

	# Index
	function index() {
		$this->smarty->assign('layout', 'plain_layout.tpl');
		$this->smarty->assign('page_css', array('login-tpl.css'));
		$this->smarty->assign('page_js', array('login.js'));
		$this->smarty->view('pages/login.tpl');
	}

	public function validate_user() {
		$username = mysql_real_escape_string($this->input->post('username'));
		$password = $this->input->post('password');
		
		#load users_model
		$this->load->model(users_model);

		#check if username exists
		$is_username_existing = $this->users_model->is_username_existing($username);

		#check if password is correct
		$is_password_valid = $this->users_model->is_password_valid($username, $password);

		#check if account is active
		$is_account_active = $this->users_model->is_account_active($username, $password);

		if($is_username_existing == 0){
			$msg = "Username does not exist";
		}elseif($is_password_valid == 0){
			$msg = "Incorrect password";
		}elseif($is_account_active){
			$msg = "Account inactive. Contact the System Administrator.";
		}else{
			$msg = "";
			$data['success'] = true;
			$data['msg'] = $msg;
		}
		
		$data['msg'] = "gwapo ko";
		echo json_encode($data);
	}

	private function set_session(){

	}
}