$(document).ready(function () {

/* Variables */


/*
 * INIT
 */


resetdragevent();

//Initialize the anti-draggable stacking

$('#map').find('.entry').each(function(){
    var draggableid = $(this).attr('id');
    var droppableid = $('#' + draggableid).attr('data-position');

    $('#' + droppableid).droppable({ accept: '#' + draggableid });
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
    /*$('#map').find('.entry').each(function(){
        var id = $(this).attr('id');

        //console.log($(id).attr('data-position');
    });
     */   


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
                    console.log('oh hi!');
                    $(this).droppable({ accept: '.entry' });
                }
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

});