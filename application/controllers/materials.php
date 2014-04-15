<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Materials extends MY_Controller {
	
	/* PAGES */
	function index() {
		// page js
		$js = array(
				'pages/materials.js'
		);
		$this->smarty->assign('page_js', $js);
		
		$mats = $this->materials_model->get_materials();
		$this->smarty->assign('materials', $mats);
		
		$this->smarty->assign('layout', 'crud_pages_layout.tpl');
		$this->smarty->assign('page', 'materials');
		$this->smarty->view('pages/materials.tpl');
	}
	
	
	/* FUNCTIONS */
	
	function save() {
		try {
	
			$action = $this->input->post('action');
	
			$name = $this->input->post('name');
			$type = $this->input->post('type');
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
}