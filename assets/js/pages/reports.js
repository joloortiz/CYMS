//when the user chooses the fsc-outbound-report
$('#fsc-outbound-report').click(function() {

	show_loader();

	empty_fsc_outbound_report();

	var data = fsc_outbound_report();
	var dsf = data.dispatch_standings_fulls;
	var dse = data.dispatch_standings_exfac;
	var pfs = data.pending_fulls_sealed;
	var pfu = data.pending_fulls_unsealed;
	var pes = data.pending_exfac_sealed;
	var peu = data.pending_exfac_unsealed;
	var evrb =data.empty_vans_running_balance


	if(dsf){

		for(var i = 0; i < dsf.length; i++) {

			$('.fsc-outbound-report .dispatch>.fulls').find('.' + dsf[i].s_name + dsf[i].vt_name + ' td:nth-child(3)').append(dsf[i].TEU);

		}

	}

	if(dse){

		for(var i = 0; i < dse.length; i++) {

			$('.fsc-outbound-report .dispatch>.exfac').find('.' + dse[i].s_name + dse[i].vt_name + ' td:nth-child(3)').append(dse[i].TEU);

		}

	}

	if(pfs) {

		for(var i = 0; i < pfs.length; i++) {

			$('.fsc-outbound-report .pending>.fulls').find('.' + pfs[i].s_name + pfs[i].vt_name + ' td:nth-child(3)').append(pfs[i].TEU);

		}

	}

	if(pfu) {

		for(var i = 0; i < pfu.length; i++) {

			$('.fsc-outbound-report .pending>.fulls').find('.' + pfu[i].s_name + pfu[i].vt_name + ' td:nth-child(4)').append(pfu[i].TEU);

		}

	}

	if(pes) {

		for(var i = 0; i < pes.length; i++) {

			$('.fsc-outbound-report .pending>.exfac').find('.' + pes[i].s_name + pes[i].vt_name + ' td:nth-child(3)').append(pes[i].TEU);

		}

	}

	if(peu) {

		for(var i = 0; i < peu.length; i++) {

			$('.fsc-outbound-report .pending>.exfac').find('.' + peu[i].s_name + peu[i].vt_name + ' td:nth-child(4)').append(peu[i].TEU);

		}

	}

	if(evrb) {

		for(var i = 0; i < evrb.length; i++) {

			$('.fsc-outbound-report .empty-vans>tbody').find('.' + evrb[i].s_name + evrb[i].vt_name + ' td:nth-child(3)').append(evrb[i].vans);

		}

	}




		$('.timestamp').append('Generated at ' + now().time + ' on ' + now().date);

		remove_loader();

		$('.fsc-outbound-report-modal').modal({
			show: true
		})

});

//when the modal is closed
$('.fsc-outbound-report-modal').on('hidden.bs.modal', function () {
    $('.timestamp').empty();
})


//user prints the preview
$('#report-print').click(function() {
	//get all the elements of the print-section
	var content = document.getElementById("print-section");
	var pri = document.getElementById("reports-placeholder").contentWindow;

	//get values of the issues textarea
	var issues = $('.issues-text').val();
	pri.document.open();
	pri.document.write(content.innerHTML);

	//if issue text area is empty hide the issues div/row
	if(issues == ''){

		$('#reports-placeholder').contents().find('.issues').addClass('hide');

	}else{

		//add values to issues box and remove the class hide
		$('#reports-placeholder').contents().find('.issues-display p').append(issues).removeClass('hide');
		$('#reports-placeholder').contents().find('.issues-text').addClass('hide');
		$('#reports-placeholder').contents().find('.issues-display').removeClass('hide');

	}

	//append the required css for the report
	$('#reports-placeholder').contents().find("head")
    .append($('<link type="text/css" rel="stylesheet" href="/cyms/assets/css/bootstrap.min.css"><link type="text/css" rel="stylesheet" href="/cyms/assets/css/reports-print.css">'));
	
	pri.document.close();
	pri.focus();
	pri.print();
});	

/* Front End Functions */

function empty_fsc_outbound_report() {
	$('.dispatch>tbody').find('tr td:nth-child(3)').empty();
	$('.pending>tbody').find('tr td:nth-child(3)').empty();
	$('.pending>tbody').find('tr td:nth-child(4)').empty();
	$('.empty-vans>tbody').find('tr td:nth-child(3)').empty();
}


/* AJAX Functions */

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

console.log(fsc_outbound_report());