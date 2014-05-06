<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Checkers extends MY_Controller {
	
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
	
	/**
	 * @return json Save status and exceptions if there are any.
	 *
	 * POST data:
	 * <ul>
	 *	<li><b>action</b>		<i>required</i>	Determines the save type. The function can only indentify two types (i.e. "create" and "update")</li>
	 *	<li><b>first-name</b>					Checker first name. This data is also required but the form validation will be the one to enforce it. Data will be transformed to upper case.</li>
	 *	<li><b>mi</b>							Checker middle initial. Data will be transformed to upper case.</li>
	 *	<li><b>last-name</b>					Checker last name. This data is also required but the form validation will be the one to enforce it. Data will be transformed to upper case.</li>
	 *	<li><b>checker_id</b>					T-card type ID. This data is required when trying to update a record. ID will be validated before updating record.</li>
	 * </ul>
	 *
	 * Accessed through ajax.
	 *
	 */
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
	
	/**
	 * @return json Delete status and exceptions if there are any.
	 *
	 * POST data:
	 * <b>checker_ids<b>	An array of IDs of the records that will be deleted.
	 *
	 * Accessed through ajax.
	 *
	 */
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
	
	/**
	 * @return json Card type details or exceptions if unsuccessful.
	 *
	 * POST data:
	 * <b>id<b>		Checker ID.
	 *
	 * Accessed through ajax.
	 *
	 */
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
	
	/**
	 *
	 * @param int|string $id
	 * @return boolean
	 *
	 * Validates the record existence of the Checker by its ID
	 *
	 * */
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
				'first-name' => 'required|xss_clean',
				'last-name' => 'required|xss_clean',
				'mi' => 'xss_clean'
		);
	
		$this->form_validation->set_rules('first-name', 'First Name', $rules['first-name']);
		$this->form_validation->set_rules('last-name', 'Last Name', $rules['last-name']);
		$this->form_validation->set_rules('mi', 'Middle Initial', $rules['mi']);
	
	}
}