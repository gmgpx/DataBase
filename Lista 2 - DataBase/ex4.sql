CREATE TABLE registroMed (
    id_registro SERIAL PRIMARY KEY,
    data_registro DATE,
    id_med INT,
    id_paciente INT
);


SELECT * FROM registroMed

INSERT INTO registroMed (data_registro, id_med, id_paciente)
VALUES ('2024-03-20', 4, 13);
	   
-- Inserir dados na tabela 'registroMed' com valores limitados para id_med (até 4) e id_paciente (entre 1 e 13)
INSERT INTO registroMed (data_registro, id_med, id_paciente) VALUES ('2024-03-21', 1, 1);
INSERT INTO registroMed (data_registro, id_med, id_paciente) VALUES ('2024-03-22', 2, 2);
INSERT INTO registroMed (data_registro, id_med, id_paciente) VALUES ('2024-03-23', 3, 3);
INSERT INTO registroMed (data_registro, id_med, id_paciente) VALUES ('2024-03-24', 4, 4);
INSERT INTO registroMed (data_registro, id_med, id_paciente) VALUES ('2024-03-25', 1, 5);
INSERT INTO registroMed (data_registro, id_med, id_paciente) VALUES ('2024-03-26', 2, 6);
INSERT INTO registroMed (data_registro, id_med, id_paciente) VALUES ('2024-03-27', 3, 7);
INSERT INTO registroMed (data_registro, id_med, id_paciente) VALUES ('2024-03-28', 4, 8);
INSERT INTO registroMed (data_registro, id_med, id_paciente) VALUES ('2024-03-29', 1, 9);
INSERT INTO registroMed (data_registro, id_med, id_paciente) VALUES ('2024-03-30', 2, 10);
INSERT INTO registroMed (data_registro, id_med, id_paciente) VALUES ('2024-03-31', 3, 11);
INSERT INTO registroMed (data_registro, id_med, id_paciente) VALUES ('2024-04-01', 4, 12);
INSERT INTO registroMed (data_registro, id_med, id_paciente) VALUES ('2024-04-02', 1, 13);
INSERT INTO registroMed (data_registro, id_med, id_paciente) VALUES ('2024-04-03', 2, 1);
INSERT INTO registroMed (data_registro, id_med, id_paciente) VALUES ('2024-04-04', 3, 2);
INSERT INTO registroMed (data_registro, id_med, id_paciente) VALUES ('2024-04-05', 4, 3);
INSERT INTO registroMed (data_registro, id_med, id_paciente) VALUES ('2024-04-06', 1, 4);
INSERT INTO registroMed (data_registro, id_med, id_paciente) VALUES ('2024-04-07', 2, 5);


