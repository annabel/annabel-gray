function setIndex() {
  var $index = $('#index');
  var $navHeight = $('.navbird').height();
  var $indexHeight = $(window).height() - $navHeight;
  $index.css({ 'height': $indexHeight });
};

function animateScroll(targetPos) {
  var currentPos = window.pageYOffset || document.documentElement.scrollTop;
  var distance = Math.abs(currentPos - targetPos);
  var speed = 3;
  var time = distance / speed;
  $('body,html').animate({ scrollTop: targetPos }, time);
};

function displayWorkInfo() {
  $('.work-info-button').on('click', function() {
    $(this).parent().parent().toggleClass('active-button');
  });
};

document.addEventListener('DOMContentLoaded', (function() {
  FastClick.attach(document.body);
}), false);

$(document).ready(function() {
  animateScroll();
  displayWorkInfo();
  $('.text-fill').textfill();
});

$(window).resize(function() {
  $('.text-fill').textfill();
});
