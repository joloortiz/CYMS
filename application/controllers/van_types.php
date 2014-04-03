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
		
		$data['page_header'] = 'Van Type Management';
		
		$this->smarty->assign('layout', 'plain_layout.tpl');
		$this->smarty->view('pages/van_types.tpl', $data);
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
	
	function validate_form() {
	
		try {
			$var['success'] = TRUE;
	
			$this->_set_form_rules();
	
			if( !$this->form_validation->run() ) {
				$var['success'] = FALSE;
	
				$this->form_validation->set_error_delimiters('', '');
	
				// form errors
				$var['form_errors']['name'] = form_error('name') ? form_error('name') : NULL;
			}
		} catch (Exception $e) {
			$var['success'] = FALSE;
			$var['exception'] = $e->getMessage();
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
	
	private function _set_form_rules() {
	
		$rules = array(
				'name' => 'required|xss_clean'
		);
	
		$this->form_validation->set_rules('name', 'Van Type Name', $rules['name']);
	
	}
}