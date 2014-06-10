<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Truckers extends MY_Controller {
	
	/**
	 * @var boolean
	 *
	 * Class property that the function <code>check_admin_access()</code> from MY_Controller will be looking for
	 * to check if a module requires an administrator access.
	 */
	public $adminRequired = TRUE;
	
	
	/* PAGES */
	
	/**
	 * Page Index
	 */
	function index() {

		$config['module_base_url'] = base_url() . 'truckers/';
		$config['total_rows'] = $this->truckers_model->record_count();
		$config['per_page'] = CRUD_PAGE_DISPLAY_LIMIT; 
		$config['uri_segment'] = 2;
		$config['base_url'] = base_url() . 'truckers';


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
	
	/**
	 * @return json Save status and exceptions if there are any.
	 *
	 * POST data:
	 * <ul>
	 *	<li><b>action</b>		<i>required</i>	Determines the save type. The function can only indentify two types (i.e. "create" and "update")</li>
	 *	<li><b>trucker-name</b>					Trucker name. This data is also required but the form validation will be the one to enforce it. Data will be transformed to upper case.</li>
	 *	<li><b>trucker-code</b>					Trucker code. Data will be transformed to upper case.</li>
	 *	<li><b>trucker_id</b>					Trucker ID. This data is required when trying to update a record. ID will be validated before updating record.</li>
	 * </ul>
	 *
	 * Accessed through ajax.
	 *
	 */
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
	
	/**
	 * @return json Delete status and exceptions if there are any.
	 *
	 * POST data:
	 * <b>trucker_ids<b>	An array of IDs of the records that will be deleted.
	 *
	 * Accessed through ajax.
	 *
	 */
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
	
	/**
	 * @return json Trucker details or exceptions if unsuccessful.
	 *
	 * POST data:
	 * <b>id<b>		Trucker ID.
	 *
	 * Accessed through ajax.
	 *
	 */
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
	
	/**
	 * @return json Form validation result with validation errors if validation failed.
	 *
	 * <code>_set_form_rules()</code> will set the form validation rules. Visit function declaration for more info.
	 * <code>$this->form_validation->run()</code> will evaluate all POST data according to the form rules set by <code>_set_form_rules()</code>.
	 *
	 * Accessed through ajax.
	 *
	 */
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
	
	/**
	 *
	 * @param int|string $id
	 * @return boolean
	 *
	 * Validates the record existence of the Trucker by its ID
	 *
	 * */
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
	
	/**
	 *
	 * Sets the form validation rules.
	 * The rules are stored in an array with its rule name as the key.
	 *
	 * This function is utilizing the built-in form validation helper library of Codeigniter. For more information about the
	 * library please refer to the official documentation :D
	 */
	private function _set_form_rules() {
	
		$rules = array(
				'trucker-name' => 'required|xss_clean',
				'trucker-code' => 'xss_clean'
		);
	
		$this->form_validation->set_rules('trucker-name', 'Trucker Name', $rules['trucker-name']);
		$this->form_validation->set_rules('trucker-code', 'Trucker Code', $rules['trucker-code']);
	
	}
}