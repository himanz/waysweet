// Updates firebase database on search submit

$(document).ready(function() {

  var url = "https://sizzling-fire-5831.firebaseio.com";

  var firebaseRef = new Firebase(url);

  function funct1()
  {
    var price = $('#price').val();

    var date = Date();

    // firebaseRef.set({Price: price, Date: date});
    var postRef = firebaseRef.push(); // create a new post
    postRef.set({Price: price, Date: date});
  }


  $('.search-submit').click(function() {
  	funct1();
  });

  $('#step2').hide();
  $('#step3').hide();
  $('#step4').hide();
  $('#step5').hide();


  $('#button1').click(function() {
    $('#step1').hide();
    $('#step2').show();
    
  });

  $('#buttonback2').click(function() {
    $('#step2').hide();
    $('#step1').show();
  });

  $('#button2').click(function() {
    $('#step2').hide();
    $('#step3').show();
  });

  $('#button3').click(function() {
    $('#step3').hide();
    $('#step4').show();
  });

  $('#buttonback3').click(function() {
    $('#step3').hide();
    $('#step2').show();
  });

  $('#button4').click(function() {
    $('#step4').hide();
    $('#step5').show();
  });

  $('#buttonback4').click(function() {
    $('#step4').hide();
    $('#step3').show();
  });

  $('#button5').click(function() {
    $('#step5').hide();
  });

  $('#buttonback5').click(function() {
    $('#step5').hide();
    $('#step4').show();
  });
});

$(function() {
    $( "#slider1" ).slider({
      value:50,
      min: 0,
      max: 100,
      step: 5,
      slide: function( event, ui ) {
        $( "#priceslider" ).val( "$" + ui.value );
      }
    });
    $( "#priceslider" ).val( "$" + $( "#slider1" ).slider( "value" ) );
    var slideprice = $( "#priceslider" ).val( "$" + $( "#slider1" ).slider( "value" ) );
  });



$(function() {
    $( "#slider2" ).slider({
      value:300,
      min: 0,
      max: 600,
      step: 50,
      slide: function( event, ui ) {
        $( "#amount2" ).val( ui.value );
      }
    });
    $( "#amount2" ).val($( "#slider2" ).slider( "value" ) );
  });

$(function() {
    $( "#slider3" ).slider({
      value:1000,
      min: 0,
      max: 4000,
      step: 500,
      slide: function( event, ui ) {
        $( "#amount3" ).val( ui.value );
      }
    });
    $( "#amount3" ).val($( "#slider3" ).slider( "value" ) );
  });

$(function() {
    $( "#slider4" ).slider({
      value:200,
      min: 0,
      max: 600,
      step: 100,
      slide: function( event, ui ) {
        $( "#amount4" ).val( ui.value );
      }
    });
    $( "#amount4" ).val($( "#slider4" ).slider( "value" ) );
  });
