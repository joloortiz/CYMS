<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Van_types extends MY_Controller {
	
	/* PAGES */
	function index() {
		$config['base_url'] = BASE_URL . 'van-types/';
		$config['total_rows'] = $this->van_types_model->record_count();
		$config['per_page'] = 5; 
		$config['uri_segment'] = 2;


		$this->pagination->initialize($config); 

		$offset = $this->uri->segment(2);


		$van_types = $this->van_types_model->p_van_types($config['per_page'], $offset);

		$pagination = $this->pagination->create_links();

		// page js
		$js = array(
				'pages/van_types.js'
		);
		$this->smarty->assign('page_js', $js);
		
		$this->smarty->assign('van_types', $van_types);
		$this->smarty->assign('pagination', $pagination);		
		$this->smarty->assign('layout', 'crud_pages_layout.tpl');
		$this->smarty->assign('page', 'van_types');
		$this->smarty->view('pages/van_types.tpl');
	}
	
	
	/* FUNCTIONS */
	
	function save() {
		try {
	
			$action = $this->input->post('action');
	
			$name = $this->input->post('van-type-name');
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
				$var['form_errors']['van-type-name'] = form_error('van-type-name') ? form_error('van-type-name') : NULL;
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
				'van-type-name' => 'required|xss_clean'
		);
	
		$this->form_validation->set_rules('van-type-name', 'Van Type Name', $rules['van-type-name']);
	
	}
}