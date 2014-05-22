$(function() {
 $( ".planlist" ).draggable({ grid: [ 100, 100 ] });
 $( ".planlist" ).draggable({ containment: "#dropplanlist" });
 $( "#dropplanlist" ).droppable({
  drop: function( event, ui ) {
    $( this )
    alert("Plan Added!");
  }
});
});



