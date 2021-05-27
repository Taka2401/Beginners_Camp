document.addEventListener("turbolinks:load", function() {
$(function () {
  $('.datepicker').datetimepicker({
    format: 'YYYY-MM-DD HH:mm',
    minDate: moment()
  });
});
})
