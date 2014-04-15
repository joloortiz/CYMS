<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Van_types extends MY_Controller {
	
	/* PAGES */
	function index() {
		// page js
		$js = array(
				'pages/van_types.js'
		);
		$this->smarty->assign('page_js', $js);
		
		$van_types = $this->van_types_model->get_van_types();
		$this->smarty->assign('van_types', $van_types);
		
		$this->smarty->assign('layout', 'crud_pages_layout.tpl');
		$this->smarty->assign('page', 'van_types');
		$this->smarty->view('pages/van_types.tpl');
	}
	
	
	/* FUNCTIONS */
	
	function save() {
		try {
	
			$action = $this->input->post('action');
	
			$name = $this->input->post('name');
			$id = $this->input->post('van_type_id');
	
			$result = NULL;
	
			$data = array(
					'vt_name' => $name
			);
	
			if( $action == 'create' ) {
				$result = $this->van_types_model->new_van_type($data);
					
			}elseif( $action == 'update' && $this->_validate_van_type($id) ) {
				$result = $this->van_types_model->update_van_type($id, $data);
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
			$ids = $this->input->post('van_type_ids');
				
			if( is_array($ids) ) {
				foreach($ids as $type_id) {
					$this->van_types_model->purge_type($type_id);
				}
			}
				
			$var['done'] = TRUE;
				
		} catch (Exception $e) {
			$var['done'] = FALSE;
		}
	
		echo json_encode( $var );
	}
	
	function get_van_type_details() {
		try {
			$id = $this->input->post('id');
			$details = $this->van_types_model->get_van_type_by_id($id);
				
			$var['details'] = $details;
			$var['success'] = TRUE;
		} catch (Exception $e) {
			$var['success'] = FALSE;
		}
	
		echo json_encode( $var );
	}
	
	/* PRIVATES */
	
	private function _validate_van_type($id) {
		$returnVal = FALSE;
	
		try {
			$van_type = $this->van_types_model->get_van_type_by_id($id);
				
			if( $van_type ) {
				$returnVal = TRUE;
			}
				
		} catch (Exception $e) {
			unset($e);
		}
	
		return $returnVal;
	}
}