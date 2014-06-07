$(document).ready() {
	$('#question_comment_link').on('click', function(e){
		e.preventDefault();
		$.ajax({
			url: '/comments_controller/'
		})
	})
}