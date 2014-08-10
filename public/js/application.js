console.log('hi')
$(document).ready(function() {

	$("#loginButt").click(function(event){
		event.preventDefault();
		$("form#loginForm").fadeIn( "slow", function() {
	  });
	});

});
