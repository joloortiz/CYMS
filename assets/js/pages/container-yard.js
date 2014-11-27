var popover_timeout;

$(document).ready(function(){


//Initialize the dropppables and draggables
resetdragevent();
init_data_content();
init_draggables_on_map();
init_droppable_top();
init_occupied_droppable();
init_popover();
init_pending_counter(pending_count());

update_empty_van_list();

$('.modal').on('shown.bs.modal', function() {
    var prevDisplayModal = Array();
    var prevOrder = 0;
    var order = 0;
    var nextOrder;

    $('.modal.active').each(function() {
        order = parseInt( $(this).data('order') );
        if( order > prevOrder ){
            prevDisplayModal = $(this);
        }

        prevOrder = order;
    });

    nextOrder = prevDisplayModal.length == 1 ? parseInt( prevDisplayModal.data('order') ) + 1 : 1;

    $(this).data('order', nextOrder);

    $('.modal.active').addClass('hide');
    $('.current-active').removeClass('current-active');


    $(this).removeClass('hide');    // for previously forced hidden modals

    $(this).addClass('current-active');
    $(this).addClass('active');
});

$('.modal').on('hidden.bs.modal', function() {
    var currentOrder = parseInt( $(this).data('order') );
    var nextDisplayModal = Array();

    if( $(this).hasClass('current-active') ) {

        currentOrder = currentOrder ? currentOrder : 1;

        if( currentOrder != 1 ) {
            nextDisplayModal = $('.modal.active').filter( function() {
                return $(this).data('order') == (currentOrder - 1);
            });
        }

        if( nextDisplayModal.length == 1 ) {
            nextDisplayModal.removeClass('hide');
            nextDisplayModal.addClass('current-active');
        }

        $(this).removeClass('current-active');
    }

    $(this).removeClass('active');
});


function resetdragevent(){

    $( "#pending .panel-body" ).droppable({
        out: function(event,ui){
            var draggable = ui.draggable[0].id;

            if($('#edit-btn').attr('editmode') == 1){
                $('#' + draggable).attr('data-start-position', 'pending')
            }
            init_pending_counter(pending_count()-2);
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
                init_pending_counter(pending_count());
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


/* 
*   Event Listeners
*/




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

        if(iteration == save_success_count) {
            init_data_content();
            init_droppable_top();
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

$('#empty-vans').on('click', '.empty-van-no', function(event) {
    event.preventDefault();

    var card_id = $(this).data('card');

    focus_card_on_layout( card_id );
});

$('#dwell-time-monitor').on('click', '.dwell-time-van-no', function(event) {
    event.preventDefault();

    var card_id = $(this).data('card');

    focus_card_on_layout( card_id );
});
    
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
                $('#' + dataposition).removeAttr('data-content');
                returnflag = true;
                update_pending_count();
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
    var dwell_time = $('#' + draggableid).attr('dayspan') || 'No details found.';
    var position = $('#' + draggableid).attr('data-position') || 'pending';
    var dispatch = $('#' + draggableid).attr('data-dispatch');
    var top = parseInt($('#' + draggableid).css('top').substring(0, $('#' + draggableid).css('top').length - 2));
    var left = parseInt($('#' + draggableid).css('left').substring(0, $('#' + draggableid).css('left').length - 2));

    var position_str = position != 'pending' ? '<br />Position: ' + position : '';
    var dispatch_str = dispatch == 'true' ? '<strong>Ready for dispatch</strong><br /><br />' : '';

    var content_str = dispatch_str + "Van No.: " + binno + "</br>BIN No.: " + vanno + position_str + "<br />Dwell Time: " + dwell_time;


    if(top <= 59 && left < 1381){
        $('#' + draggableid).popover({    
            html: true, 
            placement: 'right', 
            trigger: 'hover',
            content: content_str,
            delay: {show: 300}
        })
    }else if(top <= 59 && left >= 1381){
        $('#' + draggableid).popover({    
            html: true, 
            placement: 'left', 
            trigger: 'hover',
            content: content_str,
            delay: {show: 300}
        })
    }
    else if(left <= 141){
        $('#' + draggableid).popover({    
            html: true, 
            placement: 'right', 
            trigger: 'hover',
            content: content_str,
            delay: {show: 300}
        })
    }else if(left >= 1505){
        $('#' + draggableid).popover({    
            html: true, 
            placement: 'left', 
            trigger: 'hover',
            content: content_str,
            delay: {show: 300}
        })        
    }else {
        $('#' + draggableid).popover({    
            html: true, 
            placement: 'top', 
            trigger: 'hover',
            content: content_str,
            delay: {show: 300}
        })

    }
    //check if top popover doesn't overlap

}

function init_popover(){

    $('#pending').find('.entry').each(function(){
        var binno = $(this).attr('van-no') || 'No details found.';
        var vanno = $(this).attr('bin-no') || 'No details found.';
        var dwell_time = $(this).attr('dayspan') || 'No details found.';
        var position = $(this).attr('data-position') || 'pending';
        var dispatch = $(this).attr('data-dispatch');

        var position_str = position != 'pending' ? '<br />Position: ' + position : '';
        var dispatch_str = dispatch == 'true' ? '<strong>Ready for dispatch</strong><br /><br />' : '';

        $(this).popover({    
            html: true, 
            animation: true,
            placement: 'auto', 
            trigger: 'hover',
            content: dispatch_str + "Van No.: " + binno + "</br>BIN No.: " + vanno + position_str + "<br />Dwell Time: " + dwell_time,
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
            focus_card_on_layout(draggableid);
        }else{
            alert('No results found.');

            return false;
        }
    }else{
        alert('Fill in a search entry.');

        return false;
    }
}

function focus_card_on_layout( card_id ) {

    clearTimeout(popover_timeout);

    $('.entry').not('#'+ card_id).popover('hide');

    var top = parseInt($('#' + card_id).css('top').substring(0, $('#' + card_id).css('top').length - 2));
    var left = parseInt($('#' + card_id).css('left').substring(0, $('#' + card_id).css('left').length - 2));
    var dataposition = $('#' + card_id).attr('data-position');

    if(dataposition == 'pending'){
        $('#' + card_id).popover('show');

    }else{    
        $('#map').animate({
            scrollTop: top - 258,
            scrollLeft: left - 480
        },
            1000,
            function() {

                $('#' + card_id).popover('show');
            
            }
        );

    }

    popover_timeout = setTimeout(function(){$('#' + card_id).popover('hide');},5000);
    return true;
}

//Function to count all the pending tcards
function pending_count() {
    return ($('#pending>.panel-body>div[data-position]').size());
}

//Function to append to the pending counter
function init_pending_counter(count) {
    $('#pending-count').empty();
    $('#pending-count').append(count);
}

function update_pending_count() {
    
    var pending_entries = $('.entry').filter(function() {
        return $(this).attr('data-position') == 'pending';
    });

    $('.pending-counter').text(pending_entries.length);
}

function update_empty_van_list() {
    $.ajax({
        url: $('body').attr('base-url') + 'container_yard/get_empty_vans',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);
            var count;
            var list_str = '';

            $('#empty-van-list').empty();
            $('#empty-count').text('');

            if(decode.success ) {

                if( decode.list ) {

                    count = decode.list.length;

                    $.each(decode.list, function( key, van ) {
                        list_str = '<li><a href="#" class="empty-van-no" data-card="'+ van.tc_id +'">'+ van.v_no +'</a></li>';


                        $('#empty-van-list').append(list_str);
                    });

                }
                
                $('#empty-count').text(count);
            }
        }
    });
}

//Function to append date and time on the footer
function append_datetime() {

    $('.footer-datetime-greeting .date-time').empty();
    $('.footer-datetime-greeting .date-time').append(now().date + ", " + now().time)

} 

//Function to append the greeting on the footer
function append_greeting() {

    var current_user = get_current_user();

    var greeting = 'Hello, ' + current_user.u_username;

    $('.footer-datetime-greeting .greeting').append(greeting);

}

function append_total_teu() {

    var total_teu = get_total_teu();

    $('.total-teu .label').empty();

    $('.total-teu .label').append(total_teu[0].TEU);

    if($('.total-teu .label').is(':empty')) {

        $('.total-teu .label').append('0');

    }

}

function append_total_vans() {

    var vans = get_total_by_van_type();

    $('.total-40-ftr .label').empty();
    $('.total-20-ftr .label').empty();
    $('.total-10-ftr .label').empty();

    for(var i = 0; i < vans.length; i++) {

        $('.total-' + vans[i].vt_name +'-ftr .label').append(vans[i].vans);

    }

    if($('.total-40-ftr .label').is(':empty')) {

        $('.total-40-ftr .label').append('0');

    }

    if($('.total-20-ftr .label').is(':empty')) {

        $('.total-20-ftr .label').append('0');

    }

    if($('.total-10-ftr .label').is(':empty')) {

        $('.total-10-ftr .label').append('0');

    }
    
}

function append_total_tcard_types() {

    var vans = get_total_by_tcard_type();
    var types = get_types();

    $('#tcard-types-counter .panel-body ul li').empty();

    for(var i = 0; i < types.length; i++) {

        $('#tcard-types-counter .panel-body ul').append('<li data-ttid="' + types[i].tt_id + '">' + types[i].tt_name + '<span class="label label-info pull-right">0</span></li>');

    }

    for(var i = 0; i < vans.length; i++) {

        $('#tcard-types-counter .panel-body ul li[data-ttid="' + vans[i].tt_id + '"] span').empty();
        $('#tcard-types-counter .panel-body ul li[data-ttid="' + vans[i].tt_id + '"] span').append(vans[i].vans);

    }

}

function append_dwell_time_monitor() {

    var vans = get_dwell_time_list();

    $('#dwell-time-monitor .panel-body ul').empty();

    for(var i = 0; i < vans.length; i++) {

        $('#dwell-time-monitor .panel-body ul').append('<li><a href="#" class="dwell-time-van-no" data-card="' + vans[i].tc_id + '">' + vans[i].v_no + '</a><span class="pull-right label label-danger">' + vans[i].dwell_time + '</span></li>');

    }

}

/*
*
* CY INITS
*
*/

/*
*
* Initialization after saving on cy-tcard.js line 570
*
*/

append_total_teu();
append_total_vans();
append_total_tcard_types();
append_dwell_time_monitor()

/*
*
* AJAX Functions
*
*/

function get_total_teu(){

    var data = [];

    $.ajax({
        url: $('body').attr('base-url') + 'container_yard/get_total_teu',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;

}

function get_total_by_van_type() {

    var data = [];

    $.ajax({
        url: $('body').attr('base-url') + 'container_yard/get_total_by_van_type',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;

}

function get_total_by_tcard_type() {

    var data = [];

    $.ajax({
        url: $('body').attr('base-url') + 'container_yard/get_total_by_tcard_type',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;

}

function get_types() {

    var data = [];

    $.ajax({
        url: $('body').attr('base-url') + 'container_yard/get_types',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;

}

function get_dwell_time_list() {

    var data = [];

    $.ajax({
        url: $('body').attr('base-url') + 'container_yard/get_dwell_time_list',
        type: 'POST',
        async: false,
        success: function (response) {
            var decode = jQuery.parseJSON(response);

            data = decode;
        }
    });

    return data;

}