$(document).on 'submit', '.new_message', ->
  secret = UUID()
  body = $('textarea').val()
  encrypted = CryptoJS.AES.encrypt(body, secret)

  $('#message_data').val(encrypted)

  this.action += "##{secret}"

$(document).on 'decrypt', (ev, data)->
  secret = location.hash.slice(1)
  decrypted = CryptoJS.AES.decrypt(data, secret)

  $('pre.message').text(decrypted.toString(CryptoJS.enc.Utf8))

$(document).on 'submit', '.edit_message', ->
  this.action += location.hash

$(document).on 'hash', (ev, url) ->
  $('input.share-link').val(url + location.hash)

$(document).on 'click', 'input.share-link', ->
  this.select()
