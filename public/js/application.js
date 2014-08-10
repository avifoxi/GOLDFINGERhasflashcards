console.log('hi')
$(document).ready(function() {

	$("#loginButt").click(function(event){
		event.preventDefault();
		$("form#loginForm").fadeIn( "slow", function() {
	  });
	});

	$(".away").click(function(event){
		event.preventDefault();
		$("form").fadeOut( "slow", function() {
	  });
	})

	$("form#loginForm").submit(function(event){
		event.preventDefault();
        //send an ajax request to our action
    $.ajax({
      url: "/login",
      type: "POST",
      //serialize the form and use it as data for our ajax request
      data: $(this).serialize(),
      //the type of data we are expecting back from server, could be json too
      dataType: "html",
      success: function(data) {
        //if our ajax request is successful, replace the content of our viz div with the response data
        
        console.log(data);
        
        $('.navigation').html(data);
        // $('#nav').remove();
        // $();
        
      }
    });

	})

	$("#signinButt").click(function(event){
		event.preventDefault();
		$("form#signupForm").fadeIn( "slow", function() {
	  });
	});

	$("form#signupForm").submit(function(event){
		event.preventDefault();
		$.ajax({
      url: "/signup",
      type: "POST",
      //serialize the form and use it as data for our ajax request
      data: $(this).serialize(),
      //the type of data we are expecting back from server, could be json too
      dataType: "html",
      success: function(data) {
        //if our ajax request is successful, replace the content of our viz div with the response data
        
        console.log(data);
        
        $('.navigation').html(data);
        // $('#nav').remove();
        // $();
        
      },
    });

		$("form#signupForm").fadeOut( "slow", function() {
			
	  });
	})	


});
