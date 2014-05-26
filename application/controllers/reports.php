<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Reports extends MY_Controller {

	# Index
	function index() {
		/*
		//load our new PHPExcel library
		$this->load->library('excel');
		//activate worksheet number 1
		$this->excel->setActiveSheetIndex(0);
		//name the worksheet
		$this->excel->getActiveSheet()->setTitle('test worksheet');
		//set cell A1 content with some text
		$this->excel->getActiveSheet()->setCellValue('A1', 'This is just some text value');
		//change the font size
		$this->excel->getActiveSheet()->getStyle('A1')->getFont()->setSize(20);
		//make the font become bold
		$this->excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(true);
		//merge cell A1 until D1
		$this->excel->getActiveSheet()->mergeCells('A1:D1');
		//set aligment to center for that merged cell (A1 to D1)
		$this->excel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		 
		$filename='just_some_random_name.xls'; //save our workbook as this file name
		header('Content-Type: application/vnd.ms-excel'); //mime type
		header('Content-Disposition: attachment;filename="'.$filename.'"'); //tell browser what's the file name
		header('Cache-Control: max-age=0'); //no cache
		             
		//save it to Excel5 format (excel 2003 .XLS file), change this to 'Excel2007' (and adjust the filename extension, also the header mime type)
		//if you want to save it as .XLSX Excel 2007 format
		$objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel5');  
		//force user to download the Excel file without writing it to server's HD
		$objWriter->save('php://output');
		*/

		$css = array(
				'reports.css',
				'reports-print.css'
		);

		$this->smarty->assign('page_css', $css);

		$js = array(
				'pages/reports.js'
		);

		$this->smarty->assign('page_js', $js);

		$data['page_title'] = "Reports";

		$this->smarty->assign('layout', 'crud_pages_layout.tpl');
		$this->smarty->assign('page', 'reports');
		$this->smarty->view('pages/reports.tpl', $data);
	}

	/*
	*
	*FSC OUTBOUND FUNCTIONS 
	*
	*/

	function fsc_outbound_report() {
		$this->load->model('reports_model');

		$data = $this->reports_model->dispatch_standings_fulls();

		$data = array(
				'dispatch_standings_fulls' => $this->reports_model->dispatch_standings_fulls(),
				'dispatch_standings_exfac' => $this->reports_model->dispatch_standings_exfac(),
				'pending_fulls_sealed' => $this->reports_model->pending_fulls_sealed(),
				'pending_fulls_unsealed' => $this->reports_model->pending_fulls_unsealed(),
				'pending_exfac_sealed' => $this->reports_model->pending_exfac_sealed(),
				'pending_exfac_unsealed' => $this->reports_model->pending_exfac_unsealed(),
				'empty_vans_running_balance' => $this->reports_model->empty_vans_running_balance()
			);

		echo json_encode($data);
	}

	/*

	private function __dispatch_standings_fulls() {
		$data = $this->reports_model->dispatch_standings_fulls();
		json_encode($data);

		$array = array(

		);
	}*/
}