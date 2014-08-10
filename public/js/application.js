console.log('hi')
$(document).ready(function() {

	$("#loginButt").click(function(event){
		event.preventDefault();
		$("form#loginForm").fadeIn( "slow", function() {
	  });
	});

	$("form#loginForm").submit(function(event){
		event.preventDefault();
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
