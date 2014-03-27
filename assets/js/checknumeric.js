$( "body" ).on('keydown', '.numeric-input' ,function(event){
        var code = event.which;
        
        if( code < 8 || ( code > 9 && code < 13 ) || ( code > 13 && code < 35 ) || ( code > 40 && code < 45 ) || ( code > 46 && code < 48 ) || ( code > 57 && code < 96 ) || (code > 105 && code < 110) || (code > 110 && code < 190 ) || code > 190 ){
                return false;
        }
        
});

$( "body" ).on('change', '.numeric-input' ,function(event){
        
        if ( !$.isNumeric($(this).val()) ) {
                $(this).val('');
        }
        
});