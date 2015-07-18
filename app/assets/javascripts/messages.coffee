$(document).on 'submit', 'form', ->
  secret = UUID()
  body = $('#message_body').val()
  encrypted = CryptoJS.AES.encrypt(body, secret)

  $('#message_data').val(encrypted)
  $('#message_body').val('')

  this.action += "##{secret}"

$(document).on 'hash', (ev, url) ->
  $('input.share-link').val(url + location.hash)

$(document).on 'click', 'input.share-link', ->
  this.select()
