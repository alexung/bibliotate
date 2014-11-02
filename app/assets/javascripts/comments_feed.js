$(document).on('page:change', function() {
	listenForComments()
})


function listenForComments() {
	setInterval(function() {
		var storyId = $("[data-card='commentsfeed']").data('story')
		fetchComments(storyId, function(template) {
			$("[data-card='commentsfeed']").replaceWith(template)
		})
	}, 10000)
}

function fetchComments(id, callback) {
  $.ajax({
    url: '/stories/' + id + '/commentsfeed',
  })
  .success(callback)
}