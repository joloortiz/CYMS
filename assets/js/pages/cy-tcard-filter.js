/*
 * GLOBALS
 */
var searchTimeout;


// Select2
$('[name="van-type-filter"]').select2({
    placeholder: 'Van Type',
    allowClear: true
});

$('[name="shipper-filter"]').select2({
    placeholder: 'Shippers',
    allowClear: true
});

$('[name="trucker-filter"]').select2({
    placeholder: 'Trucker',
    allowClear: true
});

$('[name="tcard-type-filter"]').select2({
    placeholder: 'Tcard Type',
    allowClear: true
});



/*
 * EVENT LISTENERS
 */
$('#filter-list').on('click', '.filtered-van', function(event) {
	event.preventDefault();

	var card_id = $(this).data('card-id');

	$('#searchFilterModal').modal('hide');

	focus_card_on_layout(card_id); // from container-yard.js
});

$('#filter-btn').click(function() {
	iniate_filter();
});

$('#clear-filter-btn').click(function() {
	reset_fields();
});

$('#advanced-search-btn').click(function() {
	show_filter_modal();
});


/*
 * FUNCTIONS
 */

function iniate_filter() {
	var filter_data = get_filter_data();

	if( filter_data ) {

		$.ajax({
			url: $('body').attr('base-url') + 'container_yard/filter_vans',
			type: 'POST',
			async: false,
			data: filter_data,
			success: function (response) {
				var decode = jQuery.parseJSON(response);
				var text_found = '';
				var count = 0;
				var list_str = '';

				if( decode.success ) {
					reset_filter_list();


					$('#filter-count-container').removeClass('absolute-hide');

					if( decode.vans ) {

						count = decode.vans.length;
						text_found = 'Found';

						if( count > 0 ) {
							$('#filter-count').removeClass('absolute-hide');
							$('#filter-count').text(count);
						}

						$.each(decode.vans, function(key, van) {
							list_str = '<li><a href="#" class="'+ (van.e_timeout ? 'disabled' : 'filtered-van') +'" data-card-id="'+ van.tc_id +'" style="margin-left: 1em;">' + van.tc_id + ' - '+ van.v_no +'</a></li>';

							$('#filter-list').append(list_str);
						});

					}else {
						text_found = 'No records found';
					}

					$('#text-found').text(text_found);
				}
			}
		});

	}

}

function get_filter_data() {
	var returnVal = false;
	var filter_active = false;
	var data = {};

	var existing_only = $('[name="existing-van-filter"]').prop('checked');
	var tcard_type = $.trim( $('[name="tcard-type-filter"]').val() );
	var van_type = $.trim( $('[name="van-type-filter"]').val() );
	var van_no = $.trim( $('[name="van-no-filter"]').val() );
	var bin_no = $.trim( $('[name="bin-no-filter"]').val() );
	var shipper = $.trim( $('[name="shipper-filter"]').val() );
	var trucker = $.trim( $('[name="trucker-filter"]').val() );
	var batch_code = $.trim( $('[name="batch-code-filter"]').val() );
	var seal_no = $.trim( $('[name="seal-no-filter"]').val() );
	var dn = $.trim( $('[name="dn-filter"]').val() );
	var entry_from = $.trim( $('[name="entry-from-filter"]').val() );
	var entry_to = $.trim( $('[name="entry-to-filter"]').val() );
	var exit_from = $.trim( $('[name="exit-from-filter"]').val() );
	var exit_to = $.trim( $('[name="exit-to-filter"]').val() );
	var stuff_from = $.trim( $('[name="stuff-from-filter"]').val() );
	var stuff_to = $.trim( $('[name="stuff-to-filter"]').val() );
	var seal_from = $.trim( $('[name="seal-from-filter"]').val() );
	var seal_to = $.trim( $('[name="seal-to-filter"]').val() );
	var block_from = $.trim( $('[name="block-from-filter"]').val() );
	var block_to = $.trim( $('[name="block-to-filter"]').val() );

	if( tcard_type != '') {
		data['tcard_type'] = tcard_type;
		filter_active = true;
	}
	if( van_type != '') {
		data['van_type'] = van_type;
		filter_active = true;
	}
	if( van_no != '' ) {
		data['van_no'] = van_no;
		filter_active = true;
	}
	if( bin_no != '' ) {
		data['bin_no'] = bin_no;
		filter_active = true;
	}
	if( shipper != '' ) {
		data['shipper'] = shipper;
		filter_active = true;
	}
	if( trucker != '' ) {
		data['trucker'] = trucker;
		filter_active = true;
	}
	if( batch_code != '' ) {
		data['batch_code'] = batch_code;
		filter_active = true;
	}
	if( seal_no != '' ) {
		data['seal_no'] = seal_no;
		filter_active = true;
	}
	if( dn != '' ) {
		data['dn'] = dn;
		filter_active = true;
	}
	if( entry_from != '' ) {
		data['entry_from'] = entry_from;
		filter_active = true;
	}
	if( entry_to != '' ) {
		data['entry_to'] = entry_to;
		filter_active = true;
	}
	if( exit_from != '' ) {
		data['exit_from'] = exit_from;
		filter_active = true;
	}
	if( exit_to != '' ) {
		data['exit_to'] = exit_to;
		filter_active = true;
	}
	if( stuff_from != '' ) {
		data['stuff_from'] = stuff_from;
		filter_active = true;
	}
	if( stuff_to != '' ) {
		data['stuff_to'] = stuff_to;
		filter_active = true;
	}
	if( seal_from != '' ) {
		data['seal_from'] = seal_from;
		filter_active = true;
	}
	if( seal_to != '' ) {
		data['seal_to'] = seal_to;
		filter_active = true;
	}
	if( block_from != '' ) {
		data['block_from'] = block_from;
		filter_active = true;
	}
	if( block_to != '' ) {
		data['block_to'] = block_to;
		filter_active = true;
	}
	if( filter_active ) {
		data['existing_only'] = existing_only;

		returnVal = data;
	}

	return returnVal;
}

function reset_filter_list() {
	$('#filter-count').addClass('absolute-hide');
	$('#filter-count-container').addClass('absolute-hide');
	$('#filter-count').text('');
	$('#text-found').text('');

	$('#filter-list').empty();
}

function reset_fields() {
	$('#searchFilterModal').find('[type="text"]').val('');
	$('#searchFilterModal').find('[type="checkbox"]').prop('checked', false);
	$('#searchFilterModal').find('select').val('').trigger('change');
}

function show_filter_modal() {
	$('#searchFilterModal').modal({
		keyboard: false,
		backdrop: 'static'
	});
}