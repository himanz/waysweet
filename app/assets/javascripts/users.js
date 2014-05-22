$(function() {
 $( ".planlist" ).draggable({ grid: [ 200, 200 ] });
 
 $( "#dropplanlist" ).droppable({
  drop: function( event, ui ) {
    $( this )
    alert("Plan Added!");
    var plan = $(ui.draggable).clone();
    $(plan).css('left',0)
    $(".planmodal").append(plan);
  }
  });
});



