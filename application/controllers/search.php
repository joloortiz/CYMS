<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Search extends MY_Controller {

	function __construct() {
		parent::__construct();
	}

	# Index
	function index() {
		$this->smarty->assign('page_css', 'admin.css');
		$this->smarty->assign('page_js', 'users_crud.js');
		$this->smarty->assign('layout', 'search_layout.tpl');
		$this->smarty->assign('page', 'Search');
		$this->smarty->view('pages/search.tpl');
	}
}