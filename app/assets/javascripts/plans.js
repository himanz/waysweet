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

  $(function() {
    $( "#slider1" ).slider({
      range: "min",
      value:50,
      min: 0,
      max: 100,
      step: 5,
      slide: function( event, ui ) {
        $( "#priceslider" ).val( "$" + ui.value );
        $( "#priceslider" ).html( "$" + ui.value );
      },
      change: function(event, ui ) {
        $("#price").val(ui.value);
        console.log(ui.value); 
      } 
    });
  });

  $(function() {
    $( "#slider2" ).slider({
      range: "min",
      value:300,
      min: 0,
      max: 600,
      step: 50,
      slide: function( event, ui ) {
        $( "#minuteslider" ).val( "$" + ui.value );
        $( "#minuteslider" ).html( "$" + ui.value );
      },
      change: function(event, ui ) {
        $("#minute").val(ui.value);
        console.log(ui.value); 
      } 
    });
  });

  $(function() {
    $( "#slider3" ).slider({
      range: "min",
      value:1000,
      min: 0,
      max: 4000,
      step: 500,
      slide: function( event, ui ) {
        $( "#dataslider" ).val( "$" + ui.value );
        $( "#dataslider" ).html( "$" + ui.value );
      },
      change: function(event, ui ) {
        $("#data").val(ui.value);
        console.log(ui.value); 
      } 
    });
  });  

  $(function() {
    $( "#slider4" ).slider({
      range: "min",
      value:200,
      min: 0,
      max: 600,
      step: 100,
      slide: function( event, ui ) {
        $( "#textslider" ).val( "$" + ui.value );
        $( "#textslider" ).html( "$" + ui.value );
      },
      change: function(event, ui ) {
        $("#text").val(ui.value);
        console.log(ui.value); 
      } 
    });
  });  

});

