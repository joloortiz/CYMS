
$(document).ready(function(){


//Initialize the dropppables and draggables
resetdragevent();
init_data_content();
init_draggables_on_map();
init_droppable_top();
init_occupied_droppable();



function resetdragevent(){

    $( "#pending .panel-body" ).droppable({
        out: function(event,ui){
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
    $( "#map .dp" ).droppable({
        drop: function(event, ui) {

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

                init_data_content();
                init_droppable_top();  
                if($('#edit-btn').attr('editmode') == 1){
                    init_draggable_bottom();
                    console.log('edit mode');
                }else{
                    $('#' + draggable).draggable('disable');
                }
                init_occupied_droppable();
                
            }, 10);
            
        }
    });

    $( ".entry" ).draggable({ 
            revert: 'invalid',
            revertDuration: 0,
            cursor: 'pointer',
            helper: 'clone',
            start: function(event, ui){
            },
            stop: function(event, ui){
            }
    });


}

$('#edit-btn').click(function(){
    $('#map>div>.entry').draggable('enable');
    init_draggable_bottom();
    $(this).addClass('hide');
    $(this).attr('editmode', 1);
    $('#cancel-btn, #save-btn').removeClass('hide');

    //set start data on edit
    set_start_data();

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
*   Functions
*/

function revert(){

    $('#map').find('.entry').each(function(){
        var id = '#' + $(this).attr('id');

        if($(id).attr('data-start-position') != 'pending'){
            var top = $(id).attr('data-start-top');
            var left = $(id).attr('data-start-left');

            $(id).css('top', top);
            $(id).css('left', left);
            $(id).removeAttr('data-start-position');
            $(id).removeAttr('data-start-left');
            $(id).removeAttr('data-start-top');
            
        } else if($(id).attr('data-start-position') == 'pending'){
            $(id).css('top', '0px');
            $(id).css('left', '0px');
            $(id).removeAttr('data-start-position');
            $(id).removeAttr('data-start-left');
            $(id).removeAttr('data-start-top');

            var tempClone = $(id).clone();
            $(id).remove();

            $('#pending .panel-body').append(tempClone);

            $(id).draggable();
        }

    });  
}

/* 
*   Init Functions 
*/

function init_draggables_on_map(){
    $('#map').find('.entry').each(function(){
        $(this).draggable('disable');
        //$('#' + draggable).attr('data-start-position', droppableid);
        //$('#' + draggable).attr('data-start-top', $('#' + droppableid).css('top'));
        //$('#' + draggable).attr('data-start-left', $('#' + droppableid).css('left'));
    });
}

function init_data_content(){
    //erase all the data-content
    $('#map .dp').removeAttr('data-content');

    //set the data-content
    $('#map').find('.entry').each(function(){
        var droppableid = $(this).attr('data-position');
        
        if(droppableid){
            $('#' + droppableid).attr('data-content', $(this).attr('id'));
        }else{
            $('#' + droppableid).removeAttr('data-content');
        }
    });
    return true;
}

function init_occupied_droppable(){
    $('#map').find('.dp').each(function(){
        var droppableid = $(this).attr('id');
        var draggableid = $(this).attr('data-content');
        if(draggableid){
            $('#' + droppableid).droppable({ accept: draggableid });
        }else{
            $('#' + droppableid).droppable({ accept: '.entry' });
        }
    })
    
}

function init_droppable_top(){
    //enable all droppables
    $('#map .dp').droppable('enable');

    //set droppables
    $('#map').find('.dp').each(function(){
        var dpbottomid = $(this).attr('dp-bottom');
        var dpbottomdatacontent = $('#' + dpbottomid).attr('data-content');

        if(dpbottomid && !dpbottomdatacontent){
            $(this).droppable('disable');
        }
    });
}

function init_draggable_bottom(){
    //enable all draggables on map
    $('#map .entry').draggable('enable');

    $('#map').find('.entry').each(function(){
        var droppableid = $(this).attr('data-position');
        var droppabletopid = $('#' + droppableid).attr('dp-top');
        var dptopdatacontent = $('#' + droppabletopid).attr('data-content');

        if(dptopdatacontent){
            $(this).draggable('disable');
            console.log($(this).attr('id'));
        }
    });
}

function set_start_data(){
    $('.entry').each(function(){
        if($(this).attr('data-position') == 'pending'){
            $(this).attr('data-start-position', 'pending');
            $(this).attr('data-start-top', '0px');
            $(this).attr('data-start-left', '0px');
        }else{
            var droppableid = $(this).attr('data-position');

            $(this).attr('data-start-position', $('#' + droppableid).attr('id'));
            $(this).attr('data-start-top', $('#' + droppableid).css('top'));
            $(this).attr('data-start-left', $('#' + droppableid).css('left'));
        }
    });
}

function unset_data_content(droppableid){
    $('#' + droppableid).removeAttr('data-content');
}

function set_data_content(draggableid, droppableid){
    $('#' + droppableid).attr('data-content', draggableid);
}

function get_data_content(droppableid){
    var draggableid = $('#' + droppableid).attr('data-content');

    return draggableid;
}

function set_occupied_droppable(droppableid){
    var draggableid = get_data_content(droppableid);

    if(draggableid){
        $('#' + droppableid).droppable( { accept: draggableid });
    }
}



function unset_occupied_droppable(droppableid){
    $('#' + droppableid).droppable({ accept: '.entry' });
}
    
});