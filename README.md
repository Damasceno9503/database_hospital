# Database_Hospital

## Estrutura do banco de dados

<img src="">

### especialidade
Cada médico pode ter até duas especialidades, sendo elas pediatria, clínica geral, gastroenterologia e dermatologia.

### medico
Os médicos precisam informar se são generalistas, especialistas ou residentes juntamente com seus dados pessoais que são nome completo, CPF, data de nascimento, CRM, UF dos estado, UF do município, área de atuação, especialidade, número para contato.

### paciente
Os pacientes precisam informar nome, data de nascimento, endereço, telefone, e-mail, CPF, RG e se possui convênio.

### convenio
O convênio precisa informar o seguintes dados: nome, CNPJ e tempo de carência.

### consultas
As consultas precisam dos seguintes dados data e hora da consulta, médico responsável, paciente, valor da consulta ou nome do convênio, com o número da carteira e a especialidade buscada pelo paciente.

### receita
Na receita será guardada os medicamentos receitados, a quantidade e instruções de uso.
