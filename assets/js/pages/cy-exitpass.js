/*
 * LISTENERS
 */

$('[name="van-contents-others"]').focus(function() {
	$(this).closest('.row').find('[type="radio"]').prop('checked', true);
});

$('#new-exit-pass-btn').click(function() {
  var card_id = $('[name="card-id"]').val();

  initiate_new_exit_pass(card_id);

  show_exit_pass_modal();

});

$('#view-exitpass').click(function() {
  var card_id = $('[name="card-id"]').val();

  initiate_exit_pass_preview(card_id);

  show_exit_pass_modal( true );
});

$('[name="van-contents"]').change(function() {  
    // Changing from any radio button to "others" will not trigger change

    $('[name="van-contents-others"]').val('');
});

$('#save-exitpass-btn').click(function() {
  save_exitpass();
});

$('#print-exitpass-btn').click(function() {
  print_exit_pass();
});

// Modal Events
$('#exitPassModal').on('hidden.bs.modal', function() {
  reset_exit_pass();
});

$('#exitPassModal').on('show.bs.modal', function(event) {
  var current_card_id = $('[name="card-id"]').val();

  if( $.trim(current_card_id) == '' ) {
      event.preventDefault();
  }
});


/*
 * FUNCTIONS
 */

function initiate_new_exit_pass( tcard_id ) {

	$.ajax({
       url: $('body').attr('base-url') + 'container_yard/new_exit_pass',
       type: 'POST',
       data: {
       		id: tcard_id
       },
       async: false,
       success: function (response) {
           var result = jQuery.parseJSON(response);
           var details;

           if( result.success && result.details ) {
           		details = result.details;

           		$('.date-text-container').text(details.date);
           		$('.vantype-text-container').text(details.vt_name);
              $('.position-text-container').text(details.tp_position);
           		$('.van-no-text').text(details.v_no ? details.v_no : '');
           		$('.seal-no-text').text(details.tc_sealno ? details.tc_sealno : '');
           		$('.dn-no-text').text(details.tc_dn ? details.tc_dn : '');
           		$('.shipper-text').text(details.s_name ? details.s_name : '');
              $('.epass-serial-text').text(details.e_serial ? details.e_serial : '');
           }
       }
   });
}

function initiate_exit_pass_preview( tcard_id ) {
  $.ajax({
       url: $('body').attr('base-url') + 'container_yard/get_exit_pass',
       type: 'POST',
       data: {
          id: tcard_id
       },
       async: false,
       success: function (response) {
           var result = jQuery.parseJSON(response);
           var details;
           var van_classes = Array();
           var class_value;
           var is_preview = true;

           if( result.success && result.exit_pass ) {
              details = result.exit_pass;

              $('.date-text-container').text(details.e_date);
              $('.vantype-text-container').text(details.vt_name);
              $('.position-text-container').text(details.tp_position);
              $('.timeout-text-container').text(details.e_timeout ? details.e_timeout : '');
              $('.van-no-text').text(details.v_no ? details.v_no : '');
              $('.seal-no-text').text(details.tc_sealno ? details.tc_sealno : '');
              $('.dn-no-text').text(details.tc_dn ? details.tc_dn : '');
              $('.shipper-text').text(details.s_name ? details.s_name : '');
              $('.epass-serial-text').text(details.e_serial ? details.e_serial : '');

              $('.van-contents-text').text(details.e_van_class ? details.e_van_class : '');
              $('.destination-text').text(details.e_destination ? details.e_destination : '');
              $('.plate-no-text').text(details.e_plateno ? details.e_plateno : '');
              $('.particulars-text').text(details.e_particulars ? details.e_particulars : '');
              $('.driver-text').text(details.e_driver ? details.e_driver : '');

              if( !$.trim( details.e_plateno ) || !$.trim( details.e_driver ) ) {
                  is_preview = false;

                  $('[name="destination"]').val(details.e_destination);
                  $('[name="plate-no"]').val(details.e_plateno);
                  $('[name="particulars"]').val(details.e_particulars);
                  $('[name="driver"]').val(details.e_driver);

                  // Van Class
                  $('[name="van-contents"]').each(function() {
                      if( $(this).val() != 'others' ) {
                          van_classes.push( $(this).val() );
                      }
                  });

                  class_value = $.inArray(details.e_van_class_code, van_classes) > -1 ? details.e_van_class_code : 'others';

                  $('[name="van-contents"]').filter(function() {
                      return $(this).val() == class_value;
                  }).prop('checked', true).trigger('change');

                  if( class_value === 'others' ) {
                      $('[name="van-contents-others"]').val( details.e_van_class );
                  }
              }

              $('#exitPassModal').data('preview', is_preview);
           }
       }
   });
}

function get_exitpass_values() {

	var data = {};
	var van_class;

	van_class = $('[name="van-contents"]:checked').val();

	data['id'] = $('[name="card-id"]').val();
	data['destination'] = $('[name="destination"]').val();
	data['plate-no'] = $('[name="plate-no"]').val();
	data['particulars'] = $('[name="particulars"]').val();
	data['driver'] = $('[name="driver"]').val();
	data['van-class'] = van_class == 'others' ? $('[name="van-contents-others"]').val() : van_class;

	return data;
}

function save_exitpass() {
  var data = get_exitpass_values();

  $.ajax({
       url: $('body').attr('base-url') + 'container_yard/save_exit_pass',
       type: 'POST',
       data: data,
       async: true,
       success: function (response) {
           var result = jQuery.parseJSON(response);

           if ( result.success ) {
              reset_exit_pass();

              $('.exit-pass-btn-container').addClass('absolute-hide');
              $('.exit-pass-timeout-container').removeClass('absolute-hide');

              $('#exitPassModal').modal('hide');

              $('#view-exitpass').text(result.serial);

              // remove tcard on van exit
              if( result.timeout ) {
                var tcard_id = $('[name="card-id"]').val();

                $('#' + tcard_id).remove();
                $('#newEntryModal').modal('hide');

                // Functions from container-yard.js
                update_empty_van_list();
                init_pending_counter( pending_count() );
              }
           }
       }
   });
}

function reset_exit_pass() {
  $('#exitPassModal').find('[type="text"], [type="hidden"]').val('');
  $('#exitPassModal').find('[type="radio"][value="FG"]').prop('checked', true).trigger('change');
  $('#exitPassModal').data('preview', false);
  $('#exitPassModal').find('.text-holder').text('');

  $('.preview-field').addClass('absolute-hide');
  $('.entry-field').removeClass('absolute-hide');
}

function show_exit_pass_modal( ) {

  preview = $('#exitPassModal').data('preview');

  if( preview ) {
    $('.preview-field').removeClass('absolute-hide');
    $('.entry-field').addClass('absolute-hide');
  }else {
    $('.preview-field').addClass('absolute-hide');
    $('.entry-field').removeClass('absolute-hide');
  }

  setTimeout(function() {
      $('#exitPassModal').modal({
          keyboard: false,
          backdrop: 'static'
      });
  }, 200);

  check_exit_pass();
  
}

function print_exit_pass () {

    var tcard_id = $('[name="card-id"]').val();

    var exit_pass_details = get_tcard_exit_pass(tcard_id);

    if(exit_pass_details.e_driver != '' && exit_pass_details.e_plateno != '') {
        
        print_element("print-section-exit-pass", 'reports-print.css');

    } else {
        
        print_element("print-section-exit-pass", 'reports-print.css');

    }

}

function check_exit_pass() {
    
    var tcard_id = $('[name="card-id"]').val();
    var data = get_tcard_exit_pass (tcard_id);

    $('#print-exitpass-btn').removeClass('hide');

    if(data == null) {
        $('#print-exitpass-btn').addClass('hide');
    }

}

/*
*
* AJAX Functions 
*
*/

function get_tcard_exit_pass ( tcard_id ) {

  var data = [];

    $.ajax({
        url: $('body').attr('base-url') + 'container_yard/get_tcard_exit_pass',
        type: 'POST',
        async: false,
        data: {
        tcard_id : tcard_id
        },
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;

}