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