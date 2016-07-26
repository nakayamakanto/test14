ready = ->
  $(window).scroll ->
    element = $('.page-top-btn')
    visible = element.is(':visible')
    height = $(window).scrollTop()
    if height > 200
      element.fadeIn() if !visible
    else
      element.fadeOut()
  $(document).on 'click', '#move-page-top', ->
    $('html, body').animate({ scrollTop: 0 }, 'slow')

  getNewInputMargin = (el, formWidth) ->
    mymargin = (formWidth - 210)/2

  resizeFormInputs = ->
    $(".my-file-box").each ->
      formWidth = $(this).width()
      $(this).find(".my-file-input").each ->
        $(this).css "margin-left", getNewInputMargin($(this), formWidth)

  $(window).resize(resizeFormInputs).triggerHandler "resize"

$(document).ready(ready)
$(document).on('page:load', ready)