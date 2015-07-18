Dado(/^que eu estou na página de nova mensagem$/) do
  visit messages_path
end

Dado(/^que eu preenchi o corpo da mensagem$/) do
  fill_in 'body', with: 'Isto é um teste.'
end

Quando(/^eu clicar em "(.*?)"$/) do |button|
  click_button button
end

Então(/^eu receberei um link seguro$/) do
  expect(page).to have_selector('input')
end
