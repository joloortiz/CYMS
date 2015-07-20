/*
*
* Event Listeners
*
*/

/* 
* 
* FSC OUTBOUND REPORT 
*
*/

//when the user chooses the fsc-outbound-report
$('#fsc-outbound-report').click(function() {

	show_loader();

	$('.issues-text').val('');
    $('.timestamp').empty();

    var dispatch_standings_shippers = fsc_dispatch_standings_shippers();
    var dispatch_standings_truckers = fsc_dispatch_standings_truckers();
    var pending_shippers = fsc_pending_shippers();
    var pending_truckers = fsc_pending_truckers();
    var empty_vans_for_stuffing_shippers = fsc_empty_vans_for_stuffing_shippers();
    var empty_vans_for_stuffing_truckers = fsc_empty_vans_for_stuffing_truckers();

   	//console.log(dispatch_standings_shippers);
   	//console.log(dispatch_standings_truckers);
    set_fsc_dispatch_standings(dispatch_standings_shippers, dispatch_standings_truckers);

    //console.log(pending_shippers);
    //console.log(pending_truckers);
    set_fsc_pending(pending_shippers, pending_truckers);

   	//console.log(empty_vans_for_stuffing_shippers);
   	//console.log(empty_vans_for_stuffing_truckers);
   	set_fsc_empty_vans_for_stuffing(empty_vans_for_stuffing_shippers, empty_vans_for_stuffing_truckers);

	$('.fsc-outbound-report .timestamp').append('Generated at ' + now().time + ' on ' + now().date);

	remove_loader();

	$('.fsc-outbound-report-modal').modal({
		show: true
	})

});

//when the modal is closed
$('.fsc-outbound-report-modal').on('hidden.bs.modal', function () {
	
	//empty all the data on the tables
  	clear_fsc_outbound_report()

})

//user prints the preview
$('#report-print').click(function() {

	var issues = $('.issues-text').val();

	append = { 	'reportname' : 'fsc_outbound_report',
				'selector' : '.issues-display p',
				'content' : issues
				};

	print_element('print-section-fsc', 'reports-print.css', append);

});


/*
*
* DEFECTIVE VANS REPORT
*
*/

//when the user chooses the defective-vans-report
$('#defective-vans-report').click(function() {

	show_loader();

    $('.timestamp').empty();

    var data = defective_vans_report();

    if(data.length > 0) {

    	for(var i = 0; i < data.length; i++) {

    		$('.defective-vans').find('tbody').append('<tr><td>' + data[i].v_no + '</td><td>' + data[i].tc_entrydate + '</td><td>' + data[i].s_name + '</td><td>' + data[i].vt_name + '</td><td>' + data[i].tc_block_reason + '</td></tr>');

    	}

    } else {

    	$('.defective-vans').find('tbody').append('<tr><td colspan="5">Sorry there are currently no defective vans in the Container Yard</td></tr>');
    
    }

    remove_loader();

    $('.defective-vans-report .timestamp').append('Generated at ' + now().time + ' on ' + now().date);

	$('.defective-vans-report-modal').modal({
			show: true
	})

});

//when the modal is closed
$('.defective-vans-report-modal').on('hidden.bs.modal', function () {
	
	//empty all the data on the tables
    empty_defective_vans_report();

});

//user prints the preview
$('.defective-vans-report-modal #report-print').click(function() {
	
	print_element('print-section-defective-vans', 'reports-print.css');

});	

/*
*
* EMPTY VANS REPORT
*
*/

//when the user chooses the empty-vans-report
$('#empty-vans-report').click(function() {
	
	show_loader();

    $('.timestamp').empty();

    var evr_empty_vans_report_shippers = empty_vans_report_shippers();
    var evr_empty_vans_report_truckers = empty_vans_report_truckers();

    //console.log(evr_empty_vans_report_shippers);
    //console.log(evr_empty_vans_report_truckers);
    set_evr_empty_vans_report(evr_empty_vans_report_shippers, evr_empty_vans_report_truckers);

    remove_loader();

    $('.empty-vans-report .timestamp').append('Generated at ' + now().time + ' on ' + now().date);
	
	$('.empty-vans-report-modal').modal({
			show: true
	})

});

//when the modal is closed
$('.empty-vans-report-modal').on('hidden.bs.modal', function () {
	
	//empty all the data on the tables
    clear_empty_vans_report();

});

//user prints the preview
$('.empty-vans-report-modal #report-print').click(function() {
	
	print_element('print-section-empty-vans', 'reports-print.css');

});	



/*
*
* EMPTY VANS STRIPPING REPORT
*
*/


//when the user chooses the empty-vans-report
$('#empty-vans-stripping-report').click(function() {
	
	show_loader();

    $('.timestamp').empty();

    var shippers= empty_vans_stripping_shippers();
    var truckers = empty_vans_stripping_truckers();

    //console.log(evr_empty_vans_report_shippers);
    //console.log(evr_empty_vans_report_truckers);
    set_evsr_empty_vans_stripping_report(shippers, truckers);

    remove_loader();

    $('.empty-vans-stripping-report .timestamp').append('Generated at ' + now().time + ' on ' + now().date);
	
	$('.empty-vans-stripping-report-modal').modal({
			show: true
	})

});

//when the modal is closed
$('.empty-vans-stripping-report-modal').on('hidden.bs.modal', function () {
	
	//empty all the data on the tables
    clear_empty_vans_stripping_report();

});

//user prints the preview
$('.empty-vans-stripping-report-modal #report-print').click(function() {
	
	print_element('print-section-empty-vans-stripping', 'reports-print.css');

});	



/*
*
* EMPTY VANS STUFFING REPORT
*
*/


//when the user chooses the empty-vans-report
$('#empty-vans-stuffing-report').click(function() {
	
	show_loader();

    $('.timestamp').empty();

    var shippers= empty_vans_stuffing_shippers();
    var truckers = empty_vans_stuffing_truckers();

    //console.log(evr_empty_vans_report_shippers);
    //console.log(evr_empty_vans_report_truckers);
    set_evsr_empty_vans_stuffing_report(shippers, truckers);

    remove_loader();

    $('.empty-vans-stuffing-report .timestamp').append('Generated at ' + now().time + ' on ' + now().date);
	
	$('.empty-vans-stuffing-report-modal').modal({
			show: true
	})

});

//when the modal is closed
$('.empty-vans-stuffing-report-modal').on('hidden.bs.modal', function () {
	
	//empty all the data on the tables
    clear_empty_vans_stuffing_report();

});

//user prints the preview
$('.empty-vans-stuffing-report-modal #report-print').click(function() {
	
	print_element('print-section-empty-vans-stuffing', 'reports-print.css');

});	


/*
*
* DAILY INVENTORY REPORT
*
*/

//when the user chooses the empty-vans-report
$('#daily-inventory-report').click(function() {
	
	show_loader();

    $('.timestamp').empty();

    var stripping_packmats_truckers = di_stripping_packmats_truckers();
    var stripping_rawmats_consolidated = di_stripping_rawmats_consolidated();
    var stripping_rawmats_truckers = di_stripping_rawmats_truckers();
    var greencoffee = di_stripping_greencoffee();
    var empty_for_return = di_empty_for_return();
    var empty_for_stuffing_shippers = empty_vans_report_shippers();
    var empty_for_stuffing_truckers = empty_vans_report_truckers();
    var empty_defectives_shippers = di_defective_vans_shippers();
    var empty_defectives_truckers = di_defective_vans_truckers();
    var finished_goods_shippers = di_finished_goods_shippers();
    var finished_goods_truckers = di_finished_goods_truckers();
    var semi_finished_goods_shippers = di_semi_finished_goods_shippers();
    var semi_finished_goods_truckers = di_semi_finished_goods_truckers();
    var rework_powder_shippers = di_rework_powder_shippers();
    var rework_powder_truckers = di_rework_powder_truckers();
    var hold_products_shippers = di_hold_products_shippers();
    var hold_products_truckers = di_hold_products_truckers();
    var for_processing_late_over_shippers = di_for_processing_late_over_shippers();
    var for_processing_late_over_truckers = di_for_processing_late_over_truckers();
    var total_teu = get_total_teu();
    var total_by_van_type = get_total_by_van_type();

    //console.log(stripping_packmats_truckers);
    set_di_stripping_packmats(stripping_packmats_truckers);

	//console.log(stripping_rawmats_shippers);
    //console.log(stripping_rawmats_truckers)
    set_di_stripping_rawmats(stripping_rawmats_consolidated, stripping_rawmats_truckers);

	//console.log(greencoffee);
    set_di_stripping_greencoffee(greencoffee);

    //console.log(empty_for_return);
    set_di_empty_for_return(empty_for_return);

    //console.log(empty_for_stuffing_shippers);
    //console.log(empty_for_stuffing_truckers);
    set_di_empty_for_stuffing(empty_for_stuffing_shippers, empty_for_stuffing_truckers);

    //console.log(empty_defectives_shippers);
    //console.log(empty_defectives_truckers)
    set_di_empty_defectives(empty_defectives_shippers, empty_defectives_truckers);

    //console.log(finished_goods_shippers);
    //console.log(finished_goods_truckers);
    set_di_finished_goods(finished_goods_shippers, finished_goods_truckers);

    //console.log(semi_finished_goods_shippers);
    //console.log(semi_finished_goods_truckers);
    set_di_semi_finished_goods(semi_finished_goods_shippers, semi_finished_goods_truckers);

    //console.log(rework_powder_shippers);
    //console.log(rework_powder_truckers);
    set_di_rework_powder(rework_powder_shippers, rework_powder_truckers);

    //console.log(hold_products_shippers);
    //console.log(hold_products_truckers);
    set_di_hold_products(hold_products_shippers, hold_products_truckers);

    //console.log(for_processing_late_over_shippers);
    //console.log(for_processing_late_over_truckers);
    set_di_for_processing_late_over(for_processing_late_over_shippers, for_processing_late_over_truckers);    

    //console.log(total_by_van_type);
    //console.log(total_teu);
    set_grand_total(total_teu, total_by_van_type);

    remove_loader();

    $('.daily-inventory-report .timestamp').append('Generated at ' + now().time + ' on ' + now().date);
	
	$('.daily-inventory-report-modal').modal({
			show: true
	})

});

//when the modal is closed
$('.daily-inventory-report-modal').on('hidden.bs.modal', function () {
	
	//empty all the data on the tables
    clear_daily_inventory_report();

});


//user prints the preview
$('.daily-inventory-report-modal #report-print').click(function() {
	
	print_element('print-section-daily-inventory-report', 'reports-print.css');

});	


/* 
*
* Front End Functions 
*
*/

/*
*
* FSC DISPATCH STANDINGS
*
*/

function set_fsc_dispatch_standings_shippers(rows) {

	for(var i = 0; i < rows.length; i ++) {

		if(rows[i].tt_id == '2') {

			$('.fsc-outbound-report-modal .fsc-dispatch-standings .resupply tr[data-sid="' + rows[i].s_id + '"][data-vtid="' + rows[i].vt_id + '"]').find('td:nth-child(3)').append(rows[i].TEU);

		} else if(rows[i].tt_id == '6'){

			$('.fsc-outbound-report-modal .fsc-dispatch-standings .exfactory tr[data-sid="' + rows[i].s_id + '"][data-vtid="' + rows[i].vt_id + '"]').find('td:nth-child(3)').append(rows[i].TEU);

		}
	}
	
}

function set_fsc_dispatch_standings_truckers(rows) {

	for(var i = 0; i < rows.length; i ++) {

		if(rows[i].tt_id == '2') {

			$('.fsc-outbound-report-modal .fsc-dispatch-standings .resupply tr[data-tid="' + rows[i].t_id + '"][data-vtid="' + rows[i].vt_id + '"]').find('td:nth-child(3)').append(rows[i].TEU);

		} else if(rows[i].tt_id == '6'){

			$('.fsc-outbound-report-modal .fsc-dispatch-standings .exfactory tr[data-tid="' + rows[i].t_id + '"][data-vtid="' + rows[i].vt_id + '"]').find('td:nth-child(3)').append(rows[i].TEU);

		}
	}
	
}

function set_fsc_dispatch_standings_total() {

	var total = 0; 

	$('.fsc-outbound-report-modal .fsc-dispatch-standings tr').find('td:nth-child(3)').each(function() {

		var vans = parseInt($(this).text());

		if(vans) {
			
			total += vans;

		}

	});

	$('.fsc-outbound-report-modal .fsc-dispatch-standings .total').find('th:nth-child(2)').append(total);

}

function set_fsc_dispatch_standings(fsc_dispatch_standings_shippers, fsc_dispatch_standings_truckers) {

	set_fsc_dispatch_standings_shippers(fsc_dispatch_standings_shippers);
	set_fsc_dispatch_standings_truckers(fsc_dispatch_standings_truckers);
	set_fsc_dispatch_standings_total()

}

/*
*
* END FSC DISPATCH STANDINGS
*
*/

/*
*
* FSC PENDING
*
*/

function set_fsc_pending_shippers(rows) {

	for(var i = 0; i < rows.length; i ++) {

		if(rows[i].tt_id == '2') {

			if(parseInt(rows[i].for_processing) > 0){

				$('.fsc-outbound-report-modal .fsc-pending .resupply tr[data-sid="' + rows[i].s_id + '"][data-vtid="' + rows[i].vt_id + '"]').find('td:nth-child(3)').append(rows[i].for_processing);
			
			}

			if(parseInt(rows[i].late_over) > 0){

				$('.fsc-outbound-report-modal .fsc-pending .resupply tr[data-sid="' + rows[i].s_id + '"][data-vtid="' + rows[i].vt_id + '"]').find('td:nth-child(4)').append(rows[i].late_over);

			}

		} else if(rows[i].tt_id == '6'){

			if(parseInt(rows[i].for_processing) > 0){

				$('.fsc-outbound-report-modal .fsc-pending .exfactory tr[data-tid="' + rows[i].s_id + '"][data-vtid="' + rows[i].vt_id + '"]').find('td:nth-child(3)').append(rows[i].for_processing);
			
			}

			if(parseInt(rows[i].late_over) > 0){

				$('.fsc-outbound-report-modal .fsc-pending .resupply tr[data-tid="' + rows[i].s_id + '"][data-vtid="' + rows[i].vt_id + '"]').find('td:nth-child(4)').append(rows[i].late_over);

			}
		}
	}
	
}

function set_fsc_pending_truckers(rows) {

	for(var i = 0; i < rows.length; i ++) {

		if(rows[i].tt_id == '2') {

			if(parseInt(rows[i].for_processing) > 0){

				$('.fsc-outbound-report-modal .fsc-pending .resupply tr[data-tid="' + rows[i].t_id + '"][data-vtid="' + rows[i].vt_id + '"]').find('td:nth-child(3)').append(rows[i].for_processing);

			}

			if(parseInt(rows[i].late_over) > 0){

				$('.fsc-outbound-report-modal .fsc-pending .resupply tr[data-tid="' + rows[i].t_id + '"][data-vtid="' + rows[i].vt_id + '"]').find('td:nth-child(4)').append(rows[i].late_over);

			}

		} else if(rows[i].tt_id == '6'){

			if(parseInt(rows[i].for_processing) > 0){

				$('.fsc-outbound-report-modal .fsc-pending .exfactory tr[data-tid="' + rows[i].t_id + '"][data-vtid="' + rows[i].vt_id + '"]').find('td:nth-child(3)').append(rows[i].for_processing);

			}

			if(parseInt(rows[i].late_over) > 0){

				$('.fsc-outbound-report-modal .fsc-pending .exfactory tr[data-tid="' + rows[i].t_id + '"][data-vtid="' + rows[i].vt_id + '"]').find('td:nth-child(4)').append(rows[i].late_over);

			}
		}
	}
	
}

function set_fsc_pending_total() {

	var total_fp = 0; 
	var total_lo = 0;

	$('.fsc-outbound-report-modal .fsc-pending tr').find('td:nth-child(3)').each(function() {

		var vans = parseInt($(this).text());

		if(vans) {
			
			total_fp += vans;

		}

	});

	$('.fsc-outbound-report-modal .fsc-pending .total').find('th:nth-child(2)').append(total_fp);

		$('.fsc-outbound-report-modal .fsc-pending tr').find('td:nth-child(4)').each(function() {

		var vans = parseInt($(this).text());

		if(vans) {
			
			total_lo += vans;

		}

	});

	$('.fsc-outbound-report-modal .fsc-pending .total').find('th:nth-child(3)').append(total_lo);

}

function set_fsc_pending(fsc_pending_shippers, fsc_pending_truckers) {

	set_fsc_pending_shippers(fsc_pending_shippers);
	set_fsc_pending_truckers(fsc_pending_truckers);
	set_fsc_pending_total()

}

/*
*
* END PENDING
*
*/

/*
*
* FSC EMPTY VANS (FOR STUFFING)
*
*/

function set_fsc_empty_vans_for_stuffing_shippers(rows) {

	for(var i = 0; i < rows.length; i ++) {
		
		$('.fsc-outbound-report-modal .fsc-empty-vans tr[data-sid="' + rows[i].s_id + '"][data-vtid="' + rows[i].vt_id + '"]').find('td:nth-child(3)').append(rows[i].vans);
	
	}

}

function set_fsc_empty_vans_for_stuffing_truckers(rows) {

	for(var i = 0; i < rows.length; i ++) {

		$('.fsc-outbound-report-modal .fsc-empty-vans tr[data-tid="' + rows[i].t_id + '"][data-vtid="' + rows[i].vt_id + '"]').find('td:nth-child(3)').append(rows[i].vans);
	
	}

}

function set_fsc_empty_vans_for_stuffing_total() {

	var total = 0;

	$('.fsc-outbound-report-modal .fsc-empty-vans tr').find('td:nth-child(3)').each(function() {

		var vans = parseInt($(this).text());

		if(vans) {
			
			total += vans;

		}

	});

	$('.fsc-outbound-report-modal .fsc-empty-vans .total').find('th:nth-child(2)').append(total);

}

function set_fsc_empty_vans_for_stuffing(empty_vans_for_stuffing_shippers, empty_vans_for_stuffing_truckers) {

	set_fsc_empty_vans_for_stuffing_shippers(empty_vans_for_stuffing_shippers);
	set_fsc_empty_vans_for_stuffing_truckers(empty_vans_for_stuffing_truckers);
	set_fsc_empty_vans_for_stuffing_total()

}

/*
*
* END EMPTY VANS(FOR STUFFING)
*
*/

/*
*
* EMPTY VANS REPORT
*
*/

function set_evr_empty_vans_report_shippers(rows) {

	for(var i = 0; i < rows.length; i ++) {

		$('.empty-vans-report-modal .empty-vans-report tr[data-sid="' + rows[i].s_id + '"]').find('td:nth-child(3)').append(rows[i].vans);

	}
	
}

function set_evr_empty_vans_report_truckers(rows) {

	for(var i = 0; i < rows.length; i ++) {

		$('.empty-vans-report-modal .empty-vans-report tr[data-tid="' + rows[i].t_id + '"]').find('td:nth-child(3)').append(rows[i].vans);

	}
	
}

function set_evr_empty_vans_report_total() {

	var total = 0; 

	$('.empty-vans-report-modal .empty-vans-report tr').find('td:nth-child(3)').each(function() {

		var vans = parseInt($(this).text());

		if(vans) {
			
			total += vans;

		}

	});

	$('.empty-vans-report-modal .empty-vans-report .total').find('th:nth-child(2)').append(total);

}

function set_evr_empty_vans_report(evr_empty_vans_report_shippers, evr_empty_vans_report_truckers) {

	set_evr_empty_vans_report_shippers(evr_empty_vans_report_shippers);
	set_evr_empty_vans_report_truckers(evr_empty_vans_report_truckers);
	set_evr_empty_vans_report_total()

}

/*
*
* END EMPTY VANS REPORT
*
*/

/*
*
* START EMPTY VANS STRIPPING REPORT
*
*/

function set_evsr_empty_vans_stripping_report_shippers(rows) {

	for(var i = 0; i < rows.length; i ++) {

		$('.empty-vans-stripping-report-modal .empty-vans-shippers tbody .table-headers').after('<tr class="vans"><td>' + rows[i].s_name + '</td><td>' + rows[i].vt_name + '</td><td>' + rows[i].vans +'</td></tr>');

	}
	
}

function set_evsr_empty_vans_stripping_report_truckers(rows) {

	for(var i = 0; i < rows.length; i ++) {

		$('.empty-vans-stripping-report-modal .empty-vans-truckers tbody .table-headers').after('<tr class="vans"><td>' + rows[i].t_code + '</td><td>' + rows[i].vt_name + '</td><td>' + rows[i].vans +'</td></tr>');

	}
	
}

function set_evsr_empty_vans_stripping_report_total() {

	var shippers_total = 0; 
	var truckers_total = 0; 


	$('.empty-vans-stripping-report-modal .empty-vans-shippers tr.vans').find('td:nth-child(3)').each(function() {

		var vans = parseInt($(this).text());

		if(vans) {
			
			shippers_total += vans;

		}

	});

	$('.empty-vans-stripping-report-modal .empty-vans-truckers tr.vans').find('td:nth-child(3)').each(function() {

		var vans = parseInt($(this).text());

		if(vans) {
			
			truckers_total += vans;

		}

	});

	$('.empty-vans-stripping-report-modal .empty-vans-shippers .total').find('th:nth-child(2)').append(shippers_total);
	$('.empty-vans-stripping-report-modal .empty-vans-truckers .total').find('th:nth-child(2)').append(truckers_total);

}

function set_evsr_empty_vans_stripping_report(shippers, truckers) {

	set_evsr_empty_vans_stripping_report_shippers(shippers);
	set_evsr_empty_vans_stripping_report_truckers(truckers);
	set_evsr_empty_vans_stripping_report_total()

}

/*
*
* END EMPTY VANS STRIPPING REPORT
*
*/

/*
*
* START EMPTY VANS STUFFING REPORT
*
*/

function set_evsr_empty_vans_stuffing_report_shippers(rows) {

	for(var i = 0; i < rows.length; i ++) {

		$('.empty-vans-stuffing-report-modal .empty-vans-shippers tbody .table-headers').after('<tr class="vans"><td>' + rows[i].s_name + '</td><td>' + rows[i].vt_name + '</td><td>' + rows[i].vans +'</td></tr>');

	}
	
}

function set_evsr_empty_vans_stuffing_report_truckers(rows) {

	for(var i = 0; i < rows.length; i ++) {

		$('.empty-vans-stuffing-report-modal .empty-vans-truckers tbody .table-headers').after('<tr class="vans"><td>' + rows[i].t_code + '</td><td>' + rows[i].vt_name + '</td><td>' + rows[i].vans +'</td></tr>');

	}
	
}

function set_evsr_empty_vans_stuffing_report_total() {

	var shippers_total = 0; 
	var truckers_total = 0; 


	$('.empty-vans-stuffing-report-modal .empty-vans-shippers tr.vans').find('td:nth-child(3)').each(function() {

		var vans = parseInt($(this).text());

		if(vans) {
			
			shippers_total += vans;

		}

	});

	$('.empty-vans-stuffing-report-modal .empty-vans-truckers tr.vans').find('td:nth-child(3)').each(function() {

		var vans = parseInt($(this).text());

		if(vans) {
			
			truckers_total += vans;

		}

	});

	$('.empty-vans-stuffing-report-modal .empty-vans-shippers .total').find('th:nth-child(2)').append(shippers_total);
	$('.empty-vans-stuffing-report-modal .empty-vans-truckers .total').find('th:nth-child(2)').append(truckers_total);

}

function set_evsr_empty_vans_stuffing_report(shippers, truckers) {

	set_evsr_empty_vans_stuffing_report_shippers(shippers);
	set_evsr_empty_vans_stuffing_report_truckers(truckers);
	set_evsr_empty_vans_stuffing_report_total()

}

/*
*
* END EMPTY VANS STUFFING REPORT
*
*/

/*
*
* PACK MATS
*
*/

function set_di_stripping_packmats_truckers(rows) {

	var total = 0;

	for(var i = 0; i < rows.length; i++) {

		if(rows[i].im_category != null){

			$('.daily-inventory-report-modal .di-pack-mats .' + rows[i].im_category.toLowerCase() + ' tr[data-mid="' + rows[i].im_id + '"][data-vtid="' + rows[i].vt_id + '"][data-tid="' + rows[i].t_id +'"]').find('td:nth-child(4)').append(rows[i].vans);
		
		}
	}

}
/*
function set_di_stripping_packmats_consolidated(rows) {

	for(var i = 0; i < rows.length; i++) {

		if(rows[i].im_category != null){

			$('.daily-inventory-report-modal .di-pack-mats .' + rows[i].im_category.toLowerCase() + ' tr[data-mid="' + rows[i].im_id + '"][data-vtid="' + rows[i].vt_id + '"]').find('td:nth-child(4)').append(rows[i].vans);
		
		}
	}

}
*/
function set_di_stripping_packmats_total() {

	var total = 0;

	$('.daily-inventory-report .di-pack-mats tr').find('td:nth-child(4)').each(function() {
		
		var vans = parseInt($(this).text())
		if(vans) {

			total += vans;
			
		}

	});

	$('.daily-inventory-report-modal .di-pack-mats .total').find('th:nth-child(2)').append(total);

}

function set_di_stripping_packmats(stripping_packmats_truckers) {

	set_di_stripping_packmats_truckers(stripping_packmats_truckers);
    set_di_stripping_packmats_total();

}


/*
*
* RAW MATS
*
*/

function set_di_stripping_rawmats_consolidated(rows) {

	for(var i = 0; i < rows.length; i ++) {

		if(rows[i].is_tempload == false) {

			$('.daily-inventory-report-modal .di-raw-mats .local tr[data-tid="c"][data-vtid="' +  rows[i].vt_id+'"][data-mid="' + rows[i].im_id + '"]').find('td:nth-child(4)').append(rows[i].vans);
			$('.daily-inventory-report-modal .di-raw-mats .imported tr[data-tid="c"][data-vtid="' +  rows[i].vt_id+'"][data-mid="' + rows[i].im_id + '"]').find('td:nth-child(4)').append(rows[i].vans);

		} else {

			$('.daily-inventory-report-modal .di-raw-mats .tempload tr[data-tid="c"][data-vtid="' +  rows[i].vt_id+'"][data-mid="' + rows[i].im_id + '"]').find('td:nth-child(4)').append(rows[i].vans);

		}

	}

}

function set_di_stripping_rawmats_truckers(rows) {

	var total = 0;
	var grouped_im_vans = 0;

	for(var i = 0; i < rows.length; i ++) {

		if(rows[i].is_tempload == false) {

			$('.daily-inventory-report-modal .di-raw-mats tr[data-tid="' + rows[i].t_id + '"][data-vtid="' +  rows[i].vt_id+'"][data-mid="' + rows[i].im_id + '"]').find('td:nth-child(4)').append(rows[i].vans);


		} else {

			

			$('.daily-inventory-report-modal .di-raw-mats .tempload tr[data-tid="' + rows[i].t_id + '"][data-vtid="' +  rows[i].vt_id+'"][data-mid="' + rows[i].im_id + '"]').find('td:nth-child(4)').append(rows[i].vans);

			if(((rows[i].im_id == "32") || (rows[i].im_id == "41") || (rows[i].im_id == "33")) && rows[i].vt_id == "1" && rows[i].t_id == "2") {

				grouped_im_vans = grouped_im_vans + parseInt(rows[i].vans);

			}

		}
	}

	if(grouped_im_vans > 0) {

		$('.daily-inventory-report-modal .di-raw-mats .tempload #grouped-im').find('td:nth-child(4)').append(grouped_im_vans);

	} 


	if(total){
	
		$('.daily-inventory-report-modal .di-raw-mats .tempload .amf-drums-sbmp').find('td:nth-child(4)').append(total);
	
	}
}

function set_di_stripping_rawmats(rows) {



}


function set_di_stripping_rawmats_total() {

	var total = 0; 

	$('.daily-inventory-report .di-raw-mats tr').find('td:nth-child(4)').each(function() {

		var vans = parseInt($(this).text());

		if(vans) {
			
			total += vans;

		}

	});

	$('.daily-inventory-report-modal .di-raw-mats .total').find('th:nth-child(2)').append(total);

}

function set_di_stripping_rawmats(stripping_rawmats_consolidated, stripping_rawmats_truckers) {

	set_di_stripping_rawmats_consolidated(stripping_rawmats_consolidated);
	set_di_stripping_rawmats_truckers(stripping_rawmats_truckers);
	set_di_stripping_rawmats_total();

}

/*
*
* END RAWMATS
*
*/

function set_di_stripping_greencoffee(rows) {

	var total = 0;
	var others_total = 0;
	var others_arr = ['1', '5', '6', '10', '11', '12', '13'];

	for(var i = 0; i < rows.length; i++) {


		if(rows[i].im_category != null) {

			$('.daily-inventory-report-modal .di-green-coffee .' + rows[i].im_category.toLowerCase() + ' tr[data-vtid="' + rows[i].vt_id + '"][data-tid="' + rows[i].t_id +'"]').find('td:nth-child(3)').append(rows[i].vans);
			
			if(others_arr.indexOf(rows[i].t_id) > -1) {

				others_total += parseInt(rows[i].vans);

			}
		}
	}

	if(others_total > 0) {

		$('.daily-inventory-report-modal .di-green-coffee .local tr[data-vtid = "1"][data-tid = "others"]').find('td:nth-child(3)').append(others_total);

	}

	//compute and append total
	$('.daily-inventory-report .di-green-coffee tr').find('td:nth-child(3)').each(function() {
		
		var vans = parseInt($(this).text())
		if(vans) {

			total += vans;
			
		}

	});

	$('.daily-inventory-report-modal .di-green-coffee .total').find('th:nth-child(2)').append(total);

}

/*
*
* EMPTY VANS - FOR RETURN (NON-DEFECTIVE)
*
*/

function set_di_empty_for_return(rows) {

	var total = 0;

	for(var i = 0; i < rows.length; i ++) {
		if(rows[i].im_category != null) {

			$('.daily-inventory-report-modal .di-empty-vans tr').find('.'+ rows[i].im_category.toLowerCase() + '.for-return[data-tid="' + rows[i].t_id + '"]').next('.for-return[data-vtid="' + rows[i].vt_id + '"]').next('.for-return').append(rows[i].vans);
		
		}
	}


	//compute and append total
	$('.daily-inventory-report .di-empty-vans tr').find('.for-return.efr-vans').each(function() {
		
		var vans = parseInt($(this).text())
		if(vans) {

			total += vans;
			
		}

	});

	$('.daily-inventory-report-modal .di-empty-vans .total').find('th:nth-child(2)').append(total);


}

/*
*
* END EMPTY VANS - FOR RETURN (NON-DEFECTIVE)
*
*/

/*
*
* EMPTY VANS - FOR STUFFING
*
*/

function set_di_empty_for_stuffing_shippers(rows) {

	for(var i = 0; i < rows.length; i ++) {

		$('.daily-inventory-report-modal .di-empty-vans tr').find('.for-stuffing[data-sid="' + rows[i].s_id + '"]').next('.for-stuffing[data-vtid="' + rows[i].vt_id + '"]').next('.for-stuffing').append(rows[i].vans);

	}
	
}

function set_di_empty_for_stuffing_truckers(rows) {

	for(var i = 0; i < rows.length; i ++) {

		$('.daily-inventory-report-modal .di-empty-vans tr').find('.for-stuffing[data-tid="' + rows[i].t_id + '"]').next('.for-stuffing[data-vtid="' + rows[i].vt_id + '"]').next('.for-stuffing').append(rows[i].vans);

	}
	
}

function set_di_empty_for_stuffing_total() {

	var total = 0; 

	$('.daily-inventory-report .di-empty-vans tr').find('.for-stuffing.efs-vans').each(function() {

		var vans = parseInt($(this).text());

		if(vans) {
			
			total += vans;

		}

	});

	$('.daily-inventory-report-modal .di-empty-vans .total').find('th:nth-child(4)').append(total);

}

function set_di_empty_for_stuffing(empty_for_stuffing_shippers, empty_for_stuffing_truckers) {

	set_di_empty_for_stuffing_shippers(empty_for_stuffing_shippers);
    set_di_empty_for_stuffing_truckers(empty_for_stuffing_truckers);
    set_di_empty_for_stuffing_total();

}

/*
*
* END EMPTY VANS - FOR STUFFING
*
*/

/*
*
* EMPTY VANS - FOR RETURN (DEFECTIVE)
*
*/

function set_di_empty_defectives_shippers(rows) {

	for(var i = 0; i < rows.length; i ++) {

		$('.daily-inventory-report-modal .di-empty-vans tr').find('.defective[data-sid="' + rows[i].s_id + '"]').next('.defective[data-vtid="' + rows[i].vt_id + '"]').next('.defective').append(rows[i].vans);

	}
	
}

function set_di_empty_defectives_truckers(rows) {

	for(var i = 0; i < rows.length; i ++) {

		$('.daily-inventory-report-modal .di-empty-vans tr').find('.defective[data-tid="' + rows[i].t_id + '"]').next('.defective[data-vtid="' + rows[i].vt_id + '"]').next('.defective').append(rows[i].vans);

	}
	
}

function set_di_empty_defectives_total() {

	var total = 0; 

	$('.daily-inventory-report .di-empty-vans tr').find('.defective.dfs-vans').each(function() {

		var vans = parseInt($(this).text());

		if(vans) {
			
			total += vans;

		}

	});

	$('.daily-inventory-report-modal .di-empty-vans .total').find('th:nth-child(6)').append(total);

}

function set_di_empty_defectives(empty_defectives_shippers, empty_defectives_truckers) {

	set_di_empty_defectives_shippers(empty_defectives_shippers);
    set_di_empty_defectives_truckers(empty_defectives_truckers);
    set_di_empty_defectives_total();

}

/*
*
* END EMPTY VANS - FOR RETURN (NON-DEFECTIVE)
*
*/

/*
*
* FG
*
*/


function set_di_finished_goods_shippers(rows) {

	for(var i = 0; i < rows.length; i ++) {

		if(rows[i].tt_name != null && rows[i].m_type) {

			$('.daily-inventory-report-modal .di-finished-goods tr[data-sid="' + rows[i].s_id + '"][data-vtid="' + rows[i].vt_id + '"]').find('.' + rows[i].tt_name.toLowerCase() + '.' + rows[i].m_type.toLowerCase()).append(rows[i].vans);

		}

	}
	
}

function set_di_finished_goods_truckers(rows) {

	for(var i = 0; i < rows.length; i ++) {

		if(rows[i].tt_name != null && rows[i].m_type) {

			$('.daily-inventory-report-modal .di-finished-goods tr[data-tid="' + rows[i].t_id + '"][data-vtid="' + rows[i].vt_id + '"]').find('.' + rows[i].tt_name.toLowerCase() + '.' + rows[i].m_type.toLowerCase()).append(rows[i].vans);

		}

	}
	
}

function set_di_finished_goods_total() {

	var total_rm = 0; 
	var total_rc = 0;
	var total_em = 0;
	var total_ec = 0;

	$('.daily-inventory-report-modal .di-finished-goods tr').find('td.resupply.milk').each(function() {

		var vans = parseInt($(this).text());

		if(vans) {
			
			total_rm += vans;

		}

	});

	$('.daily-inventory-report-modal .di-finished-goods .total').find('.resupply.milk').append(total_rm);


	$('.daily-inventory-report-modal .di-finished-goods tr').find('td.resupply.coffee').each(function() {

		var vans = parseInt($(this).text());

		if(vans) {

			total_rc += vans;

		}

	});

	$('.daily-inventory-report-modal .di-finished-goods .total').find('.resupply.coffee').append(total_rc);


	$('.daily-inventory-report-modal .di-finished-goods tr').find('td.exfactory.milk').each(function() {

		var vans = parseInt($(this).text());

		if(vans) {

			total_em += vans;

		}

	});

	$('.daily-inventory-report-modal .di-finished-goods .total').find('.exfactory.milk').append(total_em);


	$('.daily-inventory-report-modal .di-finished-goods tr').find('td.exfactory.coffee').each(function() {

		var vans = parseInt($(this).text());

		if(vans) {

			total_ec += vans;

		}

	});

	$('.daily-inventory-report-modal .di-finished-goods .total').find('.exfactory.coffee').append(total_ec);


}

function set_di_finished_goods(finished_goods_shippers, finished_goods_truckers) {

    set_di_finished_goods_shippers(finished_goods_shippers);
    set_di_finished_goods_truckers(finished_goods_truckers);
    set_di_finished_goods_total();

}

/*
*
* END FG
*
*/

/*
*
* SEMI FG
*
*/

function set_di_semi_finished_goods_shippers(rows) {

	for(var i = 0; i < rows.length; i ++) {

		if(rows[i].m_type != null) {

			$('.daily-inventory-report-modal .di-semi-finished-goods tr[data-sid="' + rows[i].s_id + '"][data-vtid="' + rows[i].vt_id + '"]').find('.' + rows[i].m_type.toLowerCase()).append(rows[i].vans);

		}

	}
	
}

function set_di_semi_finished_goods_truckers(rows) {

	for(var i = 0; i < rows.length; i ++) {

		if(rows[i].m_type != null) {

			$('.daily-inventory-report-modal .di-semi-finished-goods tr[data-tid="' + rows[i].t_id + '"][data-vtid="' + rows[i].vt_id + '"]').find('.' + rows[i].m_type.toLowerCase()).append(rows[i].vans);

		}

	}
	
}

function set_di_semi_finished_goods_total() {

	var total_m = 0; 
	var total_c = 0;

	$('.daily-inventory-report-modal .di-semi-finished-goods tr').find('td.milk').each(function() {

		var vans = parseInt($(this).text());

		if(vans) {
			
			total_m += vans;

		}

	});

	$('.daily-inventory-report-modal .di-semi-finished-goods .total').find('.milk').append(total_m);


	$('.daily-inventory-report-modal .di-semi-finished-goods tr').find('td.coffee').each(function() {

		var vans = parseInt($(this).text());

		if(vans) {

			total_c += vans;

		}

	});

	$('.daily-inventory-report-modal .di-semi-finished-goods .total').find('.coffee').append(total_c);

}

function set_di_semi_finished_goods(semi_finished_goods_shippers, semi_finished_goods_truckers) {

    set_di_semi_finished_goods_shippers(semi_finished_goods_shippers);
    set_di_semi_finished_goods_truckers(semi_finished_goods_truckers);
    set_di_semi_finished_goods_total();

}

/*
*
* END SEMI FG
*
*/

/*
*
* REWORK POWDER
*
*/

function set_di_rework_powder_shippers(rows) {

	for(var i = 0; i < rows.length; i ++) {

		if(rows[i].m_type != null) {

			$('.daily-inventory-report-modal .di-rework-powder tr[data-sid="' + rows[i].s_id + '"][data-vtid="' + rows[i].vt_id + '"]').find('.' + rows[i].m_type.toLowerCase()).append(rows[i].vans);

		}

	}
	
}

function set_di_rework_powder_truckers(rows) {

	for(var i = 0; i < rows.length; i ++) {

		if(rows[i].m_type != null) {

			$('.daily-inventory-report-modal .di-rework-powder tr[data-tid="' + rows[i].t_id + '"][data-vtid="' + rows[i].vt_id + '"]').find('.' + rows[i].m_type.toLowerCase()).append(rows[i].vans);

		}
	}
	
}

function set_di_rework_powder_total() {

	var total_m = 0; 
	var total_c = 0;

	$('.daily-inventory-report-modal .di-rework-powder tr').find('td.milk').each(function() {

		var vans = parseInt($(this).text());

		if(vans) {
			
			total_m += vans;

		}

	});

	$('.daily-inventory-report-modal .di-rework-powder .total').find('.milk').append(total_m);


	$('.daily-inventory-report-modal .di-rework-powder tr').find('td.coffee').each(function() {

		var vans = parseInt($(this).text());

		if(vans) {

			total_c += vans;

		}

	});

	$('.daily-inventory-report-modal .di-rework-powder .total').find('.coffee').append(total_c);

}

function set_di_rework_powder(rework_powder_shippers, rework_powder_truckers) {

    set_di_rework_powder_shippers(rework_powder_shippers);
    set_di_rework_powder_truckers(rework_powder_truckers);
    set_di_rework_powder_total();

}

/*
*
* END REWORK POWDER
*
*/

/*
*
* HOLD PRODUCTS
*
*/

function set_di_hold_products_shippers(rows) {

	for(var i = 0; i < rows.length; i ++) {

		if(rows[i].m_type != null && rows[i].m_category != null) {
		
			$('.daily-inventory-report-modal .di-hold-products tr[data-sid="' + rows[i].s_id + '"][data-vtid="' + rows[i].vt_id + '"]').find('.' + rows[i].m_type.toLowerCase() + '.' + rows[i].m_category.toLowerCase()).append(rows[i].vans);
		
		}

	}
	
}

function set_di_hold_products_truckers(rows) {

	for(var i = 0; i < rows.length; i ++) {

		if(rows[i].m_type != null && rows[i].m_category != null) {

			$('.daily-inventory-report-modal .di-hold-products tr[data-tid="' + rows[i].t_id + '"][data-vtid="' + rows[i].vt_id + '"]').find('.' + rows[i].m_type.toLowerCase() + '.' + rows[i].m_category.toLowerCase()).append(rows[i].vans);

		}

	}
	
}

function set_di_hold_products_total() {

	var total_mf = 0; 
	var total_cf = 0;
	var total_ms = 0;
	var total_cs = 0;

	$('.daily-inventory-report-modal .di-hold-productstr').find('td.milk.fg').each(function() {

		var vans = parseInt($(this).text());

		if(vans) {
			
			total_mf += vans;

		}

	});

	$('.daily-inventory-report-modal .di-hold-products .total').find('.milk.fg').append(total_mf);


	$('.daily-inventory-report-modal .di-hold-products tr').find('td.coffee.fg').each(function() {

		var vans = parseInt($(this).text());

		if(vans) {

			total_cf += vans;

		}

	});

	$('.daily-inventory-report-modal .di-hold-products .total').find('.coffee.fg').append(total_cf);


	$('.daily-inventory-report-modal .di-hold-products tr').find('td.milk.sfg').each(function() {

		var vans = parseInt($(this).text());

		if(vans) {

			total_ms += vans;

		}

	});

	$('.daily-inventory-report-modal .di-hold-products .total').find('.milk.sfg').append(total_ms);


	$('.daily-inventory-report-modal .di-hold-products tr').find('td.coffee.sfg').each(function() {

		var vans = parseInt($(this).text());

		if(vans) {

			total_cs += vans;

		}

	});

	$('.daily-inventory-report-modal .di-hold-products .total').find('.coffee.sfg').append(total_cs);


}

function set_di_hold_products(hold_products_shippers, hold_products_truckers) {

    set_di_hold_products_shippers(hold_products_shippers);
    set_di_hold_products_truckers(hold_products_truckers);
    set_di_hold_products_total();

}

/*
*
* END HOLD PRODUCTS
*
*/

/*
*
* FOR PROCESSING AND LATE OVER
*
*/

function set_di_for_processing_late_over_shippers(rows) {

	for(var i = 0; i < rows.length; i ++) {

		if(parseInt(rows[i].for_processing) > 0){

			$('.daily-inventory-report-modal .di-for-processing-late-over tr[data-sid="' + rows[i].s_id + '"][data-vtid="' + rows[i].vt_id + '"]').find('.for-processing').append(rows[i].for_processing);
		
		}

		if(parseInt(rows[i].late_over) > 0){

			$('.daily-inventory-report-modal .di-for-processing-late-over tr[data-sid="' + rows[i].s_id + '"][data-vtid="' + rows[i].vt_id + '"]').find('.late-over').append(rows[i].late_over);
		
		}

	}
	
}

function set_di_for_processing_late_over_truckers(rows) {

	for(var i = 0; i < rows.length; i ++) {

		if(parseInt(rows[i].for_processing) > 0){

			$('.daily-inventory-report-modal .di-for-processing-late-over tr[data-tid="' + rows[i].t_id + '"][data-vtid="' + rows[i].vt_id + '"]').find('.for-processing').append(rows[i].for_processing);
		
		}

		if(parseInt(rows[i].late_over) > 0){

			$('.daily-inventory-report-modal .di-for-processing-late-over tr[data-tid="' + rows[i].t_id + '"][data-vtid="' + rows[i].vt_id + '"]').find('.late-over').append(rows[i].late_over);

		}
	
	}
}

function set_di_for_processing_late_over_total() {

	var total_fp = 0; 
	var total_lo = 0;

	$('.daily-inventory-report-modal .di-for-processing-late-over').find('td.for-processing').each(function() {

		var vans = parseInt($(this).text());

		if(vans) {
			
			total_fp += vans;

		}

	});

	$('.daily-inventory-report-modal .di-for-processing-late-over .total').find('.for-processing').append(total_fp);


	$('.daily-inventory-report-modal .di-for-processing-late-over tr').find('td.late-over').each(function() {

		var vans = parseInt($(this).text());

		if(vans) {

			total_lo += vans;

		}

	});

	$('.daily-inventory-report-modal .di-for-processing-late-over .total').find('.late-over').append(total_lo);

}

function set_di_for_processing_late_over(for_processing_late_over_shippers, for_processing_late_over_truckers) {

    set_di_for_processing_late_over_shippers(for_processing_late_over_shippers);
    set_di_for_processing_late_over_truckers(for_processing_late_over_truckers);
    set_di_for_processing_late_over_total();

}

/*
*
* END FOR PROCESSING AND LATE OVER
*
*/

/*
*
* START GRAND TOTAL
*
*/

function set_grand_total(total_teu, rows) {

	if(total_teu[0].TEU > 0) {
		$('.grand-total .total-teu').append(total_teu[0].TEU);
	} else {
		$('.grand-total .total-teu').append('0');
	}

	for(var i = 0; i < rows.length; i ++) {

		if(rows[i].vt_name == '10') {

			$('.grand-total .total-10').append(rows[i].vans);

		} 

		if(rows[i].vt_name == '20') {

			$('.grand-total .total-20').append(rows[i].vans);

		} 

		if(rows[i].vt_name == '40') {

			$('.grand-total .total-40').append(rows[i].vans);

		} 

	}

	if($('.grand-total .total-10').text() == '') {

		$('.grand-total .total-10').append('0');

	}

	if($('.grand-total .total-20').text() == '') {

		$('.grand-total .total-20').append('0');

	}

	if($('.grand-total .total-40').text() == '') {

		$('.grand-total .total-40').append('0');

	}

}

/*
*
* END START GRAND TOTAL
*
*/

function clear_fsc_outbound_report() {

	$('.fsc-outbound-report-modal .fsc-dispatch-standings>tbody').find('tr td:nth-child(3)').empty();
	$('.fsc-outbound-report-modal .fsc-pending>tbody').find('tr td:nth-child(3)').empty();
	$('.fsc-outbound-report-modal .fsc-pending>tbody').find('tr td:nth-child(4)').empty();
	$('.fsc-outbound-report-modal .fsc-empty-vans>tbody').find('tr td:nth-child(3)').empty();

	$('.fsc-outbound-report .fsc-dispatch-standings>tbody .total').find('th:nth-child(2)').empty();
	$('.fsc-outbound-report .fsc-pending>tbody .total').find('th:nth-child(2)').empty();
	$('.fsc-outbound-report .fsc-pending>tbody .total').find('th:nth-child(3)').empty();
	$('.fsc-outbound-report .fsc-empty-vans>tbody .total').find('th:nth-child(2)').empty();	

}

function empty_defective_vans_report() {

	$('.defective-vans').find('tbody').empty();

}

function clear_empty_vans_report() {

	$('.empty-vans-report-modal .empty-vans>tbody').find('tr td:nth-child(3)').empty();

	$('.empty-vans-report-modal .empty-vans>tbody').find('.total th:nth-child(2)').empty();

}

function clear_empty_vans_stripping_report() {

	$('.empty-vans-stripping-report-modal .reports-table>tbody').find('tr.vans').remove();

	$('.empty-vans-stripping-report-modal .reports-table>tbody').find('.total th:nth-child(2)').empty();

}

function clear_empty_vans_stuffing_report() {

	$('.empty-vans-stuffing-report-modal .reports-table>tbody').find('tr.vans').remove();

	$('.empty-vans-stuffing-report-modal .reports-table>tbody').find('.total th:nth-child(2)').empty();

}

function clear_daily_inventory_report() {

	//Stripping Reports
	$('.daily-inventory-report .di-pack-mats tr').find('td:nth-child(4)').empty();
	$('.daily-inventory-report .di-raw-mats tr').find('td:nth-child(4)').empty();
	$('.daily-inventory-report .di-green-coffee tr').find('td:nth-child(3)').empty();

	$('.daily-inventory-report .di-empty-vans tr').find('td:nth-child(3)').empty();
	$('.daily-inventory-report .di-empty-vans tr').find('td:nth-child(6)').empty();
	$('.daily-inventory-report .di-empty-vans tr').find('td:nth-child(9)').empty();

	//Stuffing Reports
	$('.daily-inventory-report .di-finished-goods tr').find('td:nth-child(3), td:nth-child(4), td:nth-child(5), td:nth-child(6)').empty();
	$('.daily-inventory-report .di-semi-finished-goods tr').find('td:nth-child(3), td:nth-child(4)').empty();

	$('.daily-inventory-report .di-hold-products tr').find('td:nth-child(3), td:nth-child(4), td:nth-child(5), td:nth-child(6)').empty();
	$('.daily-inventory-report .di-for-processing-late-over tr').find('td:nth-child(3), td:nth-child(4)').empty();

	$('.daily-inventory-report .total').find('th:nth-child(2), th:nth-child(3), th:nth-child(4), th:nth-child(5), th:nth-child(6)').empty();

	$('.grand-total span').empty();

}


/* 
* 
* AJAX Functions 
*
*/


function fsc_dispatch_standings_shippers() {
	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/fsc_dispatch_standings_shippers',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;	
}

function fsc_dispatch_standings_truckers() {
	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/fsc_dispatch_standings_truckers',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;	
}

function fsc_pending_shippers() {
	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/fsc_pending_shippers',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;	
}

function fsc_pending_truckers() {
	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/fsc_pending_truckers',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;	
}

function fsc_empty_vans_for_stuffing_shippers() {
	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/fsc_empty_vans_for_stuffing_shippers',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;	
}

function fsc_empty_vans_for_stuffing_truckers() {
	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/fsc_empty_vans_for_stuffing_truckers',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;	
}

function defective_vans_report() {
	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/defective_vans_report',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;
}

function empty_vans_report_shippers() {
	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/empty_vans_report_shippers',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;
}

function empty_vans_report_truckers() {
	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/empty_vans_report_truckers',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;
}

function empty_vans_stripping_shippers() {
	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/empty_vans_stripping_shippers',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;
}

function empty_vans_stripping_truckers() {
	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/empty_vans_stripping_truckers',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;
}

function empty_vans_stuffing_shippers() {
	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/empty_vans_stuffing_shippers',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;
}

function empty_vans_stuffing_truckers() {
	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/empty_vans_stuffing_truckers',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;
}

function di_stripping_packmats_truckers() {

	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/di_stripping_packmats_truckers',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;

}

function di_stripping_packmats_consolidated() {

	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/di_stripping_packmats_consolidated',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;

}

function di_stripping_rawmats_consolidated() {

	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/di_stripping_rawmats_consolidated',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;

}

console.log(di_stripping_rawmats_consolidated())

function di_stripping_rawmats_truckers() {

	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/di_stripping_rawmats_truckers',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;

}

console.log(di_stripping_rawmats_truckers());

/*
function di_stripping_rawmats_tempload() {

	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/di_stripping_tempload',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;

}
*/

function di_stripping_greencoffee() {

	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/di_stripping_greencoffee',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;

}

function di_empty_for_return() {

	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/di_empty_for_return',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;

}

function di_defective_vans_shippers() {

	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/di_defective_vans_shippers',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;

}

function di_defective_vans_truckers() {

	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/di_defective_vans_truckers',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;

}

function di_finished_goods_shippers() {

	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/di_finished_goods_shippers',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;

}

function di_finished_goods_truckers() {

	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/di_finished_goods_truckers',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;

}

function di_semi_finished_goods_shippers() {

	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/di_semi_finished_goods_shippers',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;

}

function di_semi_finished_goods_truckers() {

	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/di_semi_finished_goods_truckers',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;

}

function di_rework_powder_shippers() {

	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/di_rework_powder_shippers',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;

}

function di_rework_powder_truckers() {

	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/di_rework_powder_truckers',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;

}

function di_hold_products_shippers() {

	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/di_hold_products_shippers',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;

}

function di_hold_products_truckers() {

	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/di_hold_products_truckers',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;

}

function di_for_processing_late_over_shippers() {

	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/di_for_processing_late_over_shippers',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;

}

function di_for_processing_late_over_truckers() {

	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/di_for_processing_late_over_truckers',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;
    
}

function di_for_processing_late_over_truckers() {

	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/di_for_processing_late_over_truckers',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;
    
}

function get_total_teu() {

	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'container_yard/get_total_teu',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;

}

function get_total_by_van_type() {

	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'container_yard/get_total_by_van_type',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;

}