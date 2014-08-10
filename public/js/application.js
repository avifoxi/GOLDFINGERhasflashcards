console.log('hi')
$(document).ready(function() {

	$("#loginButt").click(function(event){
		event.preventDefault();
		$("form#loginForm").fadeIn( "slow", function() {
	  });
	});

	$("form#loginForm").submit(function(event){
		event.preventDefault();
        //send an ajax request to our action
    $.ajax({
      url: "/login",
      type: "POST",
      //serialize the form and use it as data for our ajax request
      data: $(this).serialize(),
      //the type of data we are expecting back from server, could be json too
      dataType: "json",
      success: function(data) {
        //if our ajax request is successful, replace the content of our viz div with the response data
        $('nav').fadeIn('fast');
        console.log(data);
      }
    });
 
		$("form#loginForm").fadeOut( "slow", function() {

	  });
	})

	$("#signinButt").click(function(event){
		event.preventDefault();
		$("form#signupForm").fadeIn( "slow", function() {
	  });
	});

	$("form#signupForm").submit(function(event){
		event.preventDefault();
		$("form#signupForm").fadeOut( "slow", function() {
			
	  });
	})	


});
