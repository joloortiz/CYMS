/*
 * INIT
 */

resetdragevent();



/*
 * EVENT LISTENERS
 */

$("#map").niceScroll({cursorwidth: '8px', cursorcolor: 'rgba(0,0,0,.3)', /*touchbehavior: true*/});

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
    $("#map").getNiceScroll().resize();
    resetdragevent();
});

$('#zoom-in').click(function(){
    var zoom = $('#map').data('zoom');
    zoom += 0.2;
    $('#map').data('zoom', zoom);
    $('#map .panel-body').css({'-webkit-transform': 'scale(' + zoom + ')', '-webkit-transform-origin': '0 0'})
    $("#map").getNiceScroll().resize();
    resetdragevent();
});


/*
 * FUNCTIONS
 */

function resetdragevent(){

    $( "#pending .panel-body" ).droppable({
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
    $( "#map .cv" ).droppable({
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
                $('#' + draggable).draggable();
            }, 10);
            
        }
    });

    $( ".entry" ).draggable({ 
            revert: 'invalid',
            revertDuration: 0,
            cursor: 'pointer',
            start: function(event, ui){
            },
            stop: function(event, ui){
            }
    });
}