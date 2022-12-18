*** Settings ***
Documentation        Suíte de testes de recebimento de pedido de ajuda

Resource             ../resources/base.resource

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