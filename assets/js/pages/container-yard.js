/*
 * INIT
 */

resetdragevent();



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
    $('#map .cv').droppable({
        drop: function( event, ui ) {
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
                    console.log('1');
                }else{
                    $('#' + draggable).draggable( "disable" );
                    console.log('0');
                }
            }, 10);
            
        }
    });


    $('.entry').draggable({
            scroll: true,
            scrollSensitivity: 50, 
            scrollSpeed: 50,
            revert: 'invalid',
            revertDuration: 0,
            cursor: 'pointer',
            start: function(event, ui){
            },
            stop: function(event, ui){
            }
    });

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
    $('#map>div>.entry').draggable('disable');
    $('#edit-btn').removeClass('hide');
    $('#edit-btn').attr('editmode', 0);
    $('#cancel-btn, #save-btn').addClass('hide');

    //trap to ask before cancelling
    //code to revert the changes??

});
