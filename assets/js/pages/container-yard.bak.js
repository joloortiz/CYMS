$(document).ready(function () {

/* Variables */
var serial = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];

var stackedgroups = ['T', 'O1', 'O2', 'O3', 'O4', 'O5', 'O6', 'A', 'A2', 'A3', 'A4', 'A5', 'A6', 'B1', 'B2', 'B3', 'B4', 'B5', 'B6', 'C1', 'C2', 'C3', 'C4', 'C5', 'C6', 'D1', 'D2', 'D3', 'D4', 'D5', 'D6', 'c1', 'c2', 'c3', 'c4', 'c5', 'c6', 'CE'];

/*
 * INIT
 */

resetdragevent();

//disable all 2nd floor droppalbes
for(var i in serial){
    for(var j in stackedgroups){

            //check if ID exists
            if($('#' + stackedgroups[j] + serial[i]).length){

                //check if droppable is at the top
                if(i%2 != 0){
                    $('#' + stackedgroups[j] + serial[i]).droppable('disable');
                }
                
            }
    }
}

//Initialize the anti-draggable stacking
$('#map').find('.entry').each(function(){
    var draggableid = $(this).attr('id');
    var droppableid = $('#' + draggableid).attr('data-position');
    //
    $('#' + droppableid).droppable({ accept: '#' + draggableid });

    //enable valid 2nd floor droppables
    if(is_id_even(droppableid)){
        var droppabletopid = get_droppable_top(droppableid);
        if(droppabletopid != false){
            $('#' + droppabletopid).droppable('enable');
        }
    }else if(!is_id_even(droppableid)){
        /*
        var droppablebottomid = get_droppable_bottom(droppableid);
        if(droppablebottomid != false)
            $('#' + droppablebottomid).droppable('disable');
        */
    }
});

//Disable all the T-cards on the CY
$('#map>div>.entry').draggable('disable');


 
/*
 * EVENT LISTENERS
 */
/*
$("#map").niceScroll({cursorwidth: '8px', cursorcolor: 'rgba(0,0,0,.3)'});

$('#zoom').click(function(){
    $('#map').data('zoom', 1);
    $('#map .panel-body').css({'-webkit-transform': 'scale(' + 1 + ')', '-webkit-transform-origin': '0 0'})
    $("#map").getNiceScroll().resize();
    resetdragevent();
});

$('#zoom-out').click(function(){
    var zoom = $('#map').data('zoom');
    zoom -= 0.2;
    $('#map').data('zoom', zoom);
    $('#map .panel-body').css({'-webkit-transform': 'scale(' + zoom + ')', '-webkit-transform-origin': '0 0'})
    //$("#map").getNiceScroll().resize();
    resetdragevent();
});

$('#zoom-in').click(function(){
    var zoom = $('#map').data('zoom');
    zoom += 0.2;
    $('#map').data('zoom', zoom);
    $('#map .panel-body').css({'-webkit-transform': 'scale(' + zoom + ')', '-webkit-transform-origin': '0 0'})
    //$("#map").getNiceScroll().resize();
    resetdragevent();
});
*/



/*
 * FUNCTIONS
 */

function resetdragevent(){

    $('#pending .panel-body').droppable({
        out: function(event, ui) {
            var draggable = ui.draggable[0].id;

            if($('#edit-btn').attr('editmode') == 1){
                $('#' + draggable).attr('data-start-position', 'pending')
            }
        },
        drop: function(event, ui) {
            var droppableid = $(this)[0].id;
            var draggable = ui.draggable[0].id;

            $('#' + draggable).appendTo("#pending .panel-body");

            $('#history .panel-body').prepend('<li><a>' + draggable + '</a> is moved to pending</div>');

            setTimeout(function(){
                $('#' + draggable).css({
                    'top': 0, 
                    'left': 0}
                );
                $('#' + draggable).draggable();
            }, 10);

        }
    });

    $('#map .dp').droppable({
        out: function( event, ui ) {

            var droppableid = $(this)[0].id;
            var draggable = ui.draggable[0].id;

            //Enter edit mode
            if($('#edit-btn').attr('editmode') == 1){
                //Check if the tcard has already been moved
                if(typeof $('#' + draggable).attr('data-start-position') === 'undefined'){
                    $('#' + draggable).attr('data-start-position', droppableid);
                    $('#' + draggable).attr('data-start-top', $('#' + droppableid).css('top'));
                    $('#' + draggable).attr('data-start-left', $('#' + droppableid).css('left'));

                    
                }

                if(is_id_even(droppableid)){
                    var droppabletopid = get_droppable_top(droppableid);
                    if(droppabletopid){
                        $('#' + droppabletopid).droppable('disable');
                    }
                }else{
                    var droppablebottomid = get_droppable_bottom(droppableid);
                    var draggablebottomid = $('#map').find('.entry[data-position="'+ droppablebottomid +'"]').attr('id');
                    
                    if(draggablebottomid){
                         $('#' + draggablebottomid).draggable('enable');
                    }
                }

                $(this).droppable({ accept: '.entry' });
            }
            $(this).droppable({ accept: '.entry' });
        },
        drop: function( event, ui ) {
            //test
            

            var droppableid = $(this)[0].id;
            var draggable = ui.draggable[0].id;

            $('#' + draggable).appendTo("#map .panel-body");

            $('#history .panel-body').prepend('<li><a>' + draggable + '</a> is dropped to <a>' + droppableid + '</a></div>');

            setTimeout(function(){
                $('#' + draggable).attr('data-position', droppableid)
                $('#' + draggable).css({
                    'top': $('#' + droppableid).css('top'), 
                    'left': $('#' + droppableid).css('left')}
                );
                if($('#edit-btn').attr('editmode') == 1){
                    $('#' + draggable).draggable();
                }else{
                    $('#' + draggable).draggable( "disable" );
                }
                if(is_id_even(droppableid)){
                    var droppabletopid = get_droppable_top(droppableid);
                    if(droppabletopid != false){
                       $('#' + droppabletopid).droppable('enable');
                    }
                }
                else{
                    var droppablebottomid = get_droppable_bottom(droppableid);
                    var draggablebottomid= $('#map').find('.entry[data-position="'+ droppablebottomid +'"]').attr('id');
                    
                    if(draggablebottomid){
                         $('#' + draggablebottomid).draggable('disable');
                    }
                }
            }, 10);



            $(this).droppable({ accept: '#' + draggable });
        }
    });

    //$('#O52').droppable({ accept: '#AFP10009' });

    $('.entry').draggable({
            scroll: true,
            scrollSensitivity: 50, 
            scrollSpeed: 50,
            revert: 'invalid',
            revertDuration: 0,
            cursor: 'pointer',
            helper: 'clone',
            start: function(event, ui){
            },
            stop: function(event, ui){
            }
    });

/*
    $('#map .entry').draggable({
        stop: function(event, ui) {
            var draggableid = $(this).attr('id');
            var droppableid = $('#' + draggableid).attr('data-position');

            $('#' + droppableid).droppable('disable');
        }
    });
*/
}

$('#edit-btn').click(function(){
    $('#map>div>.entry').draggable('enable');
    $(this).addClass('hide');
    $(this).attr('editmode', 1);
    $('#cancel-btn, #save-btn').removeClass('hide');
          
    /*
    *   enable bottom tcards with out top. 
    *   disable bottom tcards with top
    *   enable top tcards with bottom 
    */

    //Initialize the anti-draggable stacking
    $('#map').find('.entry').each(function(){
        var draggableid = $(this).attr('id');
        var droppableid = $('#' + draggableid).attr('data-position');
        //
        if(is_id_even($('#' + draggableid).attr('data-position'))){
            var droppabletop = get_droppable_top($('#' + draggableid).attr('data-position'));

            if(droppabletop){
                $('#' + draggableid).draggable('disable');
            }
        }
    });



    //Alert if the user navigates away after editing. Turn the trapping on.
    window.onbeforeunload = function(e) {
        return 'Are you sure you want to leave this page?  You will lose any unsaved data.';
    };

});


$('#save-btn').click(function(){
    $('#map>div>.entry').draggable('disable');
    $('#edit-btn').removeClass('hide');
    $('#edit-btn').attr('editmode', 0);
    $('#cancel-btn, #save-btn').addClass('hide');


    //Turn the trapping off
    window.onbeforeunload = null;

    //code to save the edits to the database
});

$('#cancel-btn').click(function(){

    //trap to ask before cancelling
    //code to revert the changes??

});


$('#cancel-yes').click(function(){
    $('#map>div>.entry').draggable('disable');
    $('#edit-btn').removeClass('hide');
    $('#edit-btn').attr('editmode', 0);
    $('#cancel-btn, #save-btn').addClass('hide');

    //loading chuchu
});

$('#cancel-no').click(function(){
    $('#map>div>.entry').draggable('disable');
    $('#edit-btn').removeClass('hide');
    $('#edit-btn').attr('editmode', 0);
    $('#cancel-btn, #save-btn').addClass('hide');

    //code to revert
    revert();
    //resetdragevent();
});
$('#cancel-cancel').click(function(){
    //as is
});


/*
function edit_history(id){
    var id = id;
    var data_position = data_position;
}*/


function revert() {

    $('#map').find('.entry').each(function(){
        var id = '#' + $(this).attr('id');

        if(typeof $(id).attr('data-start-position') !== 'undefined' && $(id).attr('data-start-position') != 'pending'){
            var top = $(id).attr('data-start-top');
            var left = $(id).attr('data-start-left');

            $(id).css('top', top);
            $(id).css('left', left);
            $(id).removeAttr('data-start-position');
            $(id).removeAttr('data-start-left');
            $(id).removeAttr('data-position');
        } else if($(id).attr('data-start-position') == 'pending'){
            $(id).css('top', '0px');
            $(id).css('left', '0px');
            $(id).removeAttr('data-start-position');
            $(id).removeAttr('data-start-left');
            $(id).removeAttr('data-position');

            var tempClone = $(id).clone();
            $(id).remove();

            $('#pending .panel-body').append(tempClone);

            $(id).draggable();
        }

    });  
}

function get_droppable_top(droppableid) {
    var droppableid_length = droppableid.length;
    var stackedgroups_length = droppableid_length - 1;
    var id_serial = droppableid.slice(stackedgroups_length, droppableid_length);
    var id_stackedgroups = droppableid.slice(0, stackedgroups_length);

    for(var i in serial){
        if(id_serial == serial[i]){
            var index = i;
        }
    }

    var droppabletop = id_stackedgroups + serial[index - 1];


    for(var i in serial){
        for(var j in stackedgroups){
            if((stackedgroups[j] + serial[i]) == droppabletop){
                return droppabletop;
            }
        }
    }

    return false;
}


function get_droppable_bottom(droppableid) {
    var droppableid_length = droppableid.length;
    var stackedgroups_length = droppableid_length - 1;
    var id_serial = droppableid.slice(stackedgroups_length, droppableid_length);
    var id_stackedgroups = droppableid.slice(0, stackedgroups_length);

    for(var i in serial){
        if(id_serial == serial[i]){
            var index = i;
        }
    }


    var droppablebottom = id_stackedgroups + serial[parseInt(index) + 1];

    for(var i in serial){
        for(var j in stackedgroups){
            if((stackedgroups[j] + serial[i]) == droppablebottom){
                return droppablebottom;
            }
        }
    }

    return false;
}



//function to find out if droppableid has even prefix ex. A66
function is_id_even(droppableid) {
    var droppableid_length = droppableid.length;
    var stackedgroups_length = droppableid_length - 1;
    var id_serial = droppableid.slice(stackedgroups_length, droppableid_length);

    for(var i in serial){
        if(id_serial == serial[i]){
            if(i%2 == 0){
                return true;
            }else{
                return false;
            }
        }
    }

}

function add_bottom(){

    $('#map').find('.dp').each(function(){
        var droppableid = $(this).attr('id');
        //
        if(!is_id_even(droppableid)){
            var droppablebottomid = get_droppable_bottom(droppableid);
            
            $('#' + droppablebottomid).attr('dp-top', droppableid);
        
        }
    });

}

function add_top(){

    $('#map').find('.dp').each(function(){
        var droppableid = $(this).attr('id');
        //
        if(is_id_even(droppableid)){
            var droppabletopid = get_droppable_top(droppableid);
            
            $('#' + droppabletopid).attr('dp-bottom', droppableid);
        
        }
    });

}

add_bottom();
add_top();

});