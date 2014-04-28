<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Checkers extends MY_Controller {
	
	public $adminRequired = TRUE;
		
	/* PAGES */
	function index() {

		$config['base_url'] = BASE_URL . 'checkers/';
		$config['total_rows'] = $this->checkers_model->record_count();
		$config['per_page'] = 5;
		$config['uri_segment'] = 2;


		$this->pagination->initialize($config); 

		$offset = $this->uri->segment(2);


		$checkers = $this->checkers_model->p_checkers($config['per_page'], $offset);
		
		$names = array();
		if( $checkers ) {
			foreach( $checkers as $k => $v ) {
				$names['c_id'] = $v->c_id;
				$names['name'] = "$v->c_firstname $v->c_mi $v->c_lastname";
				
				$checkers[$k] = (object)$names;
			}			
		}

		$pagination = $this->pagination->create_links();

		// page js
		$js = array(
				'pages/checkers.js'
		);
		$this->smarty->assign('page_js', $js);
		
		// Data
		$data['page_title'] = "Checkers";
		
		$this->smarty->assign('checkers', $checkers);
		$this->smarty->assign('pagination', $pagination);		
		$this->smarty->assign('layout', 'crud_pages_layout.tpl');
		$this->smarty->assign('page', 'checkers');
		$this->smarty->view('pages/checkers.tpl', $data);
	}
	
	
	/* FUNCTIONS */
	
	function save() {
		try {
	
			$action = $this->input->post('action');
	
			$fname = $this->input->post('first-name');
			$mi = $this->input->post('mi');
			$lname = $this->input->post('last-name');
			$id = $this->input->post('checker_id');
	
			$result = NULL;
	
			$data = array(
					'c_firstname' => strtoupper( $fname ),
					'c_lastname' => strtoupper( $lname ),
					'c_mi' => strtoupper( $mi )
			);
	
			if( $action == 'create' ) {
				$result = $this->checkers_model->new_checker($data);
					
			}elseif( $action == 'update' && $this->_validate_checker($id) ) {
				$result = $this->checkers_model->update_checker($id, $data);
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
			$ids = $this->input->post('checker_ids');
				
			if( is_array($ids) ) {
				foreach($ids as $checker_id) {
					$this->checkers_model->purge_checker($checker_id);
				}
			}
				
			$var['done'] = TRUE;
				
		} catch (Exception $e) {
			$var['done'] = FALSE;
		}
	
		echo json_encode( $var );
	}
	
	function get_checker_details() {
		try {
			$id = $this->input->post('id');
			$details = $this->checkers_model->get_checker_by_id($id);
				
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
				$var['form_errors']['first-name'] = form_error('first-name') ? form_error('first-name') : NULL;
				$var['form_errors']['last-name'] = form_error('last-name') ? form_error('last-name') : NULL;
				$var['form_errors']['mi'] = form_error('mi') ? form_error('mi') : NULL;
			}
		} catch (Exception $e) {
			$var['success'] = FALSE;
			$var['exception'] = $e->getMessage();
		}
	
		echo json_encode( $var );
	}
	
	/* PRIVATES */
	
	private function _validate_checker($id) {
		$returnVal = FALSE;
	
		try {
			$checker = $this->checkers_model->get_checker_by_id($id);
				
			if( $checker ) {
				$returnVal = TRUE;
			}
				
		} catch (Exception $e) {
			unset($e);
		}
	
		return $returnVal;
	}
	
	private function _set_form_rules() {
	
		$rules = array(
				'first-name' => 'required|xss_clean',
				'last-name' => 'required|xss_clean',
				'mi' => 'xss_clean'
		);
	
		$this->form_validation->set_rules('first-name', 'First Name', $rules['first-name']);
		$this->form_validation->set_rules('last-name', 'Last Name', $rules['last-name']);
		$this->form_validation->set_rules('mi', 'Middle Initial', $rules['mi']);
	
	}
}