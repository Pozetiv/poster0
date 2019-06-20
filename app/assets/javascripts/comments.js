$(document).on('turbolinks:load', function () {
  $("#reply_button").click(function () {
    $(this).next().toggle('slow');
  });
})