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


  $('#button1').click(function() {
    $('#step1').hide();
  });

  $('#button2').click(function() {
    $('#step2').hide();
  });

  $('#button3').click(function() {
    $('#step3').hide();
  });

  $('#button4').click(function() {
    $('#step4').hide();
  });

  $('#button5').click(function() {
    $('#step5').hide();
  });

});