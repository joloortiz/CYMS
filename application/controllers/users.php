<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Users extends MY_Controller {

	function __construct(){
		parent::__construct();
		$this->smarty->assign('layout', 'crud_pages_layout.tpl');
		$this->smarty->assign('page', 'users');
		$this->smarty->assign('page_css', 'admin.css');
		$this->smarty->assign('page_js', 'users_crud.js');
	}
	


	# Index
	function index() {
		$this->load->model('users_model');
		$users = $this->users_model->get_users();
				
		$this->smarty->assign('page_title', 'Users');
		$this->smarty->view('pages/users.tpl');
	}

	public function add() {
		$this->load->model('users_model');

		
		
		$this->smarty->assign('page_title', 'Add User');
		$this->smarty->view('pages/users_add.tpl');
	}

	public function is_username_existing() {
		$username = $this->input->post('username');

		$this->load->model('users_model');

		$data['success'] = $this->users_model->is_username_existing($username);
		
		echo json_encode($data);
	}
}