*** Settings ***
Documentation        Suíte de testes de recebimento de pedido de ajuda

Resource             ../resources/base.resource
Resource    ../resources/pages/help.resource

Test Teardown        Take Screenshot

*** Test Cases ***
Deve rececber uma notificação de pedido de ajuda
  ${admin}        Get Fixture    admin
  ${joao}         Get Fixture    joao

  Reset Student    ${joao}[student][email]

  ${token}            Get Service Token    ${admin}
  ${student_id}       POST New student     ${token}             ${joao}[student]

  POST Question       ${student_id}        ${joao}[question]
  
  Do Login            ${admin}

  Open Notifications
  Notification Should Be    ${joao}[question]

Deve responder com sucesso uma notificação de pedido de ajuda (DESAFIO)
  [Tags]           desafio  

  ${admin}         Get Fixture    admin
  ${carol}         Get Fixture    carol

  Reset Student    ${carol}[student][email]

  ${token}            Get Service Token    ${admin}
  ${student_id}       POST New student     ${token}             ${carol}[student]

  POST Question       ${student_id}        ${carol}[question]
  
  Do Login            ${admin}

  Open Notifications
  Notification Should Be    ${carol}[question]
  Answer Notification       ${admin}[answer]
  Verify Toaster            Resposta enviada com sucesso