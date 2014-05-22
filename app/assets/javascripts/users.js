$(function() {
 $( ".planlist" ).draggable({ grid: [ 200, 200 ] });
 
 $( "#dropplanlist" ).droppable({
  drop: function( event, ui ) {

    var plan = $(ui.draggable).clone();
    $(plan).css('left',0)
    $(plan).css('top',0)
    $(".planmodal").append(plan);
  }
  });
});


