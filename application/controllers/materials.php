<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Materials extends MY_Controller {
	
	/* PAGES */
	function index() {

		$config['base_url'] = BASE_URL . 'materials/';
		$config['total_rows'] = $this->materials_model->record_count();
		$config['per_page'] = 5; 
		$config['uri_segment'] = 2;


		$this->pagination->initialize($config); 

		$offset = $this->uri->segment(2);


		$materials = $this->materials_model->p_materials($config['per_page'], $offset);

		$pagination = $this->pagination->create_links();

		// page js
		$js = array(
				'pages/materials.js'
		);
		$this->smarty->assign('page_js', $js);
		
		$this->smarty->assign('materials', $materials);
		$this->smarty->assign('pagination', $pagination);
		$this->smarty->assign('layout', 'crud_pages_layout.tpl');
		$this->smarty->assign('page', 'materials');
		$this->smarty->view('pages/materials.tpl');
	}
	
	
	/* FUNCTIONS */
	
	function save() {
		try {
	
			$action = $this->input->post('action');
	
			$name = $this->input->post('material-name');
			$type = $this->input->post('material-type');
			$id = $this->input->post('material_id');
	
			$result = NULL;
	
			$data = array(
					'm_name' => $name,
					'm_type' => $type
			);
	
			if( $action == 'create' ) {
				$result = $this->materials_model->new_material($data);
					
			}elseif( $action == 'update' && $this->_validate_material($id) ) {
				$result = $this->materials_model->update_material($id, $data);
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
			$ids = $this->input->post('material_ids');
				
			if( is_array($ids) ) {
				foreach($ids as $material_id) {
					$this->materials_model->purge_material($material_id);
				}
			}
				
			$var['done'] = TRUE;
				
		} catch (Exception $e) {
			$var['done'] = FALSE;
		}
	
		echo json_encode( $var );
	}
	
	function get_material_details() {
		try {
			$id = $this->input->post('id');
			$details = $this->materials_model->get_material_by_id($id);
				
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
				$var['form_errors']['material-name'] = form_error('material-name') ? form_error('material-name') : NULL;
				$var['form_errors']['material-type'] = form_error('material-type') ? form_error('material-type') : NULL;
			}
		} catch (Exception $e) {
			$var['success'] = FALSE;
			$var['exception'] = $e->getMessage();
		}
	
		echo json_encode( $var );
	}
	
	/* PRIVATES */
	
	private function _validate_material($id) {
		$returnVal = FALSE;
	
		try {
			$type = $this->materials_model->get_material_by_id($id);
				
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
				'material-name' => 'required|xss_clean',
				'material-type' => 'required|xss_clean'
		);
	
		$this->form_validation->set_rules('material-name', 'Material Name', $rules['material-name']);
		$this->form_validation->set_rules('material-type', 'Material Type', $rules['material-type']);
	
	}
}