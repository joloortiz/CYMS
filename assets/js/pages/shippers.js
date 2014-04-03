/*
 * EVENTS
 */


$('#save-shipper').click(function(event) {
	event.preventDefault();

	var data = get_form_values();

	if( !$('#control-form-container').is('.faded.disabled') && validate_form() ) {
		$.ajax({
			url: $('body').attr('base-url') + 'shippers/save',
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
});

$('#new-shipper-btn').click(function() {
	reset_control();
	enable_control();
	reset_errors();

	$('.shipper').addClass('action');
	$('[name="shipper-name"]').focus();
});

$('#cancel-shipper').click(function() {
	disable_control();
	reset_errors();

	$('.shipper').addClass('action');
});

$('#shipper-table').on('click', '.shipper.action > .clickable', function() {
	reset_errors();

	var row = $(this).closest('.shipper.action');
	var id = row.find('[name="shipper-id"]').val();

	$('.shipper').not('.action').addClass('action');
	row.removeClass('action');

	$.ajax({
		url: $('body').attr('base-url') + 'shippers/get_shipper_details',
		type: 'POST',
		async: false,
		data: {
			id: id
		},
		success: function (response) {
			var decode = jQuery.parseJSON(response);
			var shipper_details;

			if( decode.success && decode.details) {
				reset_control();
				enable_control();

				shipper_details = decode.details;

				$('[name="active-shipper-id"]').val(shipper_details.s_id);
				$('[name="shipper-name"]').val(shipper_details.s_name);
				$('[name="shipper-color"]').val(shipper_details.s_color);
				$('[name="shipper-color"]').val(shipper_details.s_color);
			}
		}
	});
});

$('.check-selection').change(function() {

	var checkboxes = $('.check-selection:checked');

	if( checkboxes.length > 0 ) {
		$('#delete-shipper-btn').removeClass('absolute-hide');
	}else {
		$('#delete-shipper-btn').addClass('absolute-hide');
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
		$('#delete-shipper-btn').removeClass('absolute-hide');
	}else {
		$('#delete-shipper-btn').addClass('absolute-hide');
	}
});

$('#delete-shipper-btn').click(function() {
	var id_holders = $('.single-select:checked').closest('.shipper').find('[name="shipper-id"]');
	var ids = new Array();

	if( id_holders.length > 0 ) {
		if( confirm("Are you sure you want to delete the selected shippers?") ) {
			id_holders.each(function() {
				ids.push( $(this).val() );
			});

			$.ajax({
				url: $('body').attr('base-url') + 'shippers/delete',
				type: 'POST',
				async: false,
				data: {
					shipper_ids: ids
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

	$('[name="shipper-color"]').val('#FFFFFF');
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

function validate_form() {

    var data;
    var validated = false;

    reset_errors();

    data = get_form_values();

    // validate
    $.ajax({
        url:$('body').attr('base-url') + 'shippers/validate_form',
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

                    display_form_error( 'shipper-name', errors['name'] );
                    display_form_error( 'shipper-color', errors['color'] );
                }

                if(decode.exception) {  // show exception
                    alert('Exception caught:\n\n' + decode.exception);
                }
            }
        }
    });

    return validated;
}

function reset_errors() {
	$('.error-holder').addClass('absolute-hide');
	$('.error-text').text('');

	$('.form-group.has-error').removeClass('has-error');
}

function get_form_values() {
	var id = $('[name="active-shipper-id"]').val();
	var name = $('[name="shipper-name"]').val();
	var color = $('[name="shipper-color"]').val();

	var method = id == '' ? 'create' : 'update';

	var values = {
		shipper_id: id,
		name: name,
		color: color,
		action: method
	};

	return values;
}

function display_form_error( formElementName, errorString ) {

    if( errorString && errorString != '' ) {
        var error_container = $('.'+ formElementName +'-error');
        var error_text = error_container.find('.error-text');

        $('[name="'+ formElementName +'"]').parents('.form-group').addClass('has-error');

        error_container.removeClass('absolute-hide');

        error_text.text(errorString);
    }
}