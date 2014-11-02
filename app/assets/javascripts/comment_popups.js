$(document).on('page:change', function() {
  $(".sentence").hover(function(){
    var sentence_number = $(this).data("id") - $(".sentence:first").data("id") + 1
    $(this).after('<sup class="hover-text">' + sentence_number + '</sup>')
  }, function(){
    $('.hover-text').remove();
  })

  $(".sentence").click(function(event){
    $('.popup').remove()
    var sentence = $(this)
    fetchPopup(sentence.data('id'), function(template){
      sentence.after(template)
      listenForComment()
      popupClose()
    })
  })
})

// Get comment functions
function fetchPopup(id, callback) {
  $.ajax({
    url: '/comments/' + id,
  })
  .success(callback)
}

// Post route functions
function listenForComment() {
  $(".comment_form").submit(function(e){
    e.preventDefault()
    submitComment($(this).serialize(), function(data){
      $('.popup').replaceWith(data)
    })
  })
}

function submitComment(args, callback) {
  $.ajax({
    url: '/comments',
    type: 'POST',
    data: args
  })
  .done(callback)
}


function popupClose() {
  $(document).on('keyup', function(key){
    if(key.keyCode === 27) {
      $('.popup').remove()
    }
  })
  $('[data-comment="remove"]').on('click', function(){
    $('.popup').remove()
  })
}
