/*
 * EVENTS
 */

$('#save-checker').click(function(event) {
	event.preventDefault();


	if( validate() ) {
		save();
	}
	
});

$('#new-checker-btn').click(function() {
	reset_control();
	enable_control();

	$('.checker').addClass('action');
	$('[name="first-name"]').focus();
});

$('#cancel-checker').click(function() {
	$('.checker').addClass('action');
	disable_control();
	reset_errors();
});

$('#checker-table').on('click', '.checker.action > .clickable', function() {
	reset_errors();

	var row = $(this).closest('.checker.action');
	var id = row.find('[name="checker-id"]').val();

	$('.checker').not('.action').addClass('action');
	row.removeClass('action');

	$.ajax({
		url: $('body').attr('base-url') + 'checkers/get_checker_details',
		type: 'POST',
		async: false,
		data: {
			id: id
		},
		success: function (response) {
			var decode = jQuery.parseJSON(response);
			var checker_details;

			if( decode.success && decode.details) {
				reset_control();
				enable_control();

				checker_details = decode.details;

				$('[name="active-checker-id"]').val(checker_details.c_id);
				$('[name="first-name"]').val(checker_details.c_firstname);
				$('[name="last-name"]').val(checker_details.c_lastname);
				$('[name="mi"]').val(checker_details.c_mi);

				$('[name="first-name"]').focus();
			}
		}
	});
});

$('.check-selection').change(function() {

	var checkboxes = $('.check-selection:checked');

	if( checkboxes.length > 0 ) {
		$('#delete-checker-btn').removeClass('absolute-hide');
	}else {
		$('#delete-checker-btn').addClass('absolute-hide');
	}
});

$('.single-select').change(function() {

	var parent_checkbox = $('.single-select:checked').length == $('.single-select').length ? true : false;

	$('#select-all-check').prop('checked', parent_checkbox);

	if( $('.single-select:checked').length == 0 || $('.single-select:checked').length == $('.single-select').length ) {
		$('#select-all-check').trigger('change');
	}

});

$('#select-all-check').change(function() {
	var checked = $(this).prop('checked');
	
	$('.single-select').prop('checked', checked);

	if( checked ) {
		$('#delete-checker-btn').removeClass('absolute-hide');
	}else {
		$('#delete-checker-btn').addClass('absolute-hide');
	}
});

$('#delete-checker-btn').click(function() {
	var id_holders = $('.single-select:checked').closest('.checker').find('[name="checker-id"]');
	var ids = new Array();

	if( id_holders.length > 0 ) {
		if( confirm("Are you sure you want to delete the selected checkers?") ) {
			id_holders.each(function() {
				ids.push( $(this).val() );
			});

			$.ajax({
				url: $('body').attr('base-url') + 'checkers/delete',
				type: 'POST',
				async: false,
				data: {
					checker_ids: ids
				},
				success: function (response) {
					var result = jQuery.parseJSON(response);

					if( result.done ) {
						window.location.reload(true);
					}
				}
			});
		}		
	}

});


/* 
 * FUNCTIONS
 */

function reset_control() {
	$('.input-with-value').each(function() {
		$(this).val('');
	});
}

function enable_control() {
	$('#control-form-container').removeClass('faded');
	$('#control-form-container').removeClass('disabled');

	$('.interactive-element').each(function() {
		$(this).prop('disabled', false);
	});
}

function disable_control() {
	reset_control();

	$('#control-form-container').addClass('faded');
	$('#control-form-container').addClass('disabled');

	$('.interactive-element').each(function() {
		$(this).prop('disabled', true);
	});
}

function validate() {

	var data;
    var validated = false;

    reset_errors();

    data = get_form_values();

    // validate
    $.ajax({
        url:$('body').attr('base-url') + 'checkers/validate_form',
        type: 'POST',
        async: false,
        data: data,
        success: function (response) {
            var decode = jQuery.parseJSON(response);
            var errors;
            
            if (decode.success == true) {
                validated = true;
            } else {

                // show errors individually
                if( decode.form_errors ) {
                    errors = decode.form_errors;

                    $.each(errors, function(key, error) {
                    	display_form_error(error);
                    });
                }

                if(decode.exception) {  // show exception
                    alert('Exception caught:\n\n' + decode.exception);
                }
            }
        }
    });

    return validated;
}

function get_form_values() {
	var id = $('[name="active-checker-id"]').val();
	var firstname = $('[name="first-name"]').val();
	var lastname = $('[name="last-name"]').val();
	var mi = $('[name="mi"]').val();

	var method = id == '' ? 'create' : 'update';

	var data = {
		checker_id: id,
		mi: mi,
		action: method
	};

	// object names with hyphens
	data['first-name'] = firstname;
	data['last-name'] = lastname;

	return data;
}

function display_form_error( errorString ) {

    if( errorString && errorString != '' ) {
        var error_indicator = $('ul.help-inline');
        var html_string = "<li>&bull;&emsp;"+ errorString +"</li>";

        error_indicator.append(html_string);
    }
}

function reset_errors() {
	$('ul.help-inline').empty();
}

function save() {
	var data = get_form_values();

	$.ajax({
		url: $('body').attr('base-url') + 'checkers/save',
		type: 'POST',
		async: false,
		data: data,
		success: function (response) {
			var result = jQuery.parseJSON(response);

			if( result.done ) {
				window.location.reload(true);
			}
		}
	});
}