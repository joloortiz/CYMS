$( "body" ).on('focus', '.generic-datepicker' ,function(){
	
	$(this).datepicker( {
		'dateFormat': 'yy-mm-dd',
		'changeYear': true,
		'changeMonth': true,
		'maxDate': '+0D',
		'minDate': '-70Y',
		'yearRange': '-100:+0'
	} );
	
});