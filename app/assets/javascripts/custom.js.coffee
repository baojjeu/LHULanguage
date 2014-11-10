$ ->

  # show demand page
  $(".applicant-link").tooltip
    placement: "bottom"

  # Signup page and new demand page
  $(".exp-langs, .demand-language").imagepicker
    show_label: true


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
