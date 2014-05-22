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

  $(".slider2").slider({
   slide: function(event, ui) { 
       if(ui.value > 600){//Note the value of ui.value is between 0 to 99
          return false;
       }
   }
});

  $(function() {
    // Sets default values
    $("#dataslider").val(1000);
    $("#data").val(1000);  
    $( ".data-text" ).text(1000);
    
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
          $( ".data-text" ).text(ui.value);  
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
  
  // When clicking on real time searches, it will modify the search query to match the click
  $(this).on("click", '.realTimeSearch', function() {
    var selectPrice = $(this).find('.displayPrice').html(); 
    selectPrice = selectPrice.replace( /[^\d.]/g, '' );
    $("#priceslider").val( "$" + selectPrice);
    $("#price").val(selectPrice);
    $("#slider1").slider("option", "value", selectPrice);
    $( ".price-text" ).text("$" + selectPrice);

    var selectMinute = $(this).find('.displayMinute').html();
    selectMinute = selectMinute.replace( /[^\d.]/g, '' );
    if (selectMinute == "") {
      selectMinute = 1050;
    }
    $("#minuteslider").val(selectMinute);
    $("#minute").val(selectMinute);
    $("#slider2").slider("option", "value", selectMinute);
    if (selectMinute == 1050) {
      $( ".minute-text" ).text("Unlimited");
    } else {
      $( ".minute-text" ).text(selectMinute);
    }

    var selectData = $(this).find('.displayData').html();
    selectData = selectData.replace( /[^\d.]/g, '' );
    if (selectData == "") {
      selectData = 6500;
    }
    $("#dataslider").val(selectData);
    $("#data").val(selectData);
    $("#slider3").slider("option", "value", selectData);
    if (selectData == 6500) {
      $( ".data-text" ).text("Unlimited");
    } else {
      $( ".data-text" ).text(selectData);
    }

    var selectText = $(this).find('.displayText').html();
    selectText = selectText.replace( /[^\d.]/g, '' );
    if (selectText == "") {
      selectText = 2600;
    }
    $("#textslider").val(selectText);
    $("#text").val(selectText);
    $("#slider4").slider("option", "value", selectText);
    if (selectText == 2600) {
      $( ".text-text" ).text("Unlimited");
    } else {
      $( ".text-text" ).text(selectText);
    }
  });

  $(".save-plan").on('click', function() {
    $(this).hide();
    $(this).closest(".new_save_plan").append("<input type='button' value='SAVED' class='button tiny saved-button'>");
    $(this).closest(".new_save_plan").find(".saved-button").prop('disabled', true);
  })
  $("#minuteslider").hide();
  $("#dataslider").hide();
  $("#textslider").hide();
  $("#priceslider").hide();

});






