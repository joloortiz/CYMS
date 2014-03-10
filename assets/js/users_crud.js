$(document).ready(function () {

	$('#username').focusout(function(){
		var username = $(this).val();

		$(this).parents(':eq(1)').removeClass('has-success');
		$(this).parents(':eq(1)').removeClass('has-error');
		$(this).parents(':eq(1)').find('.glyphicon-ok').addClass('hide');
		$(this).parents(':eq(1)').find('.glyphicon-remove').addClass('hide');

		if(username != ''){
			if(is_username_existing(username) == false){
				$(this).parents(':eq(1)').addClass('has-success');
				$(this).parents(':eq(1)').find('.glyphicon-ok').removeClass('hide');
				console.log('graphics - false');
			}
			else{
				$(this).parents(':eq(1)').addClass('has-error');
				$(this).parents(':eq(1)').find('.glyphicon-remove').removeClass('hide');
				console.log('graphics - true');
			}
		}

	})

	function is_username_existing(username) {
		var returnflag = false;

		$.ajax({
	        url: $('body').attr('base-url') + 'users/is_username_existing',
	        type: 'POST',
	        async: false,
	        data: {
	            username: username
	        },
	        success: function (response) {
	            var decode = jQuery.parseJSON(response);
	            console.log(decode.success);
	            if(decode.success == false) {
	                returnflag = false;
	            }
	            else{
	            	returnflag = true;
	            }
	        }
	    });

	    if(returnflag == true){
	    	return true;
	    }
	    else{
	    	return false;
	    }
	}

});