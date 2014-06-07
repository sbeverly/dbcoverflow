// ##this will append the "comemnt" form on either question
// or answer

$(document).ready() {
	$('#question_comment_link').on('click', function(e){
		e.preventDefault();

		// ##grab the form partial from the comment controller 
		$.ajax({
			url: '/comments_controller/new'
			method: 'GET'
		}).done(function(response) {
		// ##somehow grab that form partial and append it to 
		// the end of the question div
			$('#question div').append(response)
		})
	})

	$('#answer_comment_link').on('click', function(e) {
		e.preventDefault();

		$.ajax({
			url: '/comments_controller/new'
			method: 'GET'
		}).done(function(response) {
			$('#answer div').append(response)
		})
	})
}



