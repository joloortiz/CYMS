<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Tcard_types extends MY_Controller {
	
	/* PAGES */
	function index() {
		// page js
		$js = array(
				'pages/tcard_types.js'
		);
		$this->smarty->assign('page_js', $js);
		
		$types = $this->tcard_model->get_types();
		$this->smarty->assign('types', $types);
		
		$this->smarty->assign('layout', 'crud_pages_layout.tpl');
		$this->smarty->assign('page', 't-card_types');
		$this->smarty->view('pages/tcard_types.tpl');
	}
	
	/* FUNCTIONS */
	function save() {
		try {
				
			$action = $this->input->post('action');
				
			$name = $this->input->post('name');
			$color = $this->input->post('color');
			$id = $this->input->post('type_id');
				
			$result = NULL;
				
			$data = array(
					'tt_name' => $name,
					'tt_color' => $color
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
}