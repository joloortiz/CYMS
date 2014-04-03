/*
 * EVENTS
 */

$('#save-material').click(function(event) {
	event.preventDefault();

	var data = get_form_values();

	if( !$('#control-form-container').is('.faded.disabled') && validate_form() ) {

		$.ajax({
			url: $('body').attr('base-url') + 'materials/save',
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

$('#new-material-btn').click(function() {
	reset_control();
	enable_control();

	reset_errors();

	$('.material').addClass('action');
	$('[name="material-name"]').focus();
});

$('#cancel-material').click(function() {
	$('.material').addClass('action');
	disable_control();
	reset_errors();
});


$('#material-table').on('click', '.material.action > .clickable', function() {
	reset_errors();

	var row = $(this).closest('.material.action');
	var id = row.find('[name="material-id"]').val();

	$('.material').not('.action').addClass('action');
	row.removeClass('action');

	$.ajax({
		url: $('body').attr('base-url') + 'materials/get_material_details',
		type: 'POST',
		async: false,
		data: {
			id: id
		},
		success: function (response) {
			var decode = jQuery.parseJSON(response);
			var material_details;

			if( decode.success && decode.details) {
				reset_control();
				enable_control();

				material_details = decode.details;

				$('[name="active-material-id"]').val(material_details.m_id);
				$('[name="material-name"]').val(material_details.m_name);
				$('[name="material-type"]').val(material_details.m_type);
			}
		}
	});
});

$('.check-selection').change(function() {

	var checkboxes = $('.check-selection:checked');

	if( checkboxes.length > 0 ) {
		$('#delete-material-btn').removeClass('absolute-hide');
	}else {
		$('#delete-material-btn').addClass('absolute-hide');
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
		$('#delete-material-btn').removeClass('absolute-hide');
	}else {
		$('#delete-material-btn').addClass('absolute-hide');
	}
});

$('#delete-material-btn').click(function() {
	var id_holders = $('.single-select:checked').closest('.material').find('[name="material-id"]');
	var ids = new Array();

	if( id_holders.length > 0 ) {
		if( confirm("Are you sure you want to delete the selected materials?") ) {
			id_holders.each(function() {
				ids.push( $(this).val() );
			});

			$.ajax({
				url: $('body').attr('base-url') + 'materials/delete',
				type: 'POST',
				async: false,
				data: {
					material_ids: ids
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

function validate_form() {

    var data;
    var validated = false;

    reset_errors();

    data = get_form_values();

    // validate
    $.ajax({
        url:$('body').attr('base-url') + 'materials/validate_form',
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

                    display_form_error( 'material-name', errors['name'] );
                    display_form_error( 'material-type', errors['type'] );
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
	var id = $('[name="active-material-id"]').val();
	var name = $('[name="material-name"]').val();
	var type = $('[name="material-type"]').val();

	var method = id == '' ? 'create' : 'update';

	var values = {
		material_id: id,
		name: name,
		type: type,
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