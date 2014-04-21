$(document).ready(function () {
	
	$('#tablesorter').tablesorter({
		headers: {
			2: { 
                sorter: false 
            } 
        }   
	}); 

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
			}
			else{
				$(this).parents(':eq(1)').addClass('has-error');
				$(this).parents(':eq(1)').find('.glyphicon-remove').removeClass('hide');
			}
		}

	});

	$('#firstname, #lastname, #mi, #username, #password, #contactno').focusout(function(){

		if($(this).val() == ''){
			$(this).parents(':eq(1)').addClass('has-error');
		}

	});	

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

	function add_users_validate(){
		var firstname = $('#firstname').val();
		var lastname = $('#lastname').val();
		var mi = $('#mi').val();
		var username = $('#username').val();
		var password = $('#password').val();
		var contactno = $('#contactno').val();
		var opt = 'add';
		var err_message = '';

		if(firstname == '' || lastname == '' || mi == '' || username == '' || password == '' || contactno == '') {
			if(firstname == '' || lastname == '' || mi == ''){
				$('#firstname, #lastname, #mi').parents(':eq(1)').addClass('has-error');
			}
			if(username == '') {
				$('#username').parents(':eq(1)').addClass('has-error');
			}
			if(password == '') {
				$('#password').parents(':eq(1)').addClass('has-error');
			}
			if(contactno == ''){
				$('#contactno').parents(':eq(1)').addClass('has-error');
			}

			err_message = "Please fill in the required fields."
			$('.alert').empty();
            $('.alert').append(err_message).removeClass('hide');
            $('#submit').button('reset');
			return false;
		}else if(is_username_existing(username) == true){
			err_message = "Username is already taken."
			$('.alert').empty();
            $('.alert').append(err_message).removeClass('hide');
            $('#submit').button('reset');
			return false;
		}else{
			var err_message = '';
	        $.ajax({
	            url: $('body').attr('base-url') + 'users/save',
	            type: 'POST',
	            async: false,
	            data: {
	            	firstname: firstname,
	            	lastname: lastname,
	            	mi: mi,
	                username: username,  
	                password: password,
	                contactno: contactno,
	                opt: opt
	            },
	            success: function (response) {
	                var decode = jQuery.parseJSON(response);

	                if(decode.success == false) {
	                    err_message = decode.msg;
	                    $('#submit').button('reset');
	                }
	            }
	        });
	        if(err_message != '') {
	            alert(err_message);
	            return false;
	        }
			return true;
		}
	}

	$('#submit').click(function() {
		$(this).button('loading');
	    setTimeout(function(){
	    	var result = add_users_validate();
	    	console.log(result);
			if(result == true) {
				window.location = $('body').attr('base-url') + 'users/?add=success';
			}
		}, 250)
	});

});