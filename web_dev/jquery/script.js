$("button").mouseover(function(){
	$("button").html("Click me! You know you want to!");


	// for (var i = 0; i <= 2; i++) {
	// 	$("img").animate({
	// 		height: '100%',
	// 		width: '100%',
	// 		opacity: '0.5'
	// 	});
	// 	$("img").animate({
	// 		height: '175px',
	// 		width: '284px',
	// 		opacity: '1.0'
	// 	});
	// }
});

$("button").click(function(){
	if ($(":text").val() != "") {
		$("div#image").html('<img src="iguana_rev.jpg" alt="reverse iguana" id="iguana">');
		for (var i = 0; i <= 2; i++) {
			$("img").animate({
				height: '100%',
				width: '100%',
				opacity: '0.5'
			});
			$("img").animate({
				height: '175px',
				width: '284px',
				opacity: '1.0'
			});
		}
		$("li:first-child").css('color','white');
		$("body").css('background-color','lightpink');
		$("#party").html("Let's party!");
		
	} else {
		window.alert("You have to talk to me before we can party!");
	}
});