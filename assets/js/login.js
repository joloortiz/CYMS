$(document).ready(function () {
	
	    // Validate
    function validate() {
        // Trim
        //$('username').val($('username').val().trim());

        // Check if there empty strings
        if($('username').val() == '' || $('password').val() == '') {
            alert('Please input the required fields');
            return false;
        }
        // Check Login
        var err_message = '';
        $.ajax({
            url: $('body').attr('base-url') + 'login/validate_user',
            type: 'POST',
            async: false,
            data: {
                username: $('#username').val(),
                password: $('#password').val()
            },
            success: function (response) {
                var decode = jQuery.parseJSON(response);
                
                if(decode.success == false) {
                    err_message = decode.msg;
                }
            },
            error: function(jqXHR, textStatus, errorThrown)
			{
			  console.log(jqXHR);
			  console.log(textStatus);
			  console.log(errorThrown);
			}
        });

        if(err_message != '') {
            alert(err_message);
            return false;
        }
        
        return true;
    }

    $('#login-btn').click(function () {
    	var result = validate();	   
    	console.log(result);
    });
});
