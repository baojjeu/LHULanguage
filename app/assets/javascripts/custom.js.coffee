$ ->


  $('.alert').delay(500).fadeIn "normal", ->
    $(this).delay(3000).fadeOut()

  # show demand page
  $(".applicant-avatar").tooltip
    placement: "bottom"

  $('.index-demand-language').tooltip
    placement: "right"

  $('.author').tooltip
    placement: 'right'

  # Profile page and new demand page
  $(".exp-langs, .demand-language, .determine-demand").imagepicker
    show_label: false

  $('.determine-demand').imagepicker
    show_label: true

  # http://api.jquery.com/jquery.each/
  # Show demand page
  $.each $('.check-time').find('input:checkbox'), (k, v) ->
    if v.checked
      $(v).parent('.check-time').addClass 'select'


  $('.check-time').click (e) ->
    # get checkbox itself
    chk = $(this).find('input:checkbox').get(0)

    if e.target != chk
      chk.checked = !chk.checked
      if chk.checked
        $(this).addClass 'select'
      else
        $(this).removeClass 'select'


  # show user page
  # http://stackoverflow.com/questions/4904938/link-entire-table-row
  $('.show-user-demand').click ->
    window.location = $(this).find('a').attr('href')

  $('.empty-demands').remove()
