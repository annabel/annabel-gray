$(document).ready ->
  try
    Typekit.load()
  setIndex()
  animateScroll()
  $(".text-fill").textfill()


$(window).resize ->
  setIndex()
  $(".text-fill").textfill()

setIndex = ->
  console.log 'helo'
  $index = $('#index')
  $headline = $('.headline')
  $birdPicture = $('.bird-picture')

  $indexHeight = $(window).height() - 60
  $marginTop = $indexHeight/1.9
  $marginTopPic = $indexHeight/5

  $index.css({"height": $indexHeight})
#  $('.text-fill').css({"height": $indexHeight + 120 + 'px'})
  $headline.css({"margin-top": $marginTop})
  $birdPicture.css({"margin-top": $marginTopPic})
  $('.down-button').css({"margin-top": $indexHeight - 45 + 'px'})


animateScroll = (targetPos) ->
    currentPos = window.pageYOffset || document.documentElement.scrollTop
    distance = Math.abs(currentPos - targetPos)
    speed = 3
    time = distance / speed
    $("body,html").animate
      scrollTop: targetPos
    , time

if "addEventListener" of document
  document.addEventListener "DOMContentLoaded", (->
    FastClick.attach document.body
    return
  ), false