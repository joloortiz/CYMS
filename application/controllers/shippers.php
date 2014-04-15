<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Shippers extends MY_Controller {
	/* PAGES */
	function index() {
		// page js

		$config['base_url'] = BASE_URL . 'shippers/';
		$config['total_rows'] = $this->shippers_model->record_count();
		$config['per_page'] = 5; 
		$config['uri_segment'] = 2;


		$this->pagination->initialize($config); 

		$offset = $this->uri->segment(2);


		$shippers = $this->shippers_model->p_shippers($config['per_page'], $offset);

		$pagination = $this->pagination->create_links();

		$js = array(
				'pages/shippers.js'
		);
		$this->smarty->assign('page_js', $js);
		
		$this->smarty->assign('pagination', $pagination);
		$this->smarty->assign('shippers', $shippers);
		$this->smarty->assign('layout', 'crud_pages_layout.tpl');
		$this->smarty->assign('page', 'shippers');
		$this->smarty->view('pages/shippers.tpl');
	}
	
	/* FUNCTION */
	function save() {
		try {
	
			$action = $this->input->post('action');
	
			$name = $this->input->post('name');
			$color = $this->input->post('color');
			$id = $this->input->post('shipper_id');
	
			$result = NULL;
	
			$data = array(
					's_name' => $name,
					's_color' => $color
			);
	
			if( $action == 'create' ) {
				$result = $this->shippers_model->new_shipper($data);
					
			}elseif( $action == 'update' && $this->_validate_shipper($id) ) {
				$result = $this->shippers_model->update_shipper($id, $data);
			}
	
			$var['done'] = $result ? TRUE : FALSE;
	
		} catch (Exception $e) {
			$var['done'] = FALSE;
			$var['exception'] = $e->getMessage();
		}
	
		echo json_encode($var);
	}
	
	function delete() {
		try {
			$ids = $this->input->post('shipper_ids');
			
			if( is_array($ids) ) {
				foreach($ids as $shipper_id) {
					$this->shippers_model->purge_shipper($shipper_id);
				}
			}
			
			$var['done'] = TRUE;
			
		} catch (Exception $e) {
			$var['done'] = FALSE;
		}
		
		echo json_encode( $var );
	}
	
	function get_shipper_details() {
		try {
			$id = $this->input->post('id');
			$details = $this->shippers_model->get_shipper_by_id($id);
				
			$var['details'] = $details;
			$var['success'] = TRUE;
		} catch (Exception $e) {
			$var['success'] = FALSE;
		}
	
		echo json_encode( $var );
	}
	
	/* PRIVATES */
	
	private function _validate_shipper($id) {
		$returnVal = FALSE;
	
		try {
			$type = $this->shippers_model->get_shipper_by_id($id);
				
			if( $type ) {
				$returnVal = TRUE;
			}
				
		} catch (Exception $e) {
			unset($e);
		}
	
		return $returnVal;
	}
}