$(document).on('page:change', function() {
  $(".sentence").hover(function(){
    var sentence_number = $(this).data("id") - $(".sentence:first").data("id") + 1
    $(this).after('<sup class="hover-text">' + sentence_number + '</sup>')
    $(this).next().css("margin", "-5px")
  }, function(){
    $('.hover-text').remove();
  })
})