$(function() {
 $( ".planlist" ).draggable({ grid: [ 200, 200 ] });
 
 $( "#dropplanlist" ).droppable({
  drop: function( event, ui ) {
    $( this )
    alert("Plan Added!");

  }
});
});


$( "#tooltip" ).click(function() {
    console.log("test")
  });

