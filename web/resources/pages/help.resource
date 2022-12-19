*** Settings ***
Documentation        Keywords que representam a página de ajuda e notificações

Library    Browser

*** Keywords ***
Answer Notification
  [Arguments]      ${answer}
  
  Click            css=.scrollbar-container p
  Fill Text        css=textarea[id=answer]
  ...              ${answer}
  Click            css=button >> text=Enviar resposta