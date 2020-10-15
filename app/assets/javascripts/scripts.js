function setIndex() {
  var $index = $('#index');
  var $navHeight = $('.navbird').height();
  var $indexHeight = $(window).height() - $navHeight;
  $index.css({ 'height': $indexHeight });
};

function displayWorkInfo() {
  $('.work-info-button').on('click', function() {
    $(this).parent().parent().toggleClass('active-button');
  });
};

$(document).ready(function () {
  displayWorkInfo();
});
