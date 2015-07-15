# language: pt

Funcionalidade: Criar uma mensagem

  Para enviar uma mensagem
  Como remetente
  Eu quero receber um link seguro

  Contexto: Página de nova mensagem
    Dado que eu estou na página de nova mensagem

  Cenário: Criar uma mensagem
    Dado que eu preenchi o corpo da mensagem
    Quando eu clicar em "Criar mensagem"
    Então eu receberei um link seguro
