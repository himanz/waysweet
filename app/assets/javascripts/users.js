$(function() {
 $( ".planlist" ).draggable({ grid: [ 200, 200 ] });
 
 $( "#dropplanlist" ).droppable({
  drop: function( event, ui ) {
    $( this )
    alert("Plan Added!");
    var plan = $(ui.draggable).clone();
    $(".planmodal").append(plan);
  }
  });
});



