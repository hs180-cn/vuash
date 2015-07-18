# language: pt

Funcionalidade: Ler uma mensagem

  Para ler uma mensagem
  Como destinatário
  Eu quero ter acesso ao seu conteúdo

  Contexto: Existe uma mensagem
    Dado que existe uma mensagem com o texto 'O Segredo'

  Cenário: Ler uma mensagem nova
    Dado que eu estou na página de leitura da mensagem
    Quando eu clicar em "Ler mensagem"
    Então eu verei o texto 'O Segredo'
