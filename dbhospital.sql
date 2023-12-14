DROP DATABASE IF EXISTS dbHospital;
CREATE DATABASE IF NOT EXISTS dbHospital;
USE dbHospital;

CREATE TABLE especialidade (
    id_especialidade INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

INSERT INTO especialidade (id_especialidade, nome) VALUES
(1, 'Pediatria'),
(2, 'Clínica Geral'),
(3, 'Gastroenterologia'),
(4, 'Dermatologia');

CREATE TABLE medico (
    id_medico INT PRIMARY KEY,
    nome_completo VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    data_nascimento DATE NOT NULL,
    crm VARCHAR(20) NOT NULL,
    uf_estado VARCHAR(2) NOT NULL,
    uf_municipio VARCHAR(2) NOT NULL,
    qualificacao VARCHAR(50) NOT NULL,
    tipo_profissional VARCHAR(20) CHECK (tipo_profissional IN ('Generalista', 'Especialista', 'Residente')),
    numero_contato VARCHAR(15) NOT NULL
);


CREATE TABLE medico_especialidade (
    id_medico INT,
    id_especialidade INT,
    PRIMARY KEY (id_medico, id_especialidade),
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
    FOREIGN KEY (id_especialidade) REFERENCES especialidade(id_especialidade)
);

CREATE TABLE paciente (
    id_paciente INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(100),
    cpf VARCHAR(14) NOT NULL,
    rg VARCHAR(20) NOT NULL,
    possui_convenio BOOLEAN NOT NULL
);

CREATE TABLE convenio (
    id_convenio INT PRIMARY KEY,
    nome_convenio VARCHAR(100) NOT NULL,
    cnpj_convenio VARCHAR(18) NOT NULL,
    tempo_carencia INT NOT NULL
);

CREATE TABLE consulta (
    id_consulta INT PRIMARY KEY,
    data_hora_consulta DATETIME NOT NULL,
    id_medico INT,
    id_paciente INT,
    valor_consulta DECIMAL(10, 2),
    nome_convenio VARCHAR(100),
    numero_carteira_convenio VARCHAR(50),
    id_especialidade INT,
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
    FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
    FOREIGN KEY (id_especialidade) REFERENCES especialidade(id_especialidade)
);

CREATE TABLE receita (
    id_receita INT PRIMARY KEY,
    id_consulta INT,
    medicamento VARCHAR(255) NOT NULL,
    quantidade INT NOT NULL,
    instrucoes_uso TEXT,
    FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta)
);

CREATE TABLE tipo_quarto (
    id_tipo_quarto INT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    valor_diaria DECIMAL(10, 2) NOT NULL
);

CREATE TABLE quarto (
    id_quarto INT PRIMARY KEY,
    numero_quarto INT NOT NULL,
    id_tipo_quarto INT,
    tipo VARCHAR(20) CHECK (tipo IN ('Individual', 'Compartilhado')),
    FOREIGN KEY (id_tipo_quarto) REFERENCES tipo_quarto(id_tipo_quarto)
);

CREATE TABLE enfermeiro (
    id_enfermeiro INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
	crm	VARCHAR(20) NOT NULL
);

CREATE TABLE internacao (
    id_internacao INT PRIMARY KEY,
    id_quarto INT,
    id_enfermeiro INT,
    data_entrada DATE NOT NULL,
    previsao_alta DATE,
    data_alta DATE,
    acoes_realizadas TEXT,
    FOREIGN KEY (id_quarto) REFERENCES quarto(id_quarto),
    FOREIGN KEY (id_enfermeiro) REFERENCES enfermeiro(id_enfermeiro)
);

INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (1, 'Pediatria');
INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (2, 'Clínica Geral');
INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (3, 'Gastrentologia');
INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (4, 'Dermatologia');
INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (5, 'Cardiologia');
INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (6, 'Ortopedia');
INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (7, 'Neurologia');
INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (8, 'Oftalmologia');
INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (9, 'Otorrinolaringologia');
INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (10, 'Endocrinologia');

INSERT INTO medico (id_medico, nome_completo, cpf, data_nascimento, crm, uf_estado, uf_municipio, qualificacao, tipo_profissional, numero_contato)
VALUES (1, 'Carlos Oliveira', '12345678901', '1980-05-12', '12345-SP', 'SP', 'Capital', 'Cardiologista', 'Especialista', '987654321');
INSERT INTO medico (id_medico, nome_completo, cpf, data_nascimento, crm, uf_estado, uf_municipio, qualificacao, tipo_profissional, numero_contato)
VALUES (2, 'Juliana Santos', '23456789012', '1985-09-22', '23456-RJ', 'RJ', 'Rio de Janeiro', 'Oncologista', 'Especialista', '987654322');
INSERT INTO medico (id_medico, nome_completo, cpf, data_nascimento, crm, uf_estado, uf_municipio, qualificacao, tipo_profissional, numero_contato)
VALUES (3, 'Fernando Lima', '34567890123', '1978-12-05', '34567-BH', 'MG', 'Belo Horizonte', 'Ortopedista', 'Especialista', '987654323');
INSERT INTO medico (id_medico, nome_completo, cpf, data_nascimento, crm, uf_estado, uf_municipio, qualificacao, tipo_profissional, numero_contato)
VALUES (4, 'Aline Costa', '45678901234', '1990-07-18', '45678-SP', 'SP', 'Campinas', 'Pediatria', 'Residente', '987654324');
INSERT INTO medico (id_medico, nome_completo, cpf, data_nascimento, crm, uf_estado, uf_municipio, qualificacao, tipo_profissional, numero_contato)
VALUES (5, 'Lucas Pereira', '56789012345', '1982-04-03', '56789-RS', 'RS', 'Porto Alegre', 'Clínico Geral', 'Generalista', '987654325');
INSERT INTO medico (id_medico, nome_completo, cpf, data_nascimento, crm, uf_estado, uf_municipio, qualificacao, tipo_profissional, numero_contato)
VALUES (6, 'Mariana Oliveira', '67890123456', '1989-11-18', '67890-SP', 'SP', 'Santos', 'Neurologista', 'Especialista', '987654326');
INSERT INTO medico (id_medico, nome_completo, cpf, data_nascimento, crm, uf_estado, uf_municipio, qualificacao, tipo_profissional, numero_contato)
VALUES (7, 'Rafael Silva', '78901234567', '1980-01-25', '78901-RJ', 'RJ', 'Niterói', 'Dermatologista', 'Especialista', '987654327');
INSERT INTO medico (id_medico, nome_completo, cpf, data_nascimento, crm, uf_estado, uf_municipio, qualificacao, tipo_profissional, numero_contato)
VALUES (8, 'Isabel Rodrigues', '89012345678', '1992-06-12', '89012-MG', 'MG', 'Uberlândia', 'Ginecologista', 'Especialista', '987654328');
INSERT INTO medico (id_medico, nome_completo, cpf, data_nascimento, crm, uf_estado, uf_municipio, qualificacao, tipo_profissional, numero_contato)
VALUES (9, 'Gustavo Almeida', '90123456789', '1987-12-07', '90123-SC', 'SC', 'Florianópolis', 'Oftalmologista', 'Especialista', '987654329');
INSERT INTO medico (id_medico, nome_completo, cpf, data_nascimento, crm, uf_estado, uf_municipio, qualificacao, tipo_profissional, numero_contato)
VALUES (10, 'Ana Martins', '01234567890', '1993-05-30', '01234-DF', 'DF', 'Brasília', 'Urologista', 'Especialista', '987654330');

INSERT INTO convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia)
VALUES (1, 'VitalCare', '98765432000121', 45);
INSERT INTO convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia)
VALUES (2, 'SaudavelMais', '87654321000132', 75);
INSERT INTO convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia)
VALUES (3, 'BemEstarTotal', '76543210900143', 60);
INSERT INTO convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia)
VALUES (4, 'QualidadeViva', '65432109800154', 90);

INSERT INTO paciente (id_paciente, nome, data_nascimento, endereco, telefone, email, cpf, rg, possui_convenio)
VALUES (1, 'Pedro Cardoso', '1985-03-15', 'Rua K, 123', '(11) 1234-5678', 'pedro.cardoso@gmail.com', '123.456.789-02', '987654321', true);
INSERT INTO paciente (id_paciente, nome, data_nascimento, endereco, telefone, email, cpf, rg, possui_convenio)
VALUES (2, 'Fernanda Lima', '1990-08-22', 'Rua L, 456', '(21) 9876-5432', 'fernanda.lima@gmail.com', '234.567.899-12', '876543212', true);
INSERT INTO paciente (id_paciente, nome, data_nascimento, endereco, telefone, email, cpf, rg, possui_convenio)
VALUES (3, 'Tiago Pereira', '1982-11-05', 'Rua M, 789', '(31) 2345-6789', 'tiago.pereira@gmail.com', '345.678.701-23', '765432103', true);
INSERT INTO paciente (id_paciente, nome, data_nascimento, endereco, telefone, email, cpf, rg, possui_convenio)
VALUES (4, 'Beatriz Gonçalves', '1995-07-10', 'Rua N, 012', '(41) 3456-7890', 'beatriz.goncalves@gmail.com', '456.789.512-34', '654321094', true);
INSERT INTO paciente (id_paciente, nome, data_nascimento, endereco, telefone, email, cpf, rg, possui_convenio)
VALUES (5, 'Daniel Fonseca', '1978-04-03', 'Rua O, 345', '(51) 4567-8901', 'daniel.fonseca@gmail.com', '567.894.123-45', '543210985', false);
INSERT INTO paciente (id_paciente, nome, data_nascimento, endereco, telefone, email, cpf, rg, possui_convenio)
VALUES (6, 'Isabel Santos', '1989-09-18', 'Rua P, 678', '(61) 5678-9012', 'isabel.santos@gmail.com', '678.901.234-56', '432109876', true);
INSERT INTO paciente (id_paciente, nome, data_nascimento, endereco, telefone, email, cpf, rg, possui_convenio)
VALUES (7, 'Gustavo Oliveira', '1980-01-25', 'Rua Q, 901', '(71) 6789-0123', 'gustavo.oliveira@gmail.com', '789.012.345-67', '321098767', true);
INSERT INTO paciente (id_paciente, nome, data_nascimento, endereco, telefone, email, cpf, rg, possui_convenio)
VALUES (8, 'Laura Mendonça', '1992-06-12', 'Rua R, 234', '(81) 7890-1234', 'laura.mendonca@gmail.com', '890.123.456-78', '210987658', true);
INSERT INTO paciente (id_paciente, nome, data_nascimento, endereco, telefone, email, cpf, rg, possui_convenio)
VALUES (9, 'Vinícius Almeida', '1987-12-07', 'Rua S, 567', '(91) 8901-2345', 'vinicius.almeida@gmail.com', '901.234.567-89', '109876540', true);
INSERT INTO paciente (id_paciente, nome, data_nascimento, endereco, telefone, email, cpf, rg, possui_convenio)
VALUES (10, 'Carla Martins', '1993-05-30', 'Rua T, 890', '(01) 9012-3456', 'carla.martins@gmail.com', '012.345.678-91', '098765432', false);


INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (1, '2023-01-10', '10:00:00', '150.00', 1, 1, 2, 8);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (2, '2023-01-15', '14:30:00', '200.00', 2, 2, 3, 6);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (3, '2023-02-01', '09:45:00', '180.00', 3, 3, 1, 4);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (4, '2023-02-15', '11:15:00', '160.00', 4, 4, 4, 2);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (5, '2023-03-01', '13:30:00', '250.00', 5, 5, null, 10);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (6, '2023-03-15', '16:00:00', '180.00', 6, 6, 2, 8);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (7, '2023-04-01', '09:30:00', '200.00', 7, 7, 3, 6);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (8, '2023-04-15', '14:00:00', '170.00', 8, 8, 1, 4);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (9, '2023-05-01', '11:15:00', '190.00', 9, 9, 4, 2);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (10, '2023-05-15', '15:45:00', '220.00', 10, 10, null, 10);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (11, '2023-06-01', '09:00:00', '150.00', 11, 1, 2, 8);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (12, '2023-06-15', '10:45:00', '200.00', 12, 2, 3, 6);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (13, '2023-07-01', '14:00:00', '180.00', 13, 3, 1, 4);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (14, '2023-07-15', '11:30:00', '160.00', 14, 4, 4, 2);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (15, '2023-08-01', '13:45:00', '250.00', 15, 5, null, 10);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (16, '2023-08-15', '16:30:00', '180.00', 16, 6, 2, 8);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (17, '2023-09-01', '10:00:00', '200.00', 17, 7, 3, 6);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (18, '2023-09-15', '14:30:00', '170.00', 18, 8, 1, 4);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (19, '2023-10-01', '09:45:00', '190.00', 19, 9, 4, 2);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (20, '2023-10-15', '15:00:00', '220.00', 20, 10, null, 10);

INSERT INTO enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre)
VALUES(1, 'Aline Silva', 74851574012, '415879-SP');
INSERT INTO enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre)
VALUES(2, 'Renato Mendes', 58749617023, '254109-RJ');
INSERT INTO enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre)
VALUES(3, 'Carolina Santos', 78032145034, '012478-MG');
INSERT INTO enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre)
VALUES(4, 'Mário Costa', 10479547045, '960124-SP');
INSERT INTO enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre)
VALUES(5, 'Beatriz Silva', 87459612056, '784169-RJ');
INSERT INTO enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre)
VALUES(6, 'Gustavo Alves', 20147896067, '894175-SP');
INSERT INTO enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre)
VALUES(7, 'Fernanda Rodrigues', 12047953078, '784196-RJ');
INSERT INTO enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre)
VALUES(8, 'Ricardo Oliveira', 21436080989, '254987-MG');
INSERT INTO enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre)
VALUES(9, 'Gabriela Martins', 74198569090, '120478-SP');
INSERT INTO enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre)
VALUES(10, 'Lucas Lima', 88742514101, '251369-RJ');

INSERT INTO receita (id_receita, id_consulta, medicamento, quantidade, instrucoes_uso)
VALUES (1, 1, 'Paracetamol', 2, 'Tomar um comprimido a cada 6 horas. Não exceder 8 comprimidos em 24 horas.');
INSERT INTO receita (id_receita, id_consulta, medicamento, quantidade, instrucoes_uso)
VALUES (2, 2, 'Amoxicilina', 1, 'Tomar um comprimido a cada 12 horas com alimentos.');
INSERT INTO receita (id_receita, id_consulta, medicamento, quantidade, instrucoes_uso)
VALUES (3, 3, 'Ibuprofeno', 1, 'Tomar um comprimido a cada 8 horas. Não tomar com o estômago vazio.');
INSERT INTO receita (id_receita, id_consulta, medicamento, quantidade, instrucoes_uso)
VALUES (4, 4, 'Dipirona', 1, 'Tomar um comprimido a cada 6 horas, se necessário.');
INSERT INTO receita (id_receita, id_consulta, medicamento, quantidade, instrucoes_uso)
VALUES (5, 5, 'Omeprazol', 1, 'Tomar um comprimido antes da primeira refeição do dia.');
INSERT INTO receita (id_receita, id_consulta, medicamento, quantidade, instrucoes_uso)
VALUES (6, 6, 'Vitamina C', 1, 'Tomar um comprimido diariamente.');
INSERT INTO receita (id_receita, id_consulta, medicamento, quantidade, instrucoes_uso)
VALUES (7, 7, 'Soro fisiológico', 1, 'Utilizar conforme indicação médica para limpeza nasal.');
INSERT INTO receita (id_receita, id_consulta, medicamento, quantidade, instrucoes_uso)
VALUES (8, 8, 'Dexametasona', 1, 'Seguir a prescrição médica para uso tópico.');
INSERT INTO receita (id_receita, id_consulta, medicamento, quantidade, instrucoes_uso)
VALUES (9, 9, 'Cetoprofeno', 1, 'Tomar um comprimido a cada 12 horas com alimentos.');
INSERT INTO receita (id_receita, id_consulta, medicamento, quantidade, instrucoes_uso)
VALUES (10, 10, 'Xarope para tosse', 1, 'Tomar conforme indicação médica para alívio da tosse.');

INSERT INTO tipo_quarto(id_tipo_quarto, valor_diario, descricao)
VALUES(1, '1000.00', 'Apartamento');
INSERT INTO tipo_quarto(id_tipo_quarto, valor_diario, descricao)
VALUES(2, '700.00', 'Quartos duplos');
INSERT INTO tipo_quarto(id_tipo_quarto, valor_diario, descricao)
VALUES(3, '500.00', 'Enfermaria');

INSERT INTO quarto(id_quarto, numero, id_tipo_quarto)
VALUES(1, 01, 1);
INSERT INTO quarto(id_quarto, numero, id_tipo_quarto)
VALUES(2, 02, 2);
INSERT INTO quarto(id_quarto, numero, id_tipo_quarto)
VALUES(3, 03, 3);
INSERT INTO quarto(id_quarto, numero, id_tipo_quarto)
VALUES(4, 04, 3);
INSERT INTO quarto(id_quarto, numero, id_tipo_quarto)
VALUES(5, 05, 1);

INSERT INTO internacao (id_internacao, id_quarto, id_enfermeiro, data_entrada, data_prev_alta, data_alta, procedimento)
VALUES (1, 101, 1, '2023-01-15', '2023-01-20', '2023-01-18', 'Administração de medicamentos conforme prescrição médica.');
INSERT INTO internacao (id_internacao, id_quarto, id_enfermeiro, data_entrada, data_prev_alta, data_alta, procedimento)
VALUES (2, 102, 2, '2023-02-10', '2023-02-15', '2023-02-14', 'Monitoramento dos sinais vitais a cada 4 horas.');
INSERT INTO internacao (id_internacao, id_quarto, id_enfermeiro, data_entrada, data_prev_alta, data_alta, procedimento)
VALUES (3, 103, 3, '2023-03-25', '2023-04-01', '2023-03-30', 'Realização de curativos diários.');
INSERT INTO internacao (id_internacao, id_quarto, id_enfermeiro, data_entrada, data_prev_alta, data_alta, procedimento)
VALUES (4, 104, 4, '2023-04-05', '2023-04-12', '2023-04-10', 'Acompanhamento de exames laboratoriais.');
INSERT INTO internacao (id_internacao, id_quarto, id_enfermeiro, data_entrada, data_prev_alta, data_alta, procedimento)
VALUES (6, 106, 6, '2023-06-15', '2023-06-22', '2023-06-20', 'Administração de dieta por sonda.');
INSERT INTO internacao (id_internacao, id_quarto, id_enfermeiro, data_entrada, data_prev_alta, data_alta, procedimento)
VALUES (7, 107, 7, '2023-07-10', '2023-07-15', '2023-07-14', 'Acompanhamento psicológico.');
INSERT INTO internacao (id_internacao, id_quarto, id_enfermeiro, data_entrada, data_prev_alta, data_alta, procedimento)
VALUES (8, 108, 8, '2023-08-05', '2023-08-12', '2023-08-10', 'Fisioterapia motora diária.');

ALTER TABLE medico ADD em_atividade VARCHAR(100);

UPDATE medico SET em_atividade = 'Ativo' WHERE id_medico = 1;
UPDATE medico SET em_atividade = 'Ativo' WHERE id_medico = 2;
UPDATE medico SET em_atividade = 'Inativo' WHERE id_medico = 3;
UPDATE medico SET em_atividade = 'Ativo' WHERE id_medico = 4;
UPDATE medico SET em_atividade = 'Ativo' WHERE id_medico = 5;
UPDATE medico SET em_atividade = 'Inativo' WHERE id_medico = 6;
UPDATE medico SET em_atividade = 'Ativo' WHERE id_medico = 7;
UPDATE medico SET em_atividade = 'Ativo' WHERE id_medico = 8;
UPDATE medico SET em_atividade = 'Inativo' WHERE id_medico = 9;
UPDATE medico SET em_atividade = 'Ativo' WHERE id_medico = 10;

SELECT *
FROM consulta
WHERE YEAR(data_consulta) = 2020 OR id_convenio IS NOT NULL;

SELECT AVG(valor_consulta) AS ValorMedioConsultas
FROM consulta
WHERE YEAR(data_consulta) = 2020 OR id_convenio IS NOT NULL;

SELECT *
FROM internacao
WHERE data_alta > data_prev_alta;

SELECT *
FROM receita
WHERE id_consulta = (SELECT MIN(id_consulta) FROM consulta);

SELECT *
FROM consulta
WHERE id_convenio IS NULL
ORDER BY valor_consulta DESC
LIMIT 1;

SELECT *
FROM consulta
WHERE id_convenio IS NULL
ORDER BY valor_consulta ASC
LIMIT 1;

SELECT I.data_entrada, I.acoes_realizadas AS desc_procedimentos, I.id_quarto, DATEDIFF(I.data_alta, I.data_entrada) dias_internado, Q.valor_diario, DATEDIFF(I.data_alta, I.data_entrada) * Q.valor_diario valor_total
FROM internacao I
INNER JOIN quarto Q ON I.id_quarto = Q.id_quarto
INNER JOIN tipo_quarto TQ ON Q.id_tipo_quarto = TQ.id_tipo_quarto;

SELECT I.data_entrada, I.acoes_realizadas AS desc_procedimentos, I.id_quarto
FROM internacao I
JOIN quarto Q ON I.id_quarto = Q.id_quarto
JOIN tipo_quarto TQ ON Q.id_tipo_quarto = TQ.id_tipo_quarto
WHERE TQ.nome_tipo_quarto = 'apartamento';

SELECT P.nome_paciente, C.data_consulta, E.nome_especialidade
FROM consulta C
JOIN paciente P ON C.id_paciente = P.id_paciente
JOIN especialidade E ON C.id_especialidade = E.id_especialidade
WHERE E.nome_especialidade <> 'Cardiologia'
  AND YEAR(C.data_consulta) - YEAR(P.data_nascimento_paciente) BETWEEN 1 AND 18
ORDER BY C.data_consulta;

SELECT P.nome_paciente, M.nome_medico, I.data_entrada, I.acoes_realizadas AS desc_procedimentos
FROM internacao I
JOIN medico M ON I.id_medico = M.id_medico
JOIN paciente P ON I.id_paciente = P.id_paciente
WHERE M.qualificacao = 'Gastroenterologia'; -- AND Q.nome_tipo_quarto = 'enfermaria' essa parte não funciona

SELECT M.nome_medico, M.crm, COUNT(C.id_consulta) AS QuantidadeConsultas
FROM medico M
LEFT JOIN consulta C ON M.id_medico = C.id_medico
GROUP BY M.nome_medico, M.crm;

SELECT *
FROM medico
WHERE nome_completo LIKE '%Gabriel%';

SELECT E.nome_enfermeiro, E.cre, COUNT(I.id_internacao) AS NumeroInternacoes
FROM enfermeiro E
JOIN participacao_enfermeiro PE ON E.id_enfermeiro = PE.id_enfermeiro
JOIN internacao I ON PE.id_internacao = I.id_internacao
GROUP BY E.nome_enfermeiro, E.cre
HAVING COUNT(I.id_internacao) > 1;