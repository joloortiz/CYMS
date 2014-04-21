/*
 * INIT
 */

var van_list = Array();
var n = {};

setup_van_nos();
reset_tcard();

// Select2
$('[name="card-type"]').select2({
    placeholder: 'Select Card Type',
    formatResult: format_tcard_type_select,
    formatSelection: format_tcard_type_select,
    escapeMarkup: function(m) { return m; }
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
    placeholder: 'Select Van Type',
});

$('[name="checker"]').select2({
    placeholder: 'None',
    allowClear: true
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
    var modal_active = $(this).parents('#newEntryModal').hasClass('modal-active') ? true : false;
    var card_type_presence = false;

    if( !modal_active ) {
        return false;
    }

    if( card_id != '' ) {
        $('.card-field-row').removeClass('absolute-hide');
        $('.no-tcard-type').addClass('absolute-hide');

        card_type_presence = true;
    }

    update_modal_field_state( card_id );
    has_card_type( card_type_presence );
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

$('body').on('click', '.entry', function() {
    var card_id = $(this).attr('id');
    var details = get_tcard_details(card_id);

    console.log(details);

    $.each(details, function(form_name, val) {
        $('[name="'+ form_name +'"]').val(val);
    });

    modal_state_preview();
    show_new_entry_modal();
});

$("#newEntryModal").on('click', '#edit-tcard', function() {
    modal_state_preview(false);
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
             minLength: 1
           });
       }
   });
}

function reset_tcard(){

    has_card_type( false );
    reset_errors();

    /*$('.orange-card-selection-type').addClass('absolute-hide');*/

    $('#newEntryModal').find('.form-control').val('');
    $('#newEntryModal').find('select.form-control').trigger('change');
}

function has_card_type( value ) {

    if( value ) {
        $('.card-field-row').removeClass('absolute-hide');
        $('.no-tcard-type').addClass('absolute-hide');
    }else {
        $('.card-field-row').addClass('absolute-hide');
        $('.no-tcard-type').removeClass('absolute-hide');
    }
}

function update_modal_field_state( card_type ) {
    card_type = typeof card_type === 'undefined' ? 'card unspecified' : card_type;

    var blocked_card_type = $('[name="card-type"]').find('.orange-card-selection-type').val();

    if( card_type == blocked_card_type ) {
        $('.orange-card-field').removeClass('absolute-hide');
        $('.normal-card-field').addClass('absolute-hide');
    }else {
        $('.orange-card-field').addClass('absolute-hide');
        $('.normal-card-field').removeClass('absolute-hide');
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

    forms = get_form_names();

    $.each(forms, function(key, form_name) {
        values[form_name] = $('[name="'+ form_name +'"]').val();
    });

    // special case (not in form names)
    values['card_id'] = $('[name="card-id"]').val();

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

                }else {

                    cv = $('#map').find('.entry').filter(function() {
                        return $(this).data('position') == tcard.tp_position;
                    }); // expected matching row count is 1
                }

                // style segment
                styleSegment = tcard.tp_top && tcard.tp_top != '' ? 'top: ' + tcard.tp_top + ';' : '';
                styleSegment = tcard.tp_left && tcard.tp_left != '' ? 'left: ' + tcard.tp_left + ';' : '';


                cv.attr('id', tcard.tc_id);
                cv.attr('style', 'background-color: ' + tcard.s_color +'; border-color: ' + tcard.tt_color + ';' + styleSegment);
                cv.attr('data-position', tcard.tp_position);
                cv.attr('bin-no', tcard.tc_bin);
                cv.attr('van-no', tcard.v_no);
                cv.text(tcard.display_chars);

                // append the cloned cv
                if( result.action == 'create' ) {
                    $('#pending').find('.panel-body').append(cv);
                }

                setTimeout(function() {
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

    $('#newEntryModal').find('input[type="text"], select, textarea').prop('disabled', isPreview);

    notifier_content  = isPreview ? '<button id="edit-tcard" class="btn-link">Click here to edit&nbsp;&nbsp;<span class="glyphicon glyphicon-pencil"></span></button>' : '&nbsp;';
    cancel_button_text = isPreview ? 'Done' : 'Cancel';

    $('#cancel-card').text(cancel_button_text);
    $('.tcard-modal-state-notifier').html(notifier_content);

    // Set "save" button display
    if( isPreview ) {
        $('#save-card').addClass('absolute-hide');
    }else {
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



/* FOR SELECT2 */
function format_tcard_type_select( card_type ) {
    var cardOption = card_type.element;

    if (!card_type.id) return card_type.text; // optgroup
    return "<div class='color-swatch-select' style='background: " + $(cardOption).data('color') + "'></div> " + card_type.text;
}