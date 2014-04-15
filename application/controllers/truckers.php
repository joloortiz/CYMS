<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Truckers extends MY_Controller {
	
	/* PAGES */
	function index() {
		// page js
		$js = array(
				'pages/truckers.js'
		);
		$this->smarty->assign('page_js', $js);
		
		$trucks = $this->truckers_model->get_truckers();
		$this->smarty->assign('truckers', $trucks);
		
		$this->smarty->assign('layout', 'crud_pages_layout.tpl');
		$this->smarty->assign('page', 'truckers');
		$this->smarty->view('pages/truckers.tpl');
	}
	
	
	/* FUNCTIONS */
	
	function save() {
		try {
	
			$action = $this->input->post('action');
	
			$name = $this->input->post('name');
			$code = $this->input->post('code');
			$id = $this->input->post('trucker_id');
	
			$result = NULL;
	
			$data = array(
					't_name' => $name,
					't_code' => $code
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
}