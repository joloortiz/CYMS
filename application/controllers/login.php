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
		$username = $this->input->post('username');
		$password = md5($this->input->post('password'));

		try {
			#load users_model
			$this->load->model('users_model');
			$msg = '';

			
			if($this->users_model->is_username_existing($username) == FALSE){
				$msg = 'Username does not exist.';
				$data['success'] = FALSE;
			}elseif($this->users_model->is_password_valid($username, $password) == FALSE){
				$msg = 'Incorrect password.';
				$data['success'] = FALSE;
			}elseif($this->users_model->is_account_active($username, $password) == FALSE){
				$msg = 'Account inactive. Contact the System Administrator.';
				$data['success'] = FALSE;
			}

			$data['success'] = $msg == '' ? true : false;
			$data['msg'] = $msg;
		}
		catch(Exception $e) {
			$data['success'] = FALSE;
            $data['msg'] = $e->getMessage();
		}
		echo json_encode($data);
	}

	public function start_session() {
		$username = $this->input->post('username');

		try {
			#load users_model
			$this->load->model('users_model');

			$user = $this->users_model->get_by_username($username);
			$this->session->set_userdata(SESSION_VAR, $user[0]);

			$data['success'] = TRUE;
			$data['msg'] = '';
		}
		catch(Exception $e) {
			$data['success'] = FALSE;
            $data['msg'] = $e->getMessage();
		}

		echo json_encode($data);
	}

	function logout() {
		try {
			$this->session->unset_userdata(SESSION_VAR);			
		} catch (Exception $e) {
			unset($e);
		}
		
		redirect(base_url() . 'login');
	}
}

?>