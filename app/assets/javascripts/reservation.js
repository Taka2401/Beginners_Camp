$(document).on("turbolinks:load", function() {
  $('.datepicker').datetimepicker({
    format: 'YYYY-MM-DD HH:mm',
    minDate: moment()
  });
});
