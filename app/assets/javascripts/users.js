$(function() {
 $( ".planlist" ).draggable({ grid: [ 200, 200 ] });
 
 $( "#dropplanlist" ).droppable({
  drop: function( event, ui ) {
    $( this )
    console.log(ui.draggable)
    alert("Plan Added!");
    var plan = $(ui.draggable).clone();
    $(".planmodal").append(plan);
  }
  });
});



