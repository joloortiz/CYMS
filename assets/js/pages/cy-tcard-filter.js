$(document).ready(function() {
	reset_fields();
});


/*
 * GLOBALS
 */
var searchTimeout;

$('#clear-list-btn').click(function() {
	reset_filter_list();
});



/*
 * EVENT LISTENERS
 */
$('#present-van-list').on('click', '.filtered-van', function(event) {
	event.preventDefault();

	var card_id = $(this).data('card-id');

	$('#searchFilterModal').modal('hide');

	focus_card_on_layout(card_id); // from container-yard.js
});

$('#filter-btn').click(function() {
	filter();
});

$('#clear-filter-btn').click(function() {
	reset_fields();
});

$('#advanced-search-btn').click(function() {
	show_filter_modal();
});

$('#print-filter-btn').click(function() {
	
	$('#searchFilterModal').modal('hide')
	$('#selectFieldsModal').modal('show');

});

// AUTO FILTER EVENTS
$('input[type="text"], [name="van-presence"], select').change(function() {
	initiate_auto_filter();
});

$('input[type="text"]').keyup(function() {
	initiate_auto_filter();
});



/*
 * FUNCTIONS
 */

function filter() {
	var filter_data = get_filter_data();

	if( filter_data ) {

		$.ajax({
			url: $('body').attr('base-url') + 'container_yard/filter_vans',
			type: 'POST',
			async: true,
			data: filter_data,
			success: function (response) {
				var decode = jQuery.parseJSON(response);
				var append_list_id = '';
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
							list_str = '<li><a href="#" class="'+ (van.e_timeout ? 'entry old-van' : 'filtered-van') +'" data-card-id="'+ van.tc_id +'" style="margin-left: 1em;">' + van.tc_id + ' - '+ van.v_no +'</a></li>';
							append_list_id = van.e_timeout ? 'previous-van-list' : 'present-van-list';

							$('#' + append_list_id).append(list_str);
						});

						if( $('#present-van-list').children().length > 0 ) {
							$('.present-van-list-grp').removeClass('absolute-hide');
						}
						if( $('#previous-van-list').children().length > 0 ) {
							$('.previous-van-list-grp').removeClass('absolute-hide');
						}

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

	var van_presence = $('[name="van-presence"]:checked').val();
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
	var incoming_mat = $('[name="incoming-mat-filter"]').val();
	var outgoing_mat = $('[name="outgoing-mat-filter"]').val();

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
	if( incoming_mat ) {
		data['incoming_mat'] = incoming_mat;
		filter_active = true;
	}
	if( outgoing_mat != '' ) {
		data['outgoing_mat'] = outgoing_mat;
		filter_active = true;
	}
	if( filter_active ) {
		data['van_presence'] = van_presence;

		returnVal = data;
	}

	return returnVal;
}

function reset_filter_list() {
	$('#filter-count').addClass('absolute-hide');
	$('#filter-count-container').addClass('absolute-hide');
	$('#filter-count').text('');
	$('#text-found').text('');

	$('.van-filter-list').empty();
	$('.present-van-list-grp').addClass('absolute-hide');
	$('.previous-van-list-grp').addClass('absolute-hide');
}

function reset_fields() {
	$('#searchFilterModal').find('[type="text"]').val('');
	$('#searchFilterModal').find('[name="van-presence"][value="0"]').prop('checked', true).trigger('change');
	

	setup_tcard_type_filter();
	setup_trucker_filter();
	setup_shipper_filter();
	setup_van_type_filter();
	setup_outgoing_material_filter();
	setup_incoming_material_filter();
}

function show_filter_modal() {
	$('#searchFilterModal').modal({
		keyboard: false,
		backdrop: 'static'
	});
}

function append_select_options(select_name, data) {
	// data - an array of objects with id and text as contents

	// Remove all options except the empty one
    $('[name="'+ select_name +'"]').children().filter(function() {
    	return $(this).val() != '';
    }).remove();

    $.each(data, function( key, object ) {
        option_str = '<option value="' + object.id + '">' + object.text + '</option>';

        $('[name="'+ select_name +'"]').append(option_str);
    });


    return true;
}

function setup_van_type_filter() {
    var list = Array();

    $.ajax({
       url: $('body').attr('base-url') + 'container_yard/van_types_for_select',
       type: 'POST',
       async: true,
       success: function (response) {
           var result = jQuery.parseJSON(response);

           if( result.success ) {
                list = result.list;

                if( append_select_options('van-type-filter', list) ) {
                	$('[name="van-type-filter"]').removeClass('select2-offscreen').select2({
	                    placeholder: 'Van Type',
    					allowClear: true
	                });
                }

               
           }
       }
   });

}

function setup_shipper_filter() {
    var list = Array();

    $.ajax({
       url: $('body').attr('base-url') + 'container_yard/shippers_for_select',
       type: 'POST',
       async: true,
       success: function (response) {
           var result = jQuery.parseJSON(response);

           if( result.success ) {
                list = result.list;

                if( append_select_options('shipper-filter', list) ) {
                	$('[name="shipper-filter"]').removeClass('select2-offscreen').select2({
	                    placeholder: 'Shippers',
    					allowClear: true
	                });
                }

               
           }
       }
   });

}

function setup_trucker_filter() {
    var list = Array();

    $.ajax({
       url: $('body').attr('base-url') + 'container_yard/truckers_for_select',
       type: 'POST',
       async: true,
       success: function (response) {
           var result = jQuery.parseJSON(response);

           if( result.success ) {
                list = result.list;

                if( append_select_options('trucker-filter', list) ) {
                	$('[name="trucker-filter"]').removeClass('select2-offscreen').select2({
	                    placeholder: 'Trucker',
    					allowClear: true
	                });
                }

               
           }
       }
   });

}

function setup_tcard_type_filter() {
    var list = Array();

    $.ajax({
       url: $('body').attr('base-url') + 'container_yard/tcard_types_for_select',
       type: 'POST',
       async: true,
       success: function (response) {
           var result = jQuery.parseJSON(response);

           if( result.success ) {
                list = result.list;

                if( append_select_options('tcard-type-filter', list) ) {
                	$('[name="tcard-type-filter"]').removeClass('select2-offscreen').select2({
	                    placeholder: 'Tcard Type',
    					allowClear: true
	                });
                }

               
           }
       }
   });

}

function setup_incoming_material_filter() {
    var list = Array();

    $.ajax({
       url: $('body').attr('base-url') + 'container_yard/incoming_mats_for_select',
       type: 'POST',
       async: true,
       success: function (response) {
           var result = jQuery.parseJSON(response);

           if( result.success ) {
                list = result.list;

                if( append_select_options('incoming-mat-filter', list) ) {
                	$('[name="incoming-mat-filter"]').removeClass('select2-offscreen').select2({
	                    placeholder: 'Incoming Materials'
	                });
                }

               
           }
       }
   });

}

function setup_outgoing_material_filter() {
    var list = Array();

    $.ajax({
       url: $('body').attr('base-url') + 'container_yard/mat_nos_for_select',
       type: 'POST',
       async: true,
       success: function (response) {
           var result = jQuery.parseJSON(response);

           if( result.success ) {
                list = result.list;

                if( append_select_options('outgoing-mat-filter', list) ) {
                	$('[name="outgoing-mat-filter"]').removeClass('select2-offscreen').select2({
	                    placeholder: 'Material No.',
    					allowClear: true
	                });
                }

               
           }
       }
   });

}

function initiate_auto_filter() {
	clearTimeout( searchTimeout );

	searchTimeout = setTimeout(function() {
		filter();
	}, 500);
}