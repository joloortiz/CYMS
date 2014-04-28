<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Truckers extends MY_Controller {
	
	public $adminRequired = TRUE;
	
	
	/* PAGES */
	function index() {

		$config['base_url'] = BASE_URL . 'truckers/';
		$config['total_rows'] = $this->truckers_model->record_count();
		$config['per_page'] = 5; 
		$config['uri_segment'] = 2;


		$this->pagination->initialize($config); 

		$offset = $this->uri->segment(2);


		$truckers = $this->truckers_model->p_truckers($config['per_page'], $offset);

		$pagination = $this->pagination->create_links();

		// page js
		$js = array(
				'pages/truckers.js'
		);
		$this->smarty->assign('page_js', $js);
		
		// Data
		$data['page_title'] = "Truckers";
		
		$this->smarty->assign('truckers', $truckers);
		$this->smarty->assign('pagination', $pagination);		
		$this->smarty->assign('layout', 'crud_pages_layout.tpl');
		$this->smarty->assign('page', 'truckers');
		$this->smarty->view('pages/truckers.tpl', $data);
	}
	
	
	/* FUNCTIONS */
	
	function save() {
		try {
	
			$action = $this->input->post('action');
	
			$name = $this->input->post('trucker-name');
			$code = $this->input->post('trucker-code');
			$id = $this->input->post('trucker_id');
	
			$result = NULL;
	
			$data = array(
					't_name' => strtoupper( $name ),
					't_code' => strtoupper( $code )
			);
	
			if( $action == 'create' ) {
				$result = $this->truckers_model->new_trucker($data);
					
			}elseif( $action == 'update' && $this->_validate_trucker($id) ) {
				$result = $this->truckers_model->update_trucker($id, $data);
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
			$ids = $this->input->post('trucker_ids');
				
			if( is_array($ids) ) {
				foreach($ids as $trucker_id) {
					$this->truckers_model->purge_trucker($trucker_id);
				}
			}
				
			$var['done'] = TRUE;
				
		} catch (Exception $e) {
			$var['done'] = FALSE;
		}
	
		echo json_encode( $var );
	}
	
	function get_trucker_details() {
		try {
			$id = $this->input->post('id');
			$details = $this->truckers_model->get_trucker_by_id($id);
				
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
				$var['form_errors']['trucker-name'] = form_error('trucker-name') ? form_error('trucker-name') : NULL;
				$var['form_errors']['trucker-code'] = form_error('trucker-code') ? form_error('trucker-code') : NULL;
			}
		} catch (Exception $e) {
			$var['success'] = FALSE;
			$var['exception'] = $e->getMessage();
		}
	
		echo json_encode( $var );
	}
	
	/* PRIVATES */
	
	private function _validate_trucker($id) {
		$returnVal = FALSE;
	
		try {
			$trucker = $this->truckers_model->get_trucker_by_id($id);
				
			if( $trucker ) {
				$returnVal = TRUE;
			}
				
		} catch (Exception $e) {
			unset($e);
		}
	
		return $returnVal;
	}
	
	private function _set_form_rules() {
	
		$rules = array(
				'trucker-name' => 'required|xss_clean',
				'trucker-code' => 'xss_clean'
		);
	
		$this->form_validation->set_rules('trucker-name', 'Trucker Name', $rules['trucker-name']);
		$this->form_validation->set_rules('trucker-code', 'Trucker Code', $rules['trucker-code']);
	
	}
}