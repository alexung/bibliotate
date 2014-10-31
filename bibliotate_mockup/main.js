var comment_form = '<div class="popup"><div class="dotted"><form><textarea rows="6" name="comment[name]" placeholder="comment"></textarea></div><input id="submit" type="submit" value="Post Comment"><a class="submit_link" href="#">Submit</a></form></div>'


$(document).ready(function() {

	$("span").click(function(){
		var sentence = $(this)
		sentence.prepend(comment_form)
		// $(this).prepend(comment_form)
		// $(this).slide(comment_form)
		popupClose()
	})

})


function popupClose() {
	$(document).on('keyup', function(key){
		if(key.keyCode === 27) {
			$('.popup').remove()
		}
	})	

}







