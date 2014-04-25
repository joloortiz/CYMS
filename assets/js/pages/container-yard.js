
$(document).ready(function(){


//Initialize the dropppables and draggables
resetdragevent();
init_data_content();
init_draggables_on_map();
init_droppable_top();
init_occupied_droppable();
init_popover();


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
                $('#' + draggable).attr('data-position', 'pending');
                $('#' + draggable).draggable();
                destroy_popover()
                init_popover();
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
                }else{

                    show_loader();
                    var top = $('#' + draggable).css('top');
                    var left = $('#' + draggable).css('left');
                    var dataposition = $('#' + draggable).attr('data-position');
                    var id = $('#' + draggable).attr('id');

                    if(save_position(id, dataposition, top, left)){
                        setTimeout(function(){
                            remove_loader();
                        }, 1000)
                    }

                    $('#' + draggable).draggable('disable');
                }
                init_occupied_droppable();
                destroy_popover();
                init_popover();            
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


$('#save-btn, #cancel-yes').click(function(){
    var iteration = 0;
    var save_success_count = 0;


    //Turn the trapping off
    window.onbeforeunload = null;
    
    show_loader();
    setTimeout(function(){
        $('#map>div>.entry').draggable('disable');
        $('#edit-btn').removeClass('hide');
        $('#edit-btn').attr('editmode', 0);
        $('#cancel-btn, #save-btn').addClass('hide');

        //code to save the edits to the database

        $('#main').find('.entry').each(function() {
            var dataposition = $(this).attr('data-position');
            var datastartposition = $(this).attr('data-start-position');

            if(dataposition != datastartposition){
                var id = $(this).attr('id');
                var dataposition = $(this).attr('data-position');
                if(dataposition != 'pending'){
                    var top = $(this).css('top');
                    var left = $(this).css('left');
                } else {
                    var top = null;
                    var left = null;
                }
                
                iteration = iteration + 1;

                if(save_position(id, dataposition, top, left)) {
                    save_success_count = save_success_count + 1;
                }
            }

        });

        console.log('iteration: ' + iteration);
        console.log('success count: ' + save_success_count);

        if(iteration == save_success_count) {
            remove_loader();
        }
    }, 1000);
});

$('#cancel-btn').click(function(){

    //trap to ask before cancelling
    //code to revert the changes??

});

/*
$('#cancel-yes').click(function(){
    $('#map>div>.entry').draggable('disable');
    $('#edit-btn').removeClass('hide');
    $('#edit-btn').attr('editmode', 0);
    $('#cancel-btn, #save-btn').addClass('hide');

    //loading chuchu
});*/

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

//Search van number/bin number upon clicking the search button
$('#search-btn').click(function(){
    search_entry();
});

//Search van number/bin number upon hitting enter
$('#search-entry').keydown(function(e) {
    if (e.keyCode == 13) {
        search_entry();
    }
});

/* 
*   Functions
*/

function save_position(id, dataposition, top, left) {
    var returnflag = false;

    $.ajax({
        url: $('body').attr('base-url') + 'container_yard/save_position',
        type: 'POST',
        async: false,
        data: {
            id: id,
            dataposition: dataposition,
            top: top,
            left: left
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

    return returnflag;
}

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

function popover_placement(draggableid){
    var binno = $('#' + draggableid).attr('van-no') || 'No details found.';
    var vanno = $('#' + draggableid).attr('bin-no') || 'No details found.';
    var top = parseInt($('#' + draggableid).css('top').substring(0, $('#' + draggableid).css('top').length - 2));
    var left = parseInt($('#' + draggableid).css('left').substring(0, $('#' + draggableid).css('left').length - 2));


    if(top <= 59 && left < 1381){
        $('#' + draggableid).popover({    
            html: true, 
            placement: 'right', 
            trigger: 'hover',
            content: "Van No.: " + binno + "</br>BIN No.: " + vanno,
            delay: {show: 500}
        })
    }else if(top <= 59 && left >= 1381){
        $('#' + draggableid).popover({    
            html: true, 
            placement: 'left', 
            trigger: 'hover',
            content: "Van No.: " + binno + "</br>BIN No.: " + vanno,
            delay: {show: 500}
        })
    }
    else if(left <= 141){
        $('#' + draggableid).popover({    
            html: true, 
            placement: 'right', 
            trigger: 'hover',
            content: "Van No.: " + binno + "</br>BIN No.: " + vanno,
            delay: {show: 500}
        })
    }else if(left >= 1505){
        $('#' + draggableid).popover({    
            html: true, 
            placement: 'left', 
            trigger: 'hover',
            content: "Van No.: " + binno + "</br>BIN No.: " + vanno,
            delay: {show: 500}
        })        
    }else {
        $('#' + draggableid).popover({    
            html: true, 
            placement: 'top', 
            trigger: 'hover',
            content: "Van No.: " + binno + "</br>BIN No.: " + vanno,
            delay: {show: 500}
        })              
    }
    //check if top popover doesn't overlap

}

function init_popover(){

    $('#pending').find('.entry').each(function(){
        var binno = $(this).attr('van-no') || 'No details found.';
        var vanno = $(this).attr('bin-no') || 'No details found.';

        $(this).popover({    
            html: true, 
            animation: true,
            placement: 'auto', 
            trigger: 'hover',
            content: "Van No.: " + binno + "</br>BIN No.: " + vanno,
            delay: {show: 500}
        });
    });

    $('#map').find('.entry').each(function(){
        var draggableid = $(this).attr('id');

        popover_placement(draggableid);
    });

}

function destroy_popover(){
    $('.entry').each(function(){
        var draggableid = $(this).attr('id');

        $('#' + draggableid).popover('destroy');
    });
}

function search_id(entry){
    var bid = $('html').find('div[bin-no="' + entry + '"]').attr('id');
    var vid = $('html').find('div[van-no="' + entry + '"]').attr('id');

    if(bid){
        return bid;
    }else if(vid){
        return vid;
    }
}

function search_entry(){

    var entry = $('#search-entry').val().toUpperCase();

    if(entry){
        var draggableid = search_id(entry);

        if(draggableid){
            var top = parseInt($('#' + draggableid).css('top').substring(0, $('#' + draggableid).css('top').length - 2));
            var left = parseInt($('#' + draggableid).css('left').substring(0, $('#' + draggableid).css('left').length - 2));
            var dataposition = $('#' + draggableid).attr('data-position');

            if(dataposition == 'pending'){
                $('#' + draggableid).popover('show');

                setTimeout(function(){$('#' + draggableid).popover('hide');},5000);

                return true;
            }else{    
                $('#map').animate({
                    scrollTop: top - 258,
                    scrollLeft: left - 480
                },
                    1000
                );

                $('#' + draggableid).popover('show');

                setTimeout(function(){$('#' + draggableid).popover('hide');},5000);
                return true;
            }
        }else{
            alert('No results found.');

            return false;
        }
    }else{
        alert('Fill in a search entry.');

        return false;
    }
}
    
});