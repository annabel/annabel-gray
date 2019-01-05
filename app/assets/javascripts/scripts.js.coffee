$(document).ready ->
  # setIndex()
  animateScroll()
  displayWorkInfo()
  $(".text-fill").textfill()


$(window).resize ->
  # setIndex()
  $(".text-fill").textfill()

setIndex = ->
  $index = $('#index')
  $navHeight = $('.navbird').height()
  $indexHeight = $(window).height() - $navHeight
  $index.css({"height": $indexHeight})


animateScroll = (targetPos) ->
    currentPos = window.pageYOffset || document.documentElement.scrollTop
    distance = Math.abs(currentPos - targetPos)
    speed = 3
    time = distance / speed
    $("body,html").animate
      scrollTop: targetPos
    , time

displayWorkInfo = ->
  $('.work-info-button').on 'click', ->
    $(this).parent().parent().toggleClass('active-button')


if "addEventListener" of document
  document.addEventListener "DOMContentLoaded", (->
    FastClick.attach document.body
    return
  ), false
