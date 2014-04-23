/* Global Jquery INITS */
/*
jQuery(function ($) {
var target = $('#loading-overlay');
 
$('.add-loading').click(function () {
target.removeClass('hide');
});
 
$('.remove-loading').click(function () {
target.addClass('hide');
});
});
*/

function remove_alert_classes(id) {
	$(id).removeClass('alert-danger');
	$(id).removeClass('alert-success');
	$(id).removeClass('alert-info');
	$(id).removeClass('alert-warning');
}

function show_loader() {
	$('#loading-overlay').removeClass('hide');
}

function remove_loader() {
	$('#loading-overlay').addClass('hide');
}	
