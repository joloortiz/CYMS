/* Global Jquery INITS */

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
		month[0] = "January";
		month[1] = "February";
		month[2] = "March";
		month[3] = "April";
		month[4] = "May";
		month[5] = "June";
		month[6] = "July";
		month[7] = "August";
		month[8] = "September";
		month[9] = "October";
		month[10] = "November";
		month[11] = "December"; 

	//format: hours:mins:secs
	var time = currentdate.getHours() + ":" + currentdate.getMinutes() + ":" + currentdate.getSeconds();
	
	//format: month day, year ex. May 23, 2014
	var date = month[currentdate.getMonth()] + " " + currentdate.getDate() + ", " + currentdate.getFullYear();

	return {
		date: date,
		time: time
	} 
}
