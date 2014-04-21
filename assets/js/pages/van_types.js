/*
 * EVENTS
 */

$('#save-van-type').click(function(event) {
	event.preventDefault();

	var id = $('[name="active-van-type-id"]').val();
	var name = $('[name="van-type-name"]').val();

	var method = id == '' ? 'create' : 'update';

	var data = {
		van_type_id: id,
		name: name,
		action: method
	};

	$.ajax({
		url: $('body').attr('base-url') + 'van_types/save',
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
});

$('#new-van-type-btn').click(function() {
	reset_control();
	enable_control();

	$('.van-type').addClass('action');
	$('[name="van-type-name"]').focus();
});

$('#cancel-van-type').click(function() {
	$('.van-type').addClass('action');
	disable_control();
});

$('#van-type-table').on('click', '.van-type.action > .clickable', function() {
	var row = $(this).closest('.van-type.action');
	var id = row.find('[name="van-type-id"]').val();

	$('.van-type').not('.action').addClass('action');
	row.removeClass('action');

	$.ajax({
		url: $('body').attr('base-url') + 'van_types/get_van_type_details',
		type: 'POST',
		async: false,
		data: {
			id: id
		},
		success: function (response) {
			var decode = jQuery.parseJSON(response);
			var van_type_details;

			if( decode.success && decode.details) {
				reset_control();
				enable_control();

				van_type_details = decode.details;

				$('[name="active-van-type-id"]').val(van_type_details.vt_id);
				$('[name="van-type-name"]').val(van_type_details.vt_name);

				$('[name="van-type-name"]').focus();
			}
		}
	});
});

$('.check-selection').change(function() {

	var checkboxes = $('.check-selection:checked');

	if( checkboxes.length > 0 ) {
		$('#delete-van-type-btn').removeClass('absolute-hide');
	}else {
		$('#delete-van-type-btn').addClass('absolute-hide');
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
		$('#delete-van-type-btn').removeClass('absolute-hide');
	}else {
		$('#delete-van-type-btn').addClass('absolute-hide');
	}
});

$('#delete-van-type-btn').click(function() {
	var id_holders = $('.single-select:checked').closest('.van-type').find('[name="van-type-id"]');
	var ids = new Array();

	if( id_holders.length > 0 ) {
		if( confirm("Are you sure you want to delete the selected van types?") ) {
			id_holders.each(function() {
				ids.push( $(this).val() );
			});

			$.ajax({
				url: $('body').attr('base-url') + 'van_types/delete',
				type: 'POST',
				async: false,
				data: {
					van_type_ids: ids
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