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

	$('#firstname, #lastname, #mi, #username, #password, #contactno, #re-password').focusout(function(){

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
		var is_admin = $('#admin').prop('checked') ? 1 : 0;
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
	                is_admin: is_admin,
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
		var is_admin = $('#admin').prop('checked') ? 1 : 0;
		var opt = 'edit';
		var msg = '';
		var returnflag = '';

		if(firstname == '' || lastname == '' || mi == '' || username == '' || contactno == '') {
			if(firstname == '' || lastname == '' || mi == ''){
				$('#firstname, #lastname, #mi').parents(':eq(1)').addClass('has-error');
			}
			if(username == '') {
				$('#username').parents(':eq(1)').addClass('has-error');
			}
			if(contactno == ''){
				$('#contactno').parents(':eq(1)').addClass('has-error');
			}
			msg = "<strong>Oh snap!</strong> Please fill in the required fields.";
			returnflag = false;
            $('#submit-edit').button('reset');
			return { 'returnflag': returnflag, 'msg': msg };
		}else if(is_username_existing(username, id, opt) == true){
			msg = "<strong>Oh snap!</strong> Username is already taken.";
			returnflag = false;
            $('#submit-edit').button('reset');
			return { 'returnflag': returnflag, 'msg': msg };
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
	                is_admin: is_admin,
	                opt: opt
	            },
	            success: function (response) {
	                var decode = jQuery.parseJSON(response);

	                if(decode.success == false) {
	                    err_message = decode.msg;
	                }
	            }
	        });
	        if(err_message != '') {
	            alert(err_message);
	            returnflag = false;
	            return { 'returnflag': returnflag, 'msg': msg };
	        }
	        $('#submit-edit').button('reset');
	        msg = '<strong>Well done!</strong> You have successfully edited the user details.';
	        returnflag = true;
			return { 'returnflag': returnflag, 'msg': msg };
		}
	}

	function purge_user(id) {
		var returnflag = false;
		var opt = 'purge';

		$.ajax({
            url: $('body').attr('base-url') + 'users/save',
            type: 'POST',
            async: false,
            data: {
            	id: id,
                opt: opt
            },
            success: function (response) {
                var decode = jQuery.parseJSON(response);

                if(decode.success == false) {
                    err_message = decode.msg;
                   	returnflag = false;
                } else {
                	returnflag = true;
                }
            }
	    });

	    return returnflag;
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
            	$('#firstname').val(decode[0].u_firstname);
            	$('#mi').val(decode[0].u_mi);
            	$('#username').val(decode[0].u_username);
            	$('#contactno').val(decode[0].u_contactno);
            	$('#admin').prop('checked', decode[0].u_isadmin == 1 ? true : false);
            }

            if($('#u-id').val()){
	            $('.user-edit-modal').modal({
				  	show: true
				});
			}
        }
    	});
	}

	function change_password(password, repassword) {
		var id = $('#u-id').val();
		var msg = '';
		var returnflag = false;

		if(password == '' || repassword == ''){
			msg = '<strong>Oh snap!</strong> Please fill in the required fields.';			
			returnflag = false;
			return {'returnflag' : returnflag, 'msg' : msg };
		}else {
		 	$.ajax({
		        url: $('body').attr('base-url') + 'users/change_password',
		        type: 'POST',
		        async: false,
		        data: {
		        	id: id,
		        	password: password
		        },
		        success: function (response) {
		            var decode = jQuery.parseJSON(response);

		            if(decode.success == false) {
		            	msg = '<strong>Oh snap!</strong> Something went wrong. Please reload the page.';
		                returnflag = false;
		            }else {
		            	msg = '<strong>Well done!</strong> You have successfully updated the password.';
		            	returnflag = true;         	
		            }
		        }
		    });

		    return {'returnflag' : returnflag, 'msg' : msg };
	    }
	}

	function password_compare(password, repassword) {

		if(password == repassword){
			return true;
		}else{
			return false;
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

	$('#tablesorter #edit-btn').click(function() {
		var id = $(this).attr('data-uid');
		edit_mode = 1; 
		get_user_by_id(id);
	});

	$('#tablesorter #purge-btn').click(function() {
		var id = $(this).attr('data-uid');
		var username = $(this).attr('data-username');

		$('.user-purge-modal').modal({
			show: true
		});

		$('#username-placeholder').text(username);
		$('#purge-yes').attr('placeholder-uid', id);
	});

	$('#purge-yes').click(function() {
		var id = $(this).attr('placeholder-uid');

		show_loader();

		setTimeout(function() {
			if(purge_user(id) == true)	{
				remove_loader();
				window.location = document.URL;
			}
		}, 1000);
	});

	$('#submit-edit').click(function() {
		$(this).button('loading');
	    setTimeout(function(){
	    	var result = edit_users_validate();
	    	console.log(result);
			if(result.returnflag == true) {
				remove_alert_classes('.edit-user');
				$('.edit-user').empty();
				$('.edit-user').append(result.msg).addClass('alert-success').removeClass('hide');
			} else {
				remove_alert_classes('.edit-user');
				$('.edit-user').empty();
				$('.edit-user').append(result.msg).addClass('alert-danger').removeClass('hide');			
			}
		}, 250)
	});

	$('#submit-password').click(function() {
		var password = $('#password').val();
		var repassword = $('#re-password').val();
		$(this).button('loading');


		if(password_compare(password, repassword) == true)	{

			var result = change_password(password, repassword);
			console.log(result.returnflag);
			
			if(result.returnflag == true) {
				setTimeout(function(){
					remove_alert_classes('.edit-user');

					$('#submit-password').button('reset');
					$('#password').parents(':eq(1)').removeClass('has-error');
					$('#re-password').parents(':eq(1)').removeClass('has-error');
					$('.edit-user').empty();
					$('.edit-user').append(result.msg).addClass('alert-success').removeClass('hide');
				}, 250)
			} else {
				setTimeout(function(){
					remove_alert_classes('.edit-user');

					$('#submit-password').button('reset');
					$('#password').parents(':eq(1)').addClass('has-error');
					$('#re-password').parents(':eq(1)').addClass('has-error');
					$('.edit-user').empty();
					$('.edit-user').append(result.msg).addClass('alert-danger').removeClass('hide');
				}, 250)
			}
		} else {
			setTimeout(function(){
				remove_alert_classes('.edit-user');

				$('#submit-password').button('reset');
				$('#password').parents(':eq(1)').addClass('has-error');
				$('#re-password').parents(':eq(1)').addClass('has-error');
				$('.edit-user').empty();
				$('.edit-user').append('<strong>Oh snap!</strong> Passwords does not match. Please re-enter your password.').addClass('alert-danger').removeClass('hide');
			}, 250)
		}
	});

	$('.user-edit-modal').on('hidden.bs.modal', function (e) {
  		window.location = document.URL;
	});

});