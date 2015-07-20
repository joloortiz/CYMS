<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Test extends MY_Controller {

	# Index
	function index() {
		$this->smarty->assign('layout', 'plain_layout.tpl');
		$this->smarty->view('pages/test.tpl');
	}
}