// Updates firebase database on search submit

$(document).ready(function() {

  var url = "https://sizzling-fire-5831.firebaseio.com";

  var firebaseRef = new Firebase(url);

  function funct1()
  {
    var price = $('#price').val();
    var minute = $('#minute').val();
    var data = $('#data').val();
    var text = $('#text').val();
    var date = Date();

    // firebaseRef.set({Price: price, Date: date});
    var postRef = firebaseRef.push(); // create a new post
    postRef.set({Price: price, Minute: minute, Data: data, Text: text, Date: date});
  }

  $('.search-submit').click(function() {
  	funct1();
  });

  $('.searchrow').hide();
  $('#step2').hide();



  // Button navigation for home page
  $('#button1').click(function() {
    $('#step1').hide();
    $('.homedesc').hide();
    $('.homestory').hide();
    $('#step2').show();
    $('.searchrow').show();

  });

  $('#buttonback2').click(function() {
    $('#step2').hide();
    $('.searchrow').hide();
    $('#step1').show();
    $('.homestory').show();
    $('.homedesc').show();
  });

  $(function() {
    // Sets default values
    $("#priceslider").val(50);
    $("#price").val(50);   
    $(".price-text").text("$" + 50);

    $( "#slider1" ).slider({
      range: "min",
      value:50,
      min: 0,
      max: 100,
      step: 5,
      slide: function( event, ui ) {
        $( "#priceslider" ).val(ui.value);
        $( ".price-text" ).text("$" + ui.value);
      },
      change: function(event, ui ) {
        $("#price").val(ui.value);
      } 
    });
  });

  $(function() {
    // Sets default values
    $("#minuteslider").val(300);
    $("#minute").val(300);   
    $( ".minute-text" ).text(300);
    
    $( "#slider2" ).slider({
      range: "min",
      value:300,
      min: 0,
      max: 1050,
      step: 50,
      slide: function( event, ui ) {
        $( "#minuteslider" ).val(ui.value );
        if ($( "#minuteslider").val() == 1050 ) {
          $( ".minute-text").text("Unlimited") 
        } else {
          $( ".minute-text" ).text(ui.value);  
        }   
      },
      change: function(event, ui ) {
        $("#minute").val(ui.value);
      } 
    });
  });

  $(function() {
    // Sets default values
    $("#dataslider").val(1000);
    $("#data").val(1000);  
    $( ".data-text" ).text(1 + " GB");
    
    $( "#slider3" ).slider({
      range: "min",
      value:1000,
      min: 0,
      max: 6500,
      step: 500,
      slide: function( event, ui ) {
        $( "#dataslider" ).val(ui.value);
        if ($( "#dataslider").val() == 6500 ) {
          $( ".data-text").text("Unlimited") 
        } else {
          $( ".data-text" ).text(ui.value / 1000 + " GB");  

        }      
      },
      change: function(event, ui ) {
        $("#data").val(ui.value);
      } 
    });
  });  

  $(function() {
    // Sets default values
    $("#textslider").val(500);
    $("#text").val(500);   
    $( ".text-text" ).text(500);

    $( "#slider4" ).slider({
      range: "min",
      value:500,
      min: 0,
      max: 2600,
      step: 100,
      slide: function( event, ui ) {
        $( "#textslider" ).val(ui.value );
        if ($( "#textslider").val() == 2600 ) {
          $( ".text-text").text("Unlimited") 
        } else {
          $( ".text-text" ).text(ui.value);  
        } ;
      },
      change: function(event, ui ) {
        $("#text").val(ui.value);
      } 
    });
  });  
  


  $(this).on("mouseenter", '.realTimeSearch', function() {
    $( this ).fadeOut( 100 );
    $( this ).fadeIn( 500 );
  });

  $("body").on('click', ".save-plan", function() {
    $(this).hide();
    $(this).closest(".new_save_plan").append("<input type='button' value='SAVED' class='button tiny saved-button'>");
    $(this).closest(".new_save_plan").find(".saved-button").prop('disabled', true);
  });

  $("#minuteslider").hide();
  $("#dataslider").hide();
  $("#textslider").hide();
  $("#priceslider").hide();

});

// Replacing Carriers with logos

carrier

// if ($(.carrier).text()== "Rogers"){
//   Robbers
// } else {
//   Nothing
// }
// });

