reset_van_transfer_modal();

// Select2
$('#van-transfer-type-selector').select2({
    placeholder: 'Select van type',
    minimumResultsForSearch: 5   // minimum number of options to show search box
});

/*
 * LISTENERS
 */

$('.van-transfer-btn').click(function() {
    var btn_origin = $(this).data('origin');

    show_van_transfer_modal(btn_origin);
});


$('#van-transfer-type-selector').change(function() {
    var van_type = $(this).val();

    reset_van_list();

    switch( van_type ) {
        case '1': // Container van
            list_empty_vans();
            $('#transfer-van-btn').prop('disabled', true);

            break;
        case '2': // Wing van
            $('#van-transfer-type-selector').prop('disabled', false);
            $('#transfer-van-btn').prop('disabled', false);

            break;
        default:  // None
            // For now do nothing (^^^)
            break;

    }
});

$('#vanTransferModal').on('change', '[name="cv-transfer-selection"]', function() {
    if( $(this).val() != '' ) {
        $('#transfer-van-btn').prop('disabled', false);
    }
})

$('#transfer-van-btn').click( function() {
    var target_card_id = $('[name="cv-transfer-selection"]:checked').val();
    var card_id = $('[name="card-id"]').val();

    target_card_id = target_card_id ? target_card_id : '';

    transfer_van( card_id, target_card_id );
});

$('#vanTransferModal').on('hidden.bs.modal', function() {
    reset_van_transfer_modal();
});

/*
 * FUNCTIONS
 */

function show_van_transfer_modal( btn_origin ) {
    var card_id = $('[name="card-id"]').val();

    if( card_id == '' ) {
        return false;
    }

    switch( btn_origin) {
        case 'tcard':
            $('#van-transfer-type-selector').val('1').trigger('change');

            break;
        case 'exitpass':
            $('#van-transfer-type-selector').prop('disabled', false);

            break;
        default:
            // basically do nothing
            break;
    }

    $('#vanTransferModal').modal({
        keyboard: true,
        backdrop: 'static'
    });

} 

function list_empty_vans() {
    var current_card = $('[name="card-id"]').val();

    $.ajax({
        url: $('body').attr('base-url') + 'container_yard/get_empty_vans',
        type: 'POST',
        async: false,
        data: {
            except: current_card
        },
        success: function (response) {
            var decode = jQuery.parseJSON(response);
            var list_str = '';

            if(decode.success ) {

                reset_van_list();

                if( decode.list ) {

                    $.each(decode.list, function( key, van ) {
                        list_str = '<li><label class="has-radio-checkbox"><input type="radio" name="cv-transfer-selection" value="'+ van.tc_id +'">&nbsp;<strong class="checkbox-radio-label">'+ van.v_no +'</strong></label></li>';


                        $('#empty-van-transfer-list').append(list_str);
                    });

                }
            }
        }
    });
}

function reset_van_list() {
    $('#empty-van-transfer-list').empty();
}

function reset_van_transfer_modal() {
    $('#van-transfer-type-selector').val('').trigger('change');
    $('#van-transfer-type-selector').prop('disabled', true);
    $('#transfer-van-btn').prop('disabled', true);

    $('#wingvan-transfer').remove();

    reset_van_list();
}

function transfer_van( from_card, to_card ) {

    to_card = typeof to_card == 'undefined' ? '' : to_card;

    $.ajax({
        url: $('body').attr('base-url') + 'container_yard/initiate_van_transfer',
        type: 'POST',
        async: true,
        data: {
            orig_card: from_card,
            target_card: to_card
        },
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            if(decode.success ) {

                reset_tcard();   // from cy-tcard.js

                if( decode.van_type == 'wv' ) {   // Wing Van
                    var new_card_id = decode.new_card_id;

                    $('#vanTransferModal').append('<input id="wingvan-transfer" type="hidden">');
                    $('[name="card-id"]').val(new_card_id);

                    $.when( save() ).done(function() {
                        console.log(new_card_id);

                        setTimeout(function() { // just one sec... really
                            $('[name="card-id"]').val(new_card_id);
                        }, 1000);
                    });

                }else if( decode.van_type == 'cv' ) {
                    $('#newEntryModal').modal('hide');

                    var card_id = decode.new_id;

                    // FUNCTIONS from container-yard.js
                    destroy_popover()
                    init_popover();
                    focus_card_on_layout( card_id );
                }

                $('#vanTransferModal').modal('hide');
            }
        }
    });
}