<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Search extends MY_Controller {

	function __construct() {
		parent::__construct();
	}

	# Index
	function index() {
		// css
		$css = array(
				'select2.css',
		);
		$this->smarty->assign('page_css', $css);
		
		// JS
		$js = array(
				'generic-datepicker.js',
				'select2.min.js',
				'pages/search.js'
		);
		$this->smarty->assign('page_js', $js);

		// Shippers
		$shippers = $this->shippers_model->get_shippers();
		$this->smarty->assign('shippers', $shippers);


		$this->smarty->assign('layout', 'crud_pages_layout.tpl');
		$this->smarty->assign('page', 'search');
		$this->smarty->view('pages/search.tpl');
	}
}