
$(document).on("click", ".nav-link", function(e) {
	e.preventDefault();
	var id = $(this).attr('href')
	targetOffset = $(id).offset().top
	$('html, body').animate({
		scrollTop: targetOffset
	}, 400)
	console.log(id);
});
