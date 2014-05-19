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
    // Sets default values
    $("#priceslider").val( "$" + 50);
    $("#price").val(50);   

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
      } 
    });
  });

  $(function() {
    // Sets default values
    $("#minuteslider").val(300);
    $("#minute").val(300);   

    $( "#slider2" ).slider({
      range: "min",
      value:300,
      min: 0,
      max: 600,
      step: 50,
      slide: function( event, ui ) {
        $( "#minuteslider" ).val(ui.value );
        $( "#minuteslider" ).html(ui.value );
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

    $( "#slider3" ).slider({
      range: "min",
      value:1000,
      min: 0,
      max: 4000,
      step: 500,
      slide: function( event, ui ) {
        $( "#dataslider" ).val(ui.value);
        $( "#dataslider" ).html(ui.value);
      },
      change: function(event, ui ) {
        $("#data").val(ui.value);
      } 
    });
  });  

  $(function() {
    // Sets default values
    $("#textslider").val(200);
    $("#text").val(200);   

    $( "#slider4" ).slider({
      range: "min",
      value:200,
      min: 0,
      max: 600,
      step: 100,
      slide: function( event, ui ) {
        $( "#textslider" ).val(ui.value );
        $( "#textslider" ).html(ui.value );
      },
      change: function(event, ui ) {
        $("#text").val(ui.value);
      } 
    });
  });  
  
  // When clicking on real time searches, it will modify the search query to match the click
  $(this).on("click", '.realTimeSearch', function() {
    var selectPrice = $(this).find('.displayPrice').html(); 
    selectPrice = selectPrice.replace( /[^\d.]/g, '' );
    $("#priceslider").val( "$" + selectPrice);
    $("#price").val(selectPrice);
    $("#slider1").slider("option", "value", selectPrice);

    var selectMinute = $(this).find('.displayMinute').html();
    selectMinute = selectMinute.replace( /[^\d.]/g, '' );
    $("#minuteslider").val(selectMinute);
    $("#minute").val(selectMinute);
    $("#slider2").slider("option", "value", selectMinute);

    var selectData = $(this).find('.displayData').html();
    selectData = selectData.replace( /[^\d.]/g, '' );
    $("#dataslider").val(selectData);
    $("#data").val(selectData);
    $("#slider3").slider("option", "value", selectData);

    var selectText = $(this).find('.displayText').html();
    selectText = selectText.replace( /[^\d.]/g, '' );
    $("#textslider").val(selectText);
    $("#text").val(selectText);
    $("#slider4").slider("option", "value", selectText);
  });

});

