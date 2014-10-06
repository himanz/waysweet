$(function() {
 $( ".planlist" ).draggable({ grid: [ 200, 200 ] });
 $( ".planlist" ).draggable ({ containment: ".pcontain" });
 $( "#dropplanlist" ).droppable({
  drop: function( event, ui ) {

    var plan = $(ui.draggable).clone();
    $(plan).css('left',0)
    $(plan).css('top',0)
    $(".planmodal").append(plan);
  }
  });
});

$(document).ready(function(){

$('.user_plans_info').hide();

  $('.user_plans_carrier').hover(function(){
    $(this).append ($('.user_plans_info'));
  });
});
