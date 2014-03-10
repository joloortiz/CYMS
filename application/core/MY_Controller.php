<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MY_Controller extends CI_Controller {

   /**
    * Index Page for this controller.
    *
    * Maps to the following URL
    * 		http://example.com/index.php/welcome
    *	- or -  
    * 		http://example.com/index.php/welcome/index
    *	- or -
    * Since this controller is set as the default controller in 
    * config/routes.php, it's displayed at http://example.com/
    *
    * So any other public methods not prefixed with an underscore will
    * map to /index.php/welcome/<method_name>
    * @see http://codeigniter.com/user_guide/general/urls.html
    */
   
    public function __construct() {
		parent::__construct();

        //Session 

        //$session_id = $this->session->userdata('cyms');
        
        /*
        if(isset($session_id)){
            redirect('/dashboard');
        }elseif(!isset($session_id)){
            redirect('/login');
        }
        */

        // CSS
		$css = array(
			'style.css'
		);
      
		// JS
		$js = array(
			'jquery-1.9.1.min.js'
		);
        
		$this->smarty->assign('base_url', base_url());
        $this->smarty->assign('default_css', $css);
		$this->smarty->assign('default_js', $js);
    }
}