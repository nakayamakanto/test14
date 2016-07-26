ready = ->
  $(".my-file-box").each ->
    formWidth = $(this).width()
    $(this).find(".my-file-input").each ->
      $(this).css "margin-left", getNewInputMargin($(this), formWidth)

  $(window).scroll ->
    element = $('.page-top-btn')
    visible = element.is(':visible')
    height = $(window).scrollTop()
    if height > 300
      element.fadeIn() if !visible
    else
      element.fadeOut()

  $(document).on 'click', '#move-page-top', ->
    $('html, body').animate({ scrollTop: 0 }, 'slow')

  $(window).resize(resizeFormInputs).triggerHandler "resize"

  $(document).resizeFormInputs
  resizeFormInputs
  console.log('done');

getNewInputMargin=(el, formWidth) ->
  mymargin = (formWidth - 210)/2

resizeFormInputs = ->
  $(".my-file-box").each ->
    formWidth = $(this).width()
    $(this).find(".my-file-input").each ->
      $(this).css "margin-left", getNewInputMargin($(this), formWidth)

$(document).ready(ready)
$(document).on('page:load', ready)
$(document).on('page:change', resizeFormInputs)