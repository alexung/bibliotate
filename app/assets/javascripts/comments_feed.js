$(document).on('page:change', function() {
	if( $('[data-card=commentsfeed]').length > 0) {
		ajaxInteveral('commentsfeed')
	}
	if( $('[data-card=mostcommented]').length > 0) {
		ajaxInteveral('mostcommented')
	}
	if( $('[data-card=activeusers]').length > 0) {
		ajaxInteveral('activeusers')
	}
})

// Data card should be the URL and value of the data-card attribute
function ajaxInteveral(dataCard) {
	var storyId = $("[data-card='" + dataCard + "']").data('story')
	setInterval(function(){
		fetchPartial(dataCard, storyId, function(template){
			$("[data-card='" + dataCard + "']").replaceWith(template)
			openComment()
		})
	}, 10000)
}


function fetchPartial(url, id, callback) {
	$.ajax({
	    url: '/stories/' + id + '/' + url,
	  })
	  .success(callback)
}
