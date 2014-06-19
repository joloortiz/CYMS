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

	var data = fsc_outbound_report();
	var dsf = data.dispatch_standings_fulls;
	var dse = data.dispatch_standings_exfac;
	var pfs = data.pending_fulls_sealed;
	var pfu = data.pending_fulls_unsealed;
	var pes = data.pending_exfac_sealed;
	var peu = data.pending_exfac_unsealed;
	var evrb =data.empty_vans_running_balance


	if(dsf.length > 0){

		for(var i = 0; i < dsf.length; i++) {

			$('.fsc-outbound-report .dispatch>.fulls').find('.' + dsf[i].s_name + dsf[i].vt_name + ' td:nth-child(3)').append(dsf[i].TEU);

		}

	}

	if(dse.length > 0){

		for(var i = 0; i < dse.length; i++) {

			$('.fsc-outbound-report .dispatch>.exfac').find('.' + dse[i].s_name + dse[i].vt_name + ' td:nth-child(3)').append(dse[i].TEU);

		}

	}

	if(pfs.length > 0) {

		for(var i = 0; i < pfs.length; i++) {

			$('.fsc-outbound-report .pending>.fulls').find('.' + pfs[i].s_name + pfs[i].vt_name + ' td:nth-child(3)').append(pfs[i].TEU);

		}

	}

	if(pfu.length > 0) {

		for(var i = 0; i < pfu.length; i++) {

			$('.fsc-outbound-report .pending>.fulls').find('.' + pfu[i].s_name + pfu[i].vt_name + ' td:nth-child(4)').append(pfu[i].TEU);

		}

	}

	if(pes.length > 0) {

		for(var i = 0; i < pes.length; i++) {

			$('.fsc-outbound-report .pending>.exfac').find('.' + pes[i].s_name + pes[i].vt_name + ' td:nth-child(3)').append(pes[i].TEU);

		}

	}

	if(peu.length > 0) {

		for(var i = 0; i < peu.length; i++) {

			$('.fsc-outbound-report .pending>.exfac').find('.' + peu[i].s_name + peu[i].vt_name + ' td:nth-child(4)').append(peu[i].TEU);

		}

	}

	if(evrb.length > 0) {

		for(var i = 0; i < evrb.length; i++) {

			$('.fsc-outbound-report .empty-vans>tbody').find('.' + evrb[i].s_name + evrb[i].vt_name + ' td:nth-child(3)').append(evrb[i].vans);

		}

	}




		$('.fsc-outbound-report .timestamp').append('Generated at ' + now().time + ' on ' + now().date);

		remove_loader();

		$('.fsc-outbound-report-modal').modal({
			show: true
		})

});

//when the modal is closed
$('.fsc-outbound-report-modal').on('hidden.bs.modal', function () {
	
	//empty all the data on the tables
    empty_fsc_outbound_report();

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
    console.log(data);

    if(data.length > 0) {

    	for(var i = 0; i < data.length; i++) {

    		$('.defective-vans').find('tbody').append('<tr><td>' + data[i].v_no + '</td><td>' + data[i].tc_entrydate + '</td><td>' + data[i].s_name + '</td><td>' + data[i].vt_name + '</td><td>' + data[i].tc_block_reason + '</td></tr>');

    	}

    } else {

    	console.log('hi');
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

    var data = empty_vans_report();
    console.log(data);

    if(data.length > 0) {

    	for(var i = 0; i < data.length; i++) {

    		$('.empty-vans').find('.' + data[i].s_name + data[i].vt_name + ' td:nth-child(3)').append(data[i].vans);

    	}

    }

    remove_loader();

    $('.empty-vans-report .timestamp').append('Generated at ' + now().time + ' on ' + now().date);
	
	$('.empty-vans-report-modal').modal({
			show: true
	})

});

//when the modal is closed
$('.empty-vans-report-modal').on('hidden.bs.modal', function () {
	
	//empty all the data on the tables
    empty_empty_vans_report();

});

//user prints the preview
$('.empty-vans-report-modal #report-print').click(function() {
	
	print_element('print-section-empty-vans', 'reports-print.css');

});	


/* 
*
* Front End Functions 
*
*/


function empty_fsc_outbound_report() {

	$('.fsc-outbound-report-modal .dispatch>tbody').find('tr td:nth-child(3)').empty();
	$('.fsc-outbound-report-modal .pending>tbody').find('tr td:nth-child(3)').empty();
	$('.fsc-outbound-report-modal .pending>tbody').find('tr td:nth-child(4)').empty();
	$('.fsc-outbound-report-modal .empty-vans>tbody').find('tr td:nth-child(3)').empty();

}

function empty_defective_vans_report() {

	$('.defective-vans').find('tbody').empty();

}

function empty_empty_vans_report() {

	$('.empty-vans-report-modal .empty-vans>tbody').find('tr td:nth-child(3)').empty();

}

/* 
* 
* AJAX Functions 
*
*/


function fsc_outbound_report() {
	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/fsc_outbound_report',
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

function empty_vans_report() {
	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'reports/empty_vans_report',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;
}