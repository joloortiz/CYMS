/*
 * EVENTS
 */

$('#save-material').click(function(event) {
	event.preventDefault();

	if( validate() ) {
		save();
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
				$('[name="material-description"]').val(material_details.m_description);

				$('[name="material-type"]:checked').prop('checked', false);
				$('[name="material-type"][value="'+ material_details.m_type +'"]').prop('checked', true);

				$('[name="material-category"]').val(material_details.m_category);

				$('[name="material-name"]').focus();
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

	$('[name="material-type"][value="2"]:checked').prop('checked', false);
	$('[name="material-type"][value="1"]').not(':checked').prop('checked', true);

	$('[name="material-category"]').val('FG');
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
	var id = $('[name="active-material-id"]').val();
	var name = $('[name="material-name"]').val();
	var description = $('[name="material-description"]').val();
	var type = $('[name="material-type"]:checked').val();
	var category = $('[name="material-category"]').val();

	var method = id == '' ? 'create' : 'update';

	var data = {
		material_id: id,
		action: method
	};

	// hyphenated form names
	data['material-name'] = name;
	data['material-type'] = type;
	data['material-description'] = description;
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