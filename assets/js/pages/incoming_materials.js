/*
 * EVENTS
 */

$('#save-incoming-material').click(function(event) {
	event.preventDefault();

	if( validate() ) {
		save();
	}
	
});

$('#new-incoming-material-btn').click(function() {
	reset_control();
	enable_control();
	reset_errors();

	$('.incoming-material').addClass('action');
	$('[name="incoming-material-name"]').focus();
});

$('#cancel-incoming-material').click(function() {
	$('.incoming-material').addClass('action');
	disable_control();
	reset_errors();
});

$('#incoming-material-table').on('click', '.incoming-material.action > .clickable', function() {
	reset_errors();
	
	var row = $(this).closest('.incoming-material.action');
	var id = row.find('[name="incoming-material-id"]').val();

	$('.incoming-material').not('.action').addClass('action');
	row.removeClass('action');

	$.ajax({
		url: $('body').attr('base-url') + 'incoming_materials/get_incoming_material_details',
		type: 'POST',
		async: false,
		data: {
			id: id
		},
		success: function (response) {
			var decode = jQuery.parseJSON(response);
			var incoming_material_details;

			if( decode.success && decode.details) {
				reset_control();
				enable_control();

				incoming_material_details = decode.details;

				$('[name="active-incoming-material-id"]').val(incoming_material_details.im_id);
				$('[name="incoming-material-name"]').val(incoming_material_details.im_name);

				$('[name="material-category"]').val(incoming_material_details.im_category);

				$('[name="incoming-material-name"]').focus();
			}
		}
	});
});

$('.check-selection').change(function() {

	var checkboxes = $('.check-selection:checked');

	if( checkboxes.length > 0 ) {
		$('#delete-incoming-material-btn').removeClass('absolute-hide');
	}else {
		$('#delete-incoming-material-btn').addClass('absolute-hide');
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
		$('#delete-incoming-material-btn').removeClass('absolute-hide');
	}else {
		$('#delete-incoming-material-btn').addClass('absolute-hide');
	}
});

$('#delete-incoming-material-btn').click(function() {
	var id_holders = $('.single-select:checked').closest('.incoming-material').find('[name="incoming-material-id"]');
	var ids = new Array();

	if( id_holders.length > 0 ) {
		if( confirm("Are you sure you want to delete the selected van types?") ) {
			id_holders.each(function() {
				ids.push( $(this).val() );
			});

			$.ajax({
				url: $('body').attr('base-url') + 'incoming_materials/delete',
				type: 'POST',
				async: false,
				data: {
					incoming_material_ids: ids
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

	// material category
	$('[name="material-category"]').val(1);
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

function get_form_values() {
	var id = $('[name="active-incoming-material-id"]').val();
	var name = $('[name="incoming-material-name"]').val();
	var category = $('[name="material-category"]').val();

	var method = id == '' ? 'create' : 'update';

	var data = {
		incoming_material_id: id,
		action: method
	};

	// hyphenated form names
	data['incoming-material-name'] = name;
	data['material-category'] = category;

	return data;
}

function validate() {

	var data;
    var validated = false;

    reset_errors();

    data = get_form_values();

    // validate
    $.ajax({
        url:$('body').attr('base-url') + 'incoming_materials/validate_form',
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
		url: $('body').attr('base-url') + 'incoming_materials/save',
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