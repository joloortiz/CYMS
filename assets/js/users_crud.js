$(document).ready(function () {
	var edit_mode = 0;


	$('#tablesorter').tablesorter({
		headers: {
			2: { 
                sorter: false 
            } 
        }   
	}); 

	$('#username').focusout(function(){
		var username = $(this).val();
		var id = '';
		var opt = '';

		if(edit_mode == 1){
			opt = 'edit';
			id = $('#u-id').val();
		}

		$(this).parents(':eq(1)').removeClass('has-success');
		$(this).parents(':eq(1)').removeClass('has-error');
		$(this).parents(':eq(1)').find('.glyphicon-ok').addClass('hide');
		$(this).parents(':eq(1)').find('.glyphicon-remove').addClass('hide');

		if(username != ''){
			if(is_username_existing(username, id, opt) == false){
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

	function is_username_existing(username, id, opt) {
		var returnflag = false;

		if(opt == 'add'){
			$.ajax({
		        url: $('body').attr('base-url') + 'users/is_username_existing',
		        type: 'POST',
		        async: false,
		        data: {
		            username: username,
		            opt: opt
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
		} else if(opt == 'edit'){
			$.ajax({
			        url: $('body').attr('base-url') + 'users/is_username_existing',
			        type: 'POST',
			        async: false,
			        data: {
			        	id: id,
			            username: username,
			           	opt: opt
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
		}	
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
		}else if(is_username_existing(username, null, opt) == true){
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

	function edit_users_validate() {
		var id = $('#u-id').val();
		var firstname = $('#firstname').val();
		var lastname = $('#lastname').val();
		var mi = $('#mi').val();
		var username = $('#username').val();
		var contactno = $('#contactno').val();
		var opt = 'edit';
		var err_message = '';

		if(firstname == '' || lastname == '' || mi == '' || username == '' || contactno == '') {
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
            $('.alert .edit-user').append(err_message).removeClass('hide');
            $('#submit-edit').button('reset');
			return false;
		}else if(is_username_existing(username, id, opt) == true){
			console.log(is_username_existing(username, id, opt));
			err_message = "Username is already taken."
			$('.alert').empty();
            $('.alert .edit-user').append(err_message).removeClass('hide');
            $('#submit-edit').button('reset');
			return false;
		}else{
			var err_message = '';
	        $.ajax({
	            url: $('body').attr('base-url') + 'users/save',
	            type: 'POST',
	            async: false,
	            data: {
	            	id: id,
	            	firstname: firstname,
	            	lastname: lastname,
	            	mi: mi,
	                username: username,  
	                contactno: contactno,
	                opt: opt
	            },
	            success: function (response) {
	                var decode = jQuery.parseJSON(response);

	                if(decode.success == false) {
	                    err_message = decode.msg;
	                    $('#submit-edit').button('reset');
	                }
	            }
	        });
	        if(err_message != '') {
	            alert(err_message);
	            return false;
	        }
	        $('#submit-edit').button('reset');
			return true;
		}
	}

	function get_user_by_id(id){
	    $.ajax({
        url: $('body').attr('base-url') + 'users/get_user_by_id',
        type: 'POST',
        async: false,
        data: {
        	id: id
        },
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            if(decode.success == false) {
                console.log(decode);
            }else{
            	$('#u-id').val(decode[0].u_id);
            	$('#lastname').val(decode[0].u_lastname);
            	$('#firstname').val(decode[0].u_lastname);
            	$('#mi').val(decode[0].u_mi);
            	$('#username').val(decode[0].u_username);
            	$('#contactno').val(decode[0].u_contactno);
            	$('#password').val(decode[0].u_password);
            }

            if($('#u-id').val()){
	            $('.user-edit-modal').modal({
				  	show: true
				});
			}
        }
    	});
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

	$('#tablesorter a').click(function() {
		var id = $(this).attr('data-uid');
		edit_mode = 1; 
		get_user_by_id(id);
	});

	$('#submit-edit').click(function() {
		$(this).button('loading');
	    setTimeout(function(){
	    	var result = edit_users_validate();
	    	console.log(result);
			if(result == true) {
				$('.edit-user').empty();
				$('.edit-user').append('<strong>Well done!</strong> You have successfully edited the user details.').addClass('alert-success').removeClass('hide');
			}
		}, 250)
	});

	$('#submit-password').click(function() {
		
	});

	$('.user-edit-modal').on('hidden.bs.modal', function (e) {
  		window.location = $('body').attr('base-url') + 'users';
	})



});