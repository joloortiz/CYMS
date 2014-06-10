<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Incoming_materials extends MY_Controller {
	
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
		$config['module_base_url'] = base_url() . 'materials-incoming/';
		$config['total_rows'] = $this->incoming_materials_model->record_count();
		$config['per_page'] = CRUD_PAGE_DISPLAY_LIMIT; 
		$config['uri_segment'] = 2;
		$config['base_url'] = base_url() . 'materials-incoming';


		$this->pagination->initialize($config); 

		$offset = $this->uri->segment(2);


		$incoming_materials = $this->incoming_materials_model->p_incoming_materials($config['per_page'], $offset);

		$pagination = $this->pagination->create_links();

		// page js
		$js = array(
				'pages/incoming_materials.js'
		);
		$this->smarty->assign('page_js', $js);
		
		// Data
		$data['page_title'] = "Incoming Materials";
		
		$this->smarty->assign('incoming_materials', $incoming_materials);
		$this->smarty->assign('pagination', $pagination);		
		$this->smarty->assign('layout', 'crud_pages_layout.tpl');
		$this->smarty->assign('page', 'incoming_materials');
		$this->smarty->view('pages/incoming_materials.tpl', $data);
	}
	
	
	/* FUNCTIONS */
	
	/**
	 * @return json Save status and exceptions if there are any.
	 *
	 * POST data:
	 * <ul>
	 *	<li><b>action</b>		<i>required</i>		Determines the save type. The function can only indentify two types (i.e. "create" and "update")</li>
	 *	<li><b>incoming-material-name</b>			Material name. This data is also required but the form validation will be the one to enforce it. Data will be transformed to upper case.</li>
	 *	<li><b>incoming_material_id</b>				Material ID. This data is required when trying to update a record. ID will be validated before updating record.</li>
	 * </ul>
	 *
	 * Accessed through ajax.
	 *
	 */
	function save() {
		try {
	
			$action = $this->input->post('action');
	
			$name = $this->input->post('incoming-material-name');
			$category = $this->input->post('material-category');
			$id = $this->input->post('incoming_material_id');
		
			$category = $this->_convert_material_category($category);
			$result = NULL;
	
			$data = array(
					'im_name' => strtoupper( $name ),
					'im_category' => strtoupper( $category )
			);
	
			if( $action == 'create' ) {
				$result = $this->incoming_materials_model->new_incoming_material($data);
					
			}elseif( $action == 'update' && $this->_validate_incoming_material($id) ) {
				$result = $this->incoming_materials_model->update_incoming_material($id, $data);
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
	 * <b>incoming_material_ids<b>	An array of IDs of the records that will be deleted.
	 *
	 * Accessed through ajax.
	 *
	 */
	function delete() {
		try {
			$ids = $this->input->post('incoming_material_ids');
				
			if( is_array($ids) ) {
				foreach($ids as $material_id) {
					$this->incoming_materials_model->purge_material($material_id);
				}
			}
				
			$var['done'] = TRUE;
				
		} catch (Exception $e) {
			$var['done'] = FALSE;
		}
	
		echo json_encode( $var );
	}
	
	/**
	 * @return json Material details or exceptions if unsuccessful.
	 *
	 * POST data:
	 * <b>id<b>		Material ID.
	 *
	 * Accessed through ajax.
	 *
	 */
	function get_incoming_material_details() {
		try {
			$id = $this->input->post('id');
			$details = $this->incoming_materials_model->get_incoming_material_by_id($id);
			if( $details ) {
				$details->im_category = $this->_convert_material_category($details->im_category);
			}
				
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
				$var['form_errors']['incoming-material-name'] = form_error('incoming-material-name') ? form_error('incoming-material-name') : NULL;
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
	 * Validates the record existence of the Incoming Material by its ID
	 *
	 * */
	private function _validate_incoming_material($id) {
		$returnVal = FALSE;
	
		try {
			$incoming_material = $this->incoming_materials_model->get_incoming_material_by_id($id);
				
			if( $incoming_material ) {
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
				'incoming-material-name' => 'required|xss_clean',
				'material-category' => 'required|xss_clean'
		);
	
		$this->form_validation->set_rules('incoming-material-name', 'Material Name', $rules['incoming-material-name']);
		$this->form_validation->set_rules('material-category', 'Material Category', $rules['material-category']);
	
	}
	
	private function _convert_material_category( $var ) {
		$categories = array(
				'local' => 1,
				'imported' => 2,
				'tempload' => 3
		);
	
		$result = NULL;
	
		if( isset( $categories[ strtolower($var) ] ) ) {
				
			$result = $categories[ strtolower($var) ];
				
		}else if( array_search( $var, $categories ) !== FALSE ) {
				
			$result = array_search( $var, $categories );
				
		}
	
		if( !$result && is_int($var) ) {
			$result = 'local';
		}elseif( !$result ) {
			$result = 1;
		}
	
		return $result;
	}
}