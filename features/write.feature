# language: pt

Funcionalidade: Criar uma mensagem

  Para enviar uma mensagem
  Como remetente
  Eu quero receber um link seguro

  Cenário: Criar uma mensagem
    Dado que eu estou na página de nova mensagem
    E que eu preenchi o corpo da mensagem
    Quando eu clicar em "Criar mensagem"
    Então eu receberei um link seguro
