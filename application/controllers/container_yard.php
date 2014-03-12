<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Container_yard extends MY_Controller {
	
	function index() {
		$css = array('container-yard.css');
		$this->smarty->assign('page_css', $css);
		
		$js = array(
				'jquery-ui-1.10.4.custom.js',
				'jquery.nicescroll.min.js',
				'pages/container-yard.js'
		);
		$this->smarty->assign('page_js', $js);
		
		$data['layout_js'] = '';
		$data['company_name'] = 'Oroport Cargoholding Services Inc.';
		$data['company_address'] = 'Port Area, Puntod, Cagayan de Oro';
		
		$this->smarty->assign('layout', 'cy_layout.tpl');
		$this->smarty->view('pages/container_yard.tpl', $data);
	}
	
}