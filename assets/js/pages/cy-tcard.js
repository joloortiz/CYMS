/*
 * INIT
 */

var van_list = Array();
var n = {}; // van nos
var c = {}; // checkers

setup_van_nos();
reset_tcard();

// Select2
$('[name="card-type"]').select2({
    placeholder: 'Select Card Type',
    formatResult: format_tcard_type_select,
    formatSelection: format_tcard_type_select,
    escapeMarkup: function(m) { return m; }
});

$('[name="incoming-materials"]').select2({
    placeholder: 'Select Materials',
    allowClear: true
});

$('[name="mat-no"]').select2({
    placeholder: 'None',
    allowClear: true
});

$('[name="shipper"]').select2({
    placeholder: 'None',
    allowClear: true
});

$('[name="trucker"]').select2({
    placeholder: 'None',
    allowClear: true
});

$('[name="van-type"]').select2({
    placeholder: 'Select Van Type'
});

$('[name="checker"]').select2({
    placeholder: 'None',
    allowClear: true
});


// Datepicker and Timepicker

$('[name="time-out"]').timepicker();

$('[name="entry-date"]').datetimepicker({
    'dateFormat': 'yy-mm-dd',
    'changeYear': true,
    'changeMonth': true,
    'maxDate': '+0D',
    'minDate': '-70Y',
    'yearRange': '-100:+0'
});


/*
 * EVENT LISTENERS
 */

$('#new-entry-btn').click(function() {

    modal_state_preview(false);

    show_new_entry_modal();
});

$('#save-card').click(function() {
    
    if( validate_form() ) {
        save();
    }

});

$('[name="card-type"]').change(function() {
    var card_id = $(this).val();
    var card_group = $(this).find('.card-type-' + card_id).data('group');

    update_modal_field_state( card_group );
});

$('#newEntryModal').on('hidden.bs.modal', function() {
    reset_tcard();
    $(this).removeClass('modal-active');
});

$('#newEntryModal').on('shown.bs.modal', function() {
    $(this).addClass('modal-active');

    // Trigger change on select boxes to maintain display consistency
    $('#newEntryModal').find('select').trigger('change');
});

$('#tcardBlockModal').on('shown.bs.modal', function() {
    $('#newEntryModal').addClass('absolute-hide');
});

$('#tcardBlockModal').on('hidden.bs.modal', function() {
    $('#newEntryModal').removeClass('absolute-hide');
});

$('body').on('click', '.entry', function() {
    var card_id = $(this).attr('id');
    var details = get_tcard_details(card_id);

    $.each(details, function(form_name, val) {
        $('[name="'+ form_name +'"]').not('[type="checkbox"]').val(val);
    });

    $('[name="incoming-materials"]').trigger('change');

    if( details['exitpass-id'] ) {
        $('.exit-pass-timeout-container').removeClass('absolute-hide');
        $('.exit-pass-btn-container').addClass('absolute-hide');
    }

    $('[name="card-id"]').val(card_id);

    $('.update-card-field').removeClass('absolute-hide');

    update_filters();

    // is blocked
    var is_blocked = details['is-blocked'] == 0 ? false : true;
    var is_defective = details['is-defective'] == 0 ? false : true;
    $('[name="is-blocked"]').prop('checked', is_blocked);
    $('[name="is-defective"]').prop('checked', is_defective);

    $('[name="is-blocked"]').trigger('change');

    modal_state_preview();
    show_new_entry_modal();
});

$("#newEntryModal").on('click', '#edit-tcard', function() {
    modal_state_preview(false);
});

$('#stuff-filter').change(function() {
    var checked = $(this).prop('checked');
    var form_group = $('[name="date-stuffed"]').closest('.row');

    if( checked ) {
        form_group.removeClass('faded');
        form_group.removeClass('disabled');
    }else {
        form_group.addClass('faded');
        form_group.addClass('disabled');

        $('[name="date-stuffed"]').val('');
        $('[name="stu-controller"]').val('');

        $('[name="date-stuffed"]').trigger('change');
    }
});

$('#dn-filter').change(function() {
    var checked = $(this).prop('checked');
    var form_group = $('[name="dn-no"]').closest('.row');

    if( checked ) {
        form_group.removeClass('faded');
        form_group.removeClass('disabled');
    }else {
        form_group.addClass('faded');
        form_group.addClass('disabled');

        $('[name="dn-no"]').val('');

        $('[name="dn-no"]').trigger('change');
    }
});

$('#seal-filter').change(function() {
    var checked = $(this).prop('checked');
    var form_group = $('[name="date-sealed"]').closest('.row');

    if( checked ) {
        form_group.removeClass('faded');
        form_group.removeClass('disabled');
    }else {
        form_group.addClass('faded');
        form_group.addClass('disabled');

        $('[name="date-sealed"]').val('');
        $('[name="seal-no"]').val('');
    }
});

$('#strip-filter').change(function() {
    var checked = $(this).prop('checked');
    var form_group = $('[name="date-stripped"]').closest('.row');

    if( checked ) {
        form_group.removeClass('faded');
        form_group.removeClass('disabled');
    }else {
        form_group.addClass('faded');
        form_group.addClass('disabled');

        $('[name="date-stripped"]').val('');
        $('[name="str-controller"]').val('');

        $('[name="date-stripped"]').trigger('change');
    }
});

$('[name="date-stuffed"]').change(function() {
    var date_val = $(this).val();   // assuming that the value will always be a date

    if( date_val != '' ) {
        $('.delivery-note-group').removeClass('disabled');
        $('.delivery-note-group').removeClass('faded');
    }else {
        reset_dn_group();
    }
});

$('[name="dn-no"]').change(function() {
    var dn_no = $(this).val();

    if( dn_no != '' ) {
        $('.seal-group').removeClass('disabled');
        $('.seal-group').removeClass('faded');
    }else {
        reset_seal_group();
    }
});

$('[name="is-blocked"]').change(function() {
    var checked = $(this).prop('checked');

    tcard_block(checked);
});

$('#block-tcard').click(function() {

    $('#tcardBlockModal').modal({
      keyboard: false,
      backdrop: 'static'
    });



    /*$('[name="is-blocked"]').prop('checked', true);
    $('[name="is-blocked"]').trigger('change');*/
});

$('#confirm-block-btn').click(function() {
    $('[name="is-blocked"]').prop('checked', true);
    $('[name="is-blocked"]').trigger('change');

    $('#tcardBlockModal').modal('hide');
});

$('#unblock-tcard').click(function() {
    $('[name="is-blocked"]').prop('checked', false);
    $('[name="is-blocked"]').trigger('change');
});


/*
 * FUNCTIONS
 */

function setup_van_nos() {

   $.ajax({
       url: $('body').attr('base-url') + 'container_yard/get_vans',
       type: 'POST',
       async: true,
       success: function (response) {
           var result = jQuery.parseJSON(response);

           if( result.success && result.vans && result.vans.length > 0 ) {
               $.each(result.vans, function(key, van) {
                   van_list.push(van.v_no);
               });
           }

           $('[name="van-no"]').autocomplete({
             source: van_list,
             appendTo: '#newEntryModal .modal-body',
             minLength: 0
           });
       }
   });
}

function reset_tcard(){

    update_modal_field_state();
    reset_errors();

    $('#newEntryModal').find('input.form-control').val('');
    $('#newEntryModal').find('[type="checkbox"]').prop('checked', false);
    $('#newEntryModal').find('[type="checkbox"]').trigger('change');
    $('#newEntryModal').find('select.form-control').find(':selected').prop('selected', false);
    $('#newEntryModal').find('select.form-control').trigger('change');

    $('.exit-pass-btn-container').removeClass('absolute-hide');
    $('.exit-pass-timeout-container').addClass('absolute-hide');

    $('[name="card-id"]').val('');

    reset_block_modal();
}

function reset_block_modal() {
    $('[name="is-defective"]').prop('checked', false);
    $('[name="block-reason"]').val('');
}

function update_modal_field_state( card_type ) {
    card_type = typeof card_type == 'undefined' ? 1 : card_type;


    switch( card_type ) {
        case 2:   // Stripping
            $('.stripping-card-field').removeClass('absolute-hide');
            $('.stuffing-card-field').addClass('absolute-hide');
            break;
        case 3:   // Stuffing
            $('.stripping-card-field').addClass('absolute-hide');
            $('.stuffing-card-field').removeClass('absolute-hide');
            break;
        default:    // none;
            $('.stripping-card-field').addClass('absolute-hide');
            $('.stuffing-card-field').addClass('absolute-hide');
            $('.update-card-field').addClass('absolute-hide');
            break;
    }
}

function get_form_names() {
    /* Get form names from server */

    var form_names = {};

    if( n && Object.keys(n).length > 0 ) {
        form_names = n;
    }else {

        $.ajax({
            url: $('body').attr('base-url') + 'container_yard/get_form_names',
            type: 'POST',
            async: false,
            success: function (response) {
                var decode = jQuery.parseJSON(response);
                
                if (decode.success == true) {
                    form_names = decode.form_names;
                    n = decode.form_names;
                } else {
                    alert('Oops! Something went wrong. Please try again.\n\nIf this error persists please contact your system administrator or the web master.');
                }
            }
        });
    }

    return form_names;
}

function get_form_values() {
    var values = {};
    var is_defective = 0;
    var block_reason = null;

    forms = get_form_names();

    $.each(forms, function(key, form_name) {
        values[form_name] = $('[name="'+ form_name +'"]').not('[type="checkbox"]').val();
    });

    // special case (not in form names)
    values['card_id'] = $('[name="card-id"]').val();

    // is_blocked
    values['is-blocked'] = $('[name="is-blocked"]').prop('checked') ? 1 : 0;

    if( values['is-blocked'] == 1 ) {
        is_defective = $('[name="is-defective"]').prop('checked') ? 1 : 0;
        block_reason = $.trim( $('[name="block-reason"]').val() );
    }
    values['is-defective'] = is_defective;
    values['block-reason'] = block_reason;

    return values;
}

function validate_form() {

    var data;
    var validated = false;
    var form_names = get_form_names();

    reset_errors();

    if( Object.keys(form_names).length > 0 ) {

        data = get_form_values();

        // validate
        $.ajax({
            url:$('body').attr('base-url') + 'container_yard/validate_form',
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

                        $.each(form_names, function(key, form) {
                            display_form_error( form, errors[form] );
                        });
                    }

                    if(decode.exception) {  // show exception
                        alert('Exception caught:\n\n' + decode.exception);
                    }
                }
            }
        });

    }

    return validated;
}

function reset_errors() {
    $('.help-inline').text('');

    $('.defective-text').addClass('absolute-hide');
    $('.block-reason-container').addClass('absolute-hide');
    $('.reason-text').text('');
}

function display_form_error( formElementName, errorString ) {

    if( errorString && errorString != '' ) {
        formElement = $('[name="'+ formElementName +'"]');
        var input_container = formElement.parent();
        var error_indicator = input_container.find('.help-inline');

        error_indicator.html(errorString);
    }
}

function save() {
    var data = {};

    data = get_form_values();
    $('#loading-overlay').removeClass('hide');

    $.ajax({
        url: $('body').attr('base-url') + 'container_yard/save_card',
        type: 'POST',
        async: true,
        data: data,
        success: function (response) {
            var result = jQuery.parseJSON(response);

            if( result.success ) {
                var cv;
                var tcard = result.tcard;
                var styleSegment = '';

                // Update tcard data

                if( result.action == 'create' ) {
                    cv = $('.cv-model').clone();
                    cv.attr('class', cv.data('class'));
                    cv.removeAttr('data-class');


                    cv.attr('id', tcard.tc_id);
                }else {

                    /*cv = $('#map').find('.entry').filter(function() {
                        return $(this).data('position') == tcard.tp_position;
                    }); // expected matching row count is 1*/

                    cv = $('#' + tcard.tc_id);
                }

                // style segment
                styleSegment = tcard.tp_top && tcard.tp_top != '' ? 'top: ' + tcard.tp_top + ';' : '';
                styleSegment += tcard.tp_left && tcard.tp_left != '' ? 'left: ' + tcard.tp_left + ';' : '';


                cv.attr('style', 'background-color: ' + tcard.s_color +'; border-color: ' + tcard.tt_color + ';' + styleSegment);
                cv.attr('data-position', tcard.tp_position);
                cv.attr('bin-no', tcard.tc_bin);
                cv.attr('van-no', tcard.v_no);
                cv.attr('dayspan', tcard.dayspan);
                cv.attr('timespan', tcard.timespan);
                cv.text(tcard.display_chars);

                // append the cloned cv
                if( result.action == 'create' ) {
                    $('#pending').find('.panel-body').append(cv);

                    // Initialize card as draggable
                    $('#'+tcard.tc_id).draggable();

                }

                if( tcard.e_timeout && $.trim(tcard.e_timeout) != '' ) {
                    $('#' + tcard.tc_id).remove();
                }

                setTimeout(function() {

                    // both functions from container-yard.js
                    destroy_popover();
                    init_popover();

                    $('#newEntryModal').modal('hide');
                    $('#loading-overlay').addClass('hide');
                }, 500);
            }
        }
    });
}

function modal_state_preview(isPreview) {
    isPreview = typeof isPreview != 'boolean' ? true : isPreview;
    var notifier_content;
    var cancel_button_text;

    $('#newEntryModal').find('input, select, textarea, .in-form-button').prop('disabled', isPreview);

    notifier_content  = isPreview ? '<button id="edit-tcard" class="btn-link">Click here to edit&nbsp;&nbsp;<span class="glyphicon glyphicon-pencil"></span></button>' : '&nbsp;';
    cancel_button_text = isPreview ? 'Done' : 'Cancel';

    $('#cancel-card').text(cancel_button_text);
    $('.tcard-modal-state-notifier').html(notifier_content);

    // Set "save" and "unblock" button display
    if( isPreview ) {
        $('#unblock-tcard').addClass('absolute-hide');
        $('#save-card').addClass('absolute-hide');
    }else {
        $('#unblock-tcard').removeClass('absolute-hide');
        $('#save-card').removeClass('absolute-hide');
    }
}

function get_tcard_details(tc_id) {
    var card_details = {};

    if( typeof tc_id != 'undefined' ) {
        // validate
        $.ajax({
            url:$('body').attr('base-url') + 'container_yard/get_card_details',
            type: 'POST',
            async: false,
            data: {
                id: tc_id
            },
            success: function (response) {
                var decode = jQuery.parseJSON(response);
                var errors;
                
                if (decode.success == true) {
                    card_details = decode.details;
                } else {
                    alert('Something went wrong. Please try again later.');
                }
            }
        });
    }

    return card_details;
}

function show_new_entry_modal() {
    $('#newEntryModal').modal({
        keyboard: false,
        backdrop: 'static'
    });
}

function reset_dn_group() {
    var form = get_form_names();

    $('#dn-filter').prop('checked', false);
    $('#dn-filter').trigger('change');

    $('.delivery-note-group').addClass('disabled');
    $('.delivery-note-group').addClass('faded');

    $('.delivery-note-group').find('[name="'+ form.dn_no +'"]').closest('.row').addClass('disabled');
    $('.delivery-note-group').find('[name="'+ form.dn_no +'"]').closest('.row').addClass('faded');

    $('[name="'+ form.dn_no +'"]').val('');
}

function reset_seal_group() {
    var form = get_form_names();

    $('#seal-filter').prop('checked', false);
    $('#seal-filter').trigger('change');

    $('.seal-group').addClass('disabled');
    $('.seal-group').addClass('faded');

    $('.seal-group').find('[name="'+ form.date_sealed +'"]').closest('.row').addClass('disabled');
    $('.seal-group').find('[name="'+ form.date_sealed +'"]').closest('.row').addClass('faded');

    $('[name="'+ form.date_sealed +'"]').val('');
}

function tcard_block( param ) {

    param = typeof param == 'undefined' ? true : param;

    if( param ) {
        var is_defective = $('[name="is-defective"]').prop('checked');
        var reason = $.trim( $('[name="block-reason"]').val() );

        $('#block-tcard').addClass('absolute-hide');
        $('.tcard-blocked-status').find('.text-warning').removeClass('absolute-hide');

        $('#block-tcard').closest('tr').addClass('bg-danger');

        if( is_defective ) {
            $('.defective-text').removeClass('absolute-hide');
        }

        if( reason != '' ) {
            $('.block-reason-container').removeClass('absolute-hide');
            $('.reason-text').text(reason);
        }
    }else {
        $('#block-tcard').removeClass('absolute-hide');
        $('.tcard-blocked-status').find('.text-warning').addClass('absolute-hide');

        $('#block-tcard').closest('tr').removeClass('bg-danger');

        $('.reason-text').text('');
        $('.block-reason-container').addClass('absolute-hide');
        $('.defective-text').addClass('absolute-hide');
    }
}

function update_filters() {
    var date_stuffed = $('[name="date-stuffed"]');
    var dn = $('[name="dn-no"]');
    var seal_no = $('[name="seal-no"]');
    var date_stripped = $('[name="date-stripped"]');

    var valid = false;

    // STUFFING

    if( $.trim( date_stuffed.val() ) != '' ) {
        $('#stuff-filter').prop('checked', true);
        $('#stuff-filter').trigger('change');
        date_stuffed.trigger('change');

        valid = true;
    }

    if( valid && $.trim( dn.val() ) != '' ) {
        $('#dn-filter').prop('checked', true);
        $('#dn-filter').trigger('change');
        dn.trigger('change');

    }else {
        valid = false;
    }

    if( valid && $.trim( seal_no.val() ) != '' ) {
        $('#seal-filter').prop('checked', true);
        $('#seal-filter').trigger('change');    // nothing happens AOTM when 'change' is triggered
        seal_no.trigger('change');
    }

    // STRIPPING
    if( $.trim( date_stripped.val() ) != '' ) {
        $('#strip-filter').prop('checked', true);
        $('#strip-filter').trigger('change');
    }
}



/* FOR SELECT2 */
function format_tcard_type_select( card_type ) {
    var cardOption = card_type.element;

    if (!card_type.id) return card_type.text; // optgroup
    return "<div class='color-swatch-select' style='background: " + $(cardOption).data('color') + "'></div> " + card_type.text;
}