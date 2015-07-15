Dado(/^que existe uma mensagem com o texto "(.*?)"$/) do |text|
  @message = Message.new(body: text)
  @message.encrypt_body('secret')
  @message.save
end

Dado(/^que eu estou na página de leitura da mensagem$/) do
  visit message_path(@message, secret: 'secret')
end

Então(/^eu verei o texto "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end
