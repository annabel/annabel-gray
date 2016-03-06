$(document).ready ->
  # setIndex()
  animateScroll()
  handleFormSubmit()
  displayWorkInfo()
  $(".text-fill").textfill()


$(window).resize ->
  # setIndex()
  $(".text-fill").textfill()

handleFormSubmit = ->
  $('#contact-form').on 'submit', (e) ->
    e.preventDefault()
    $('.error-message, .message-success').empty()
    
    request = $.ajax
      type: 'POST'
      url: '/send_message'
      dataType: 'json'
      data: $(this).serialize()

    request.done (response) ->
      $('.message-success').text('Message sent. Thanks!').show()
      $('.contact-form-submit').addClass('disabled')

    request.fail (response) ->
      errors = response.responseJSON
      $('.name-error').text(errors.name[0]).show() if errors.name
      $('.email-error').text(errors.email[0]).show() if errors.email
      $('.content-error').text(errors.content[0]).show() if errors.content
      

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
  $('.work-info-button').on 'mousedown touchstart', ->
    $(this).parent().parent().toggleClass('active-button')


if "addEventListener" of document
  document.addEventListener "DOMContentLoaded", (->
    FastClick.attach document.body
    return
  ), false