$( document ).ready(function() {
  $(".dropdown.open").on('click', function() {
    $(".dropdown-menu").toggle()
    $.ajax({
      url: '/notifications',
      type: 'POST',
    })
    .success(function() {
      console.log("success");
    });
  })
});
