// TEMP 
$(document).ready(function() {
    show_exit_pass_modal();
});


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

$('[name="van-contents"]').change(function() {
    // Changing from any radio button to "others" will not trigger change

    $('[name="van-contents-others"]').val('');
});

$('#save-exitpass-btn').click(function() {
  save_exitpass();
});


// Modal Events
$('#exitPassModal').on('hidden.bs.modal', function() {
  reset_exit_pass();
  $('#newEntryModal').removeClass('absolute-hide');
});

$('#exitPassModal').on('shown.bs.modal', function() {
  $('#newEntryModal').addClass('absolute-hide');
});

$('#exitPassModal').on('show.bs.modal', function(event) {
  var current_card_id = $('[name="card-id"]').val();

  if( $.trim(current_card_id) == '' ) {
      // event.preventDefault();
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
           		$('.van-no-text').text(details.v_no);
           		$('.seal-no-text').text(details.tc_sealno);
           		$('.dn-no-text').text(details.tc_dn);
           		$('.shipper-text').text(details.s_name);
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
           }
       }
   });
}

function reset_exit_pass() {
  $('#exitPassModal').find('[type="text"], [type="hidden"]').val('');
  $('#exitPassModal').find('[type="radio"][value="FG"]').prop('checked', true).trigger('change');
  $('.text-holder').text('');
}

function show_exit_pass_modal() {

  setTimeout(function() {
    $(document).ready(function() {
      $('#exitPassModal').modal({
          keyboard: false,
          backdrop: 'static'
      });
    });
  }, 200);
  
}