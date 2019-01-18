$(document).on 'submit', '.new_message', ->
  body = $('textarea').val()

  if body is ''
    $('.validation-error').addClass('visible').attr('aria-hidden', false)
    return false

  secret = UUID()
  encrypted = CryptoJS.AES.encrypt(body, secret)

  $('#message_data').val(encrypted)

  this.action += "##{secret}"


$(document).on 'decrypt', (ev, data) ->
  secret = location.hash.slice(1)
  decrypted = CryptoJS.AES.decrypt(data, secret)

  $('pre.message').text(decrypted.toString(CryptoJS.enc.Utf8))

  if $('pre.message').is(':empty')
    $('pre.message').remove()
    $('.wrong-key').attr('aria-hidden', 'false').show()


$(document).on 'submit', '.edit_message', ->
  this.action += location.hash


$(document).on 'hash', (ev, url) ->
  $('.share-link').text(url + location.hash)


$(document).on 'ready', ->
  $('textarea').bind 'input', ->
    max = parseInt($(this).attr('maxlength'))
    current = $(this).val().length
    $('[data-count]').text max - current
