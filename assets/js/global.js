/* 
* 
* Global INITS 
*
*/

start_clock()

/*
*
* EVENT LISTENERS
*
*/



/*
*
* FUNCTIONS
*
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

//directly prints specific contents using window.print
function print_element(id, css, append) {

	//get all the elements of the print-section
	var content = document.getElementById(id);
	var pri = document.getElementById('reports-placeholder').contentWindow;
	pri.document.open();
	pri.document.write(content.innerHTML);

	if(append) {
		//add the contents that you want to append
		$('#reports-placeholder').contents().find(append.selector).append(append.content)

		if(append.content != '' && append.reportname == 'fsc_outbound_report') {

			$('#reports-placeholder').contents().find('.issues-display p').removeClass('hide');
			$('#reports-placeholder').contents().find('.issues-text').addClass('hide');
			$('#reports-placeholder').contents().find('.issues-display').removeClass('hide');

		} else if (append.content == '' && append.reportname == 'fsc_outbound_report') {
			$('#reports-placeholder').contents().find('.issues').addClass('hide');
		}

	}	 

	if(css) {
		//add the print version css
		$('#reports-placeholder').contents().find('head')
		.append('<link type="text/css" rel="stylesheet" href="/cyms/assets/css/bootstrap.min.css"><link type="text/css" rel="stylesheet" href="/cyms/assets/css/' + css + '">');
	}

	pri.document.close();
	pri.focus();
	pri.print();

}

//utilizes the Date() function; returns an object of date and time 
function now() {
	var currentdate = new Date();
	var month = new Array();
		month[0] = "Jan";
		month[1] = "Feb";
		month[2] = "Mar";
		month[3] = "Apr";
		month[4] = "May";
		month[5] = "Jun";
		month[6] = "Jul";
		month[7] = "Aug";
		month[8] = "Sep";
		month[9] = "Oct";
		month[10] = "Nov";
		month[11] = "Dec"; 

	m = format_time(currentdate.getMinutes());
	s = format_time(currentdate.getSeconds());

	//format: hours:mins:secs
	var time = currentdate.getHours() + ":" + m + ":" + s;
	
	//format: day month year ex. 23 Dec 2014
	var date = currentdate.getDate() + " " + month[currentdate.getMonth()] + " " + currentdate.getFullYear();

	return {
		date: date,
		time: time
	} 
}

function format_time (i) {
	if(i < 10) {
		i = "0" + i
	}

	return i;
}

function start_clock() {

	setInterval(function() {append_datetime()}, 1000);

}

/*
*
* AJAX FUNCTIONS
*
*/

function get_current_user() {
	var data = [];

  	$.ajax({
        url: $('body').attr('base-url') + 'container_yard/get_current_user',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;
}