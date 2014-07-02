$( "body" ).on('focus', '.generic-datepicker' ,function(){
	
	$(this).datepicker( {
		'dateFormat': 'dd M yy',
		'changeYear': true,
		'changeMonth': true
	} );
	
});