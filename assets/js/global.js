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
