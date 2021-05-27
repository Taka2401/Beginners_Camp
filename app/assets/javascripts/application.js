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
//= require turbolinks
//= require jquery.bgswitcher
//= require jquery.raty.js
//= require moment
//= require moment/ja.js
//= require tempusdominus-bootstrap-4.js
//= require_tree .

document.addEventListener("turbolinks:load", function() {
  $(document).ready(function () {
    $("#slider").skippr({
      // スライドショーの変化 ("fade" or "slide")
      transition : 'slide',
      // 変化に係る時間(ミリ秒)
      speed : 1000,
      // easingの種類
      easing : 'easeOutQuart',
      // ナビゲーションの形("block" or "bubble")
      navType : 'block',
      // 子要素の種類('div' or 'img')
      childrenElementType : 'div',
      // スライドショーの自動再生(falseで自動再生なし)
      autoPlay : true,
      // 自動再生時のスライド切替間隔(ミリ秒)
      autoPlayDuration : 3000,
      // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
      hidePrevious : false
    });
  
    $('#post_image').on('change', function (e) {
      var reader = new FileReader();
      reader.onload = function (e) {
          $("#preview").attr('src', e.target.result);
      }
      reader.readAsDataURL(e.target.files[0]);
    });
  
    $('select').change(function () {
      var selectedValue = $(this).val()
      if (selectedValue === '１泊２日') {
        const changedfee = Number($('#fee')[0].innerText.replace('¥', '')) / 2;
        $('#fee')[0].innerText = `¥${changedfee}`;
      } else if(selectedValue === '２泊３日') {
        const changedfee = Number($('#fee')[0].innerText.replace('¥', '')) * 2;
        $('#fee')[0].innerText = `¥${changedfee}`
      }
    })
  
    $('select').change(function () {
      var selectedValue = $(this).val()
      if (selectedValue === '１泊２日') {
        const changedfee = Number($('#total_fee')[0].innerText.replace('¥', '')) / 2;
        $('#total_fee')[0].innerText = `¥${changedfee}`;
      } else if(selectedValue === '２泊３日') {
        const changedfee = Number($('#total_fee')[0].innerText.replace('¥', '')) * 2;
        $('#total_fee')[0].innerText = `¥${changedfee}`
      }
    })
  });
})


















