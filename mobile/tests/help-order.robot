*** Settings ***
Documentation        Suíte de testes de pedido de ajuda

Resource    ../resources/base.resource

Test Setup        Start App
Test Teardown     Finish App


*** Test Cases ***
Deve poder solicitar ajuda
  ${admin}      Get Fixture    admin
  ${carol}      Get Fixture    carol

  Reset Student       ${carol}[student][email]
  
  ${token}            Get Service Token    ${admin}
  ${student_id}       POST New Student     ${token}        ${carol}[student]
  POST New Enroll    ${token}              ${student_id}

  Login With Student Id        ${student_id}
  Confirm Popup
  Go To Help Order
  Submit Help Order            ${carol}[help]
  Wait Until Page Contains     Recebemos a sua dúvida. Agora é só aguardar até 24 horas para receber o nosso feedback.
