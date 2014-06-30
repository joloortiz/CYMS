/*
*
* Event Listeners
*
*/

$('#back-select-fields-btn').click(function() {

	$('#selectFieldsModal').modal('hide');
	$('#searchFilterModal').modal('show')	

});

$('#confirm-select-fields-btn').click(function() {

	tcid = get_advanced_search_results();
	rows = print_filter(tcid);
	columns = get_checked_fields();

	//console.log(tcid);
	console.log(rows);
	//console.log(columns);

	$('#selectFieldsModal').modal('hide');
	show_loader();

	append_to_print_preview_header(columns);
	set_rows(tcid, columns);
	sf_preview(rows);
	set_signature_name(rows);

	remove_loader();

	$('.sf-preview-report-modal').modal('show');

});

$('#sf-preview-back').click(function() {

	$('.sf-preview-report-modal').modal('hide');
	$('#selectFieldsModal').modal('show');
	
});


$('#sf-preview-print').click(function() {

	print_element('print-section-sf-preview-report', 'reports-print.css');

});

$('.sf-preview-report-modal').on('hidden.bs.modal', function () {

	empty_sf_preview();

});

/*
*
* Front End Functions
*
*/

function get_advanced_search_results() {

	//get all van nos from the advanced search results
	var vans = [];
	$('#present-van-list').find('.filtered-van').each(function(){ vans.push($(this).attr('data-card-id')) });
	$('#previous-van-list').find('.old-van').each(function(){ vans.push($(this).attr('data-card-id')) });

	return vans;

}

function get_checked_fields() {

	//get all checked fields for the print report
	var checks = [];
	$('.select-fields label').find('input:checked').each(function() { checks.push($(this).attr('field')) });

	return checks;

}

function append_to_print_preview_header(columns) {

	$('.sf-preview').append('<tr class="sf-preview-header"></tr>');

	$.each(columns, function(index, value) {
		$('.sf-preview-report-modal .sf-preview-header').append('<th>' + value + '</th>')
	});

}

function set_rows(id, columns) {

	$.each(id, function(index, value) {
		$('.sf-preview-report-modal .sf-preview').append('<tr data-tcid="' + value + '"></tr>')
	});

	$('.sf-preview').find('tr[data-tcid]').each(function() { 

		for( var i = 0; i < (columns.length); i++ ){
			$(this).append('<td data-column="' + columns[i] + '"></td>')
		}

	});

}

function set_signature_name(rows) {

	var name_index = rows.length - 1;


	$('.sf-preview-report-modal .signature-name').append(rows[name_index]);

}

function empty_sf_preview() {

	$('.sf-preview-report-modal .sf-preview tbody').empty();
	$('.sf-preview-report-modal .signature-name').empty();

}

function sf_preview(rows) {

	var rows_size = rows.length - 1;

	for(var i = 0; i < rows_size; i++) {

		console.log(rows[i]);
			$.each(rows[i], function(key, value) {
 
				$('tr[data-tcid="' + rows[i].tcid + '"]').find('td[data-column="' + key + '"]').append(value);

			});

	}

}

/*
*
* AJAX Functions
*
*/

function print_filter(id) {

	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'container_yard/print_filter',
        type: 'POST',
        async: false,
        data: {
        	id: id
        },
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;

}