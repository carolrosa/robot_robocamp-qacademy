*** Settings ***
Documentation        Suite de testes de matrícula de alunos
...                  Administrador uma vez logado consegue matricular alunos na academia

Resource             ../resources/base.resource

*** Test Cases ***
Deve matricular um aluno
  ${admin}    Create Dictionary
  ...         name=Admin
  ...         email=admin@smartbit.com
  ...         pass=qacademy

  Do Login    ${admin}
  Go To Enrolls
  Go To Enroll Form
  Select Student        Falcão Não mexer
  Select Plan           Smart
  Fill Start Date       

  Sleep    2

  # ${temp}    Get Page Source
  # Log        ${temp} 