<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Materials extends MY_Controller {
	
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

		$config['module_base_url'] = base_url() . 'materials/';
		$config['total_rows'] = $this->materials_model->record_count();
		$config['per_page'] = CRUD_PAGE_DISPLAY_LIMIT; 
		$config['uri_segment'] = 2;
		$config['base_url'] = base_url() . 'materials';


		$this->pagination->initialize($config); 

		$offset = $this->uri->segment(2);


		$materials = $this->materials_model->p_materials($config['per_page'], $offset);
		
		if( $materials ) {
			foreach($materials as $k => $material) {
				$row = (array)$material;
				$row['m_category_fullname'] = $this->_get_material_category_fullname($row['m_category']);
				$materials[$k] = (object)$row;
			}
		}

		$pagination = $this->pagination->create_links();

		// page js
		$js = array(
				'pages/materials.js'
		);
		$this->smarty->assign('page_js', $js);
		
		// Data
		$data['page_title'] = "Outgoing Materials";
		
		$this->smarty->assign('materials', $materials);
		$this->smarty->assign('pagination', $pagination);
		$this->smarty->assign('layout', 'crud_pages_layout.tpl');
		$this->smarty->assign('page', 'materials');
		$this->smarty->view('pages/materials.tpl', $data);
	}
	
	
	/* FUNCTIONS */
	
	/**
	 * @return json Save status and exceptions if there are any.
	 * 
	 * POST data:
	 * <ul>
	 *	<li><b>action</b>		<i>required</i>		Determines the save type. The function can only indentify two types (i.e. "create" and "update")</li>
	 *	<li><b>material-name</b>					Material name. This data is also required but the form validation will be the one to enforce it. Data will be transformed to upper case.</li> 
	 *	<li><b>material-type</b>					Material type.</li>
	 *	<li><b>material_id</b>						Material ID. This data is required when trying to update a record. ID will be validated before updating record.</li>
	 * </ul>
	 *
	 * Accessed through ajax.
	 * 
	 */	
	function save() {
		try {
	
			$action = $this->input->post('action');
	
			$name = $this->input->post('material-name');
			$description = $this->input->post('material-description');
			$type = $this->input->post('material-type');
			$category = $this->input->post('material-category');
			$id = $this->input->post('material_id');
			
			$type = $this->_convert_material_type($type);
	
			$result = NULL;
	
			$data = array(
					'm_name' => strtoupper( $name ),
					'm_description' => strtoupper( $description ),
					'm_type' => strtoupper( $type ),
					'm_category' => strtoupper( $category )
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
	
	/**
	 * @return json Delete status and exceptions if there are any.
	 *
	 * POST data:
	 * <b>material_ids<b>	An array of IDs of the records that will be deleted.
	 *
	 * Accessed through ajax.
	 *
	 */
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
	
	/**
	 * @return json Material details or exceptions if unsuccessful.
	 *
	 * POST data:
	 * <b>id<b>		Material ID.
	 *
	 * Accessed through ajax.
	 *
	 */
	function get_material_details() {
		try {
			$id = $this->input->post('id');
			$details = $this->materials_model->get_material_by_id($id);
			if( $details ) {
				$details->m_type = $this->_convert_material_type($details->m_type);
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
				$var['form_errors']['material-name'] = form_error('material-name') ? form_error('material-name') : NULL;
				$var['form_errors']['material-description'] = form_error('material-description') ? form_error('material-description') : NULL;
				$var['form_errors']['material-type'] = form_error('material-type') ? form_error('material-type') : NULL;
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
	 * Validates the record existence of the material by its ID
	 *
	 * */
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
				'material-name' => 'required|xss_clean',
				'material-description' => 'xss_clean',
				'material-category' => 'required|xss_clean',
				'material-type' => 'xss_clean'
		);
	
		$this->form_validation->set_rules('material-name', 'Material Name', $rules['material-name']);
		$this->form_validation->set_rules('material-description', 'Material Description', $rules['material-description']);
		$this->form_validation->set_rules('material-category', 'Material Category', $rules['material-category']);
		$this->form_validation->set_rules('material-type', 'Material Type', $rules['material-type']);
	
	}
	
	private function _convert_material_type( $var ) {
		$types = array(
				'milk' => 1,
				'coffee' => 2
		);
	
		$result = NULL;
	
		if( isset( $types[ strtolower($var) ] ) ) {
			
			$result = $types[ strtolower($var) ];
			
		}else if( array_search( $var, $types ) !== FALSE ) {
			
			$result = array_search( $var, $types );
			
		}
		
		if( !$result && is_int($var) ) {
			$result = 'milk';
		}elseif( !$result ) {
			$result = 1;
		}
	
		return $result;
	}
	
	private function _get_material_category_fullname( $var ) {
		$categories = array(
				'FG' => 'FINISHED GOODS',
				'SFG' => 'SEMI-FINISHED GOODS'
		);	
	
		if( isset( $categories[ strtoupper($var) ] ) ) {
	
			$result = $categories[ strtoupper($var) ];
	
		}else {
			
			$result = $categories['FG'];
			
		}
	
		return $result;
	}
}