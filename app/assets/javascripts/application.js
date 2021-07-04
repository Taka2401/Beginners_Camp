// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require jquery.bgswitcher
//= require jquery.raty.js
//= require moment
//= require moment/ja.js
//= require tempusdominus-bootstrap-4.js
//= require bootstrap
//= require_tree

window.onpageshow = function(event) {
  if (
         event.persisted
      || window.performance && window.performance.navigation.type == 2
  ) {
      window.location.reload(true);
  }
    /*global $*/
    $('#tab-target-1').tab('show');

    $('.bg-slider').bgSwitcher({
      images: ['img/camp_image.10.jpg','img/camp_image.11.jpg','img/camp_image.12.jpg'],
    });

    $(document).ready(function () {
      $("#slider").skippr({
        transition : 'slide',
        speed : 1000,
        easing : 'easeOutQuart',
        navType : 'block',
        childrenElementType : 'div',
        arrows : true,
        autoPlay : true,
        autoPlayDuration : 3000,
        keyboardOnAlways : true,
        hidePrevious : false
      });

    $('#post_image').on('change', function (e) {
      var reader = new FileReader();
      reader.onload = function (e) {
          $("#preview").attr('src', e.target.result);
      };
      reader.readAsDataURL(e.target.files[0]);
    });

     /*global moment*/
     $('.datepicker').datetimepicker({
      format: 'YYYY-MM-DD HH:mm',
      minDate: moment()
    });

    $('select').change(function () {
      var selectedValue = $(this).val();
      if (selectedValue === '１泊２日') {
        const changedfee = Number($('#fee')[0].innerText.replace('¥', '')) / 2;
        $('#fee')[0].innerText = `¥${changedfee}`;
      } else if(selectedValue === '２泊３日') {
        const changedfee = Number($('#fee')[0].innerText.replace('¥', '')) * 2;
        $('#fee')[0].innerText = `¥${changedfee}`;
      }
    });

    $('select').change(function () {
      var selectedValue = $(this).val();
      if (selectedValue === '１泊２日') {
        const changedfee = Number($('#total_fee')[0].innerText.replace('¥', '')) / 2;
        $('#total_fee')[0].innerText = `¥${changedfee}`;
      } else if(selectedValue === '２泊３日') {
        const changedfee = Number($('#total_fee')[0].innerText.replace('¥', '')) * 2;
        $('#total_fee')[0].innerText = `¥${changedfee}`;
      }
    });
  });
};


