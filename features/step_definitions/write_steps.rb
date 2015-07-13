Dado(/^que eu estou na página de nova mensagem$/) do
  visit new_message_path
end

Dado(/^que eu preenchi o corpo da mensagem$/) do
  within '#new_message' do
    fill_in 'message_body', with: 'Isto é um teste.'
  end
end

Quando(/^eu clicar em "(.*?)"$/) do |button|
  click_button button
end

Então(/^eu receberei um link seguro$/) do
  expect(page).to have_selector('input[value]')
end
