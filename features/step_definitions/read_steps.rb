Dado(/^que existe uma mensagem com o texto 'O Segredo'$/) do
  @message = Message.create(data: 'U2FsdGVkX1/GP50PfIVdltOgrp219w1lWUMdTj+ArqY=')
end

Dado(/^que eu estou na página de leitura da mensagem$/) do
  visit message_path(@message, anchor: 'b632744e-5140-4ae0-a0c1-a9b1969aa594')
end

Então(/^eu verei o texto 'O Segredo'$/) do 
  expect(page).to have_content('O Segredo')
end
