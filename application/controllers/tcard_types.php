<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Tcard_types extends MY_Controller {
	
	public $adminRequired = TRUE;
		
	/* PAGES */
	function index() {
		$config['base_url'] = BASE_URL . 'tcard-types/';
		$config['total_rows'] = $this->tcard_model->record_count();
		$config['per_page'] = 5; 
		$config['uri_segment'] = 2;


		$this->pagination->initialize($config); 

		$offset = $this->uri->segment(2);


		$types = $this->tcard_model->p_types($config['per_page'], $offset);

		$pagination = $this->pagination->create_links();

		// page js
		$js = array(
				'pages/tcard_types.js'
		);
		$this->smarty->assign('page_js', $js);
		
		// Data
		$data['page_title'] = "T-Card Types";
		
		$this->smarty->assign('types', $types);
		$this->smarty->assign('pagination', $pagination);
		$this->smarty->assign('layout', 'crud_pages_layout.tpl');
		$this->smarty->assign('page', 'tcard_types');
		$this->smarty->view('pages/tcard_types.tpl', $data);
	}
	
	/* FUNCTIONS */
	function save() {
		try {
				
			$action = $this->input->post('action');
				
			$name = $this->input->post('type-name');
			$color = $this->input->post('type-color');
			$id = $this->input->post('type_id');
				
			$result = NULL;
				
			$data = array(
					'tt_name' => strtoupper( $name ),
					'tt_color' => strtoupper( $color )
			);
				
			if( $action == 'create' ) {
				$result = $this->tcard_model->new_type($data);
					
			}elseif( $action == 'update' && $this->_validate_type($id) ) {
				$result = $this->tcard_model->update_type($id, $data);
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
			$ids = $this->input->post('type_ids');
				
			if( is_array($ids) ) {
				foreach($ids as $type_id) {
					$this->tcard_model->purge_type($type_id);
				}
			}
				
			$var['done'] = TRUE;
				
		} catch (Exception $e) {
			$var['done'] = FALSE;
		}
	
		echo json_encode( $var );
	}
	
	function get_type_details() {
		try {
			$id = $this->input->post('id');
			$details = $this->tcard_model->get_type_by_id($id);
			
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
				$var['form_errors']['type-name'] = form_error('type-name') ? form_error('type-name') : NULL;
				$var['form_errors']['type-color'] = form_error('type-color') ? form_error('type-color') : NULL;
			}
		} catch (Exception $e) {
			$var['success'] = FALSE;
			$var['exception'] = $e->getMessage();
		}
	
		echo json_encode( $var );
	}
	
	/* PRIVATES */
	
	private function _validate_type($id) {
		$returnVal = FALSE;
		
		try {
			$type = $this->tcard_model->get_type_by_id($id);
			
			if( $type ) {
				$returnVal = TRUE;
			}
			
		} catch (Exception $e) {
			unset($e);
		}
		
		return $returnVal;
	}
	
	private function _set_form_rules() {
	
		$rules = array(
				'type-name' => 'required|xss_clean',
				'type-color' => 'required|xss_clean'
		);
	
		$this->form_validation->set_rules('type-name', 'T-card Type Name', $rules['type-name']);
		$this->form_validation->set_rules('type-color', 'T-card Type Color Indicator', $rules['type-color']);
	
	}
}