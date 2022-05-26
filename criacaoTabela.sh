#!/bin/bash

function intalacaoJavaLocal(){
sudo docker exec -it Mysql bash

mysql -u root -p urubu100

CREATE DATABASE IF NOT EXISTS farmagraphsolutions;

USE farmagraphsolutions;

CREATE TABLE IF NOT EXISTS Responsavel(ID_Responsavel Integer PRIMARY KEY AUTO_INCREMENT, Nome VARCHAR(40)  NOT NULL, Email VARCHAR(40)  NOT NULL, Senha VARCHAR(40)  NOT NULL)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS Loja (ID_Loja Integer PRIMARY KEY AUTO_INCREMENT, Nome VARCHAR(70) NOT NULL, Rua VARCHAR(40) NOT NULL, Bairro  			VARCHAR(30) NOT NULL, Numero SMALLINT NOT NULL, Cidade VARCHAR(45) NOT NULL, Estado CHAR(2) NOT NULL, CEP CHAR(9) NOT NULL, CNPJ CHAR(14) NOT NULL, FK_Responsavel Integer, FK_Filial Integer, CONSTRAINT FK_Responsavel_Loja FOREIGN KEY (FK_Responsavel) REFERENCES Responsavel(ID_Responsavel), CONSTRAINT FK_Filial_Loja FOREIGN KEY (FK_Filial) REFERENCES Loja(ID_Loja));
                  
CREATE TABLE IF NOT EXISTS Monitorador (ID_Monitorador Integer PRIMARY KEY AUTO_INCREMENT, FK_Loja Integer, Nome VARCHAR(40) NOT NULL, CPF CHAR(11) NOT NULL, Email VARCHAR(40) NOT NULL, Senha VARCHAR(40) NOT NULL, CONSTRAINT FK_Loja_Monitorador FOREIGN KEY (FK_Loja) REFERENCES Loja(ID_Loja))AUTO_INCREMENT = 1;
                         
CREATE TABLE IF NOT EXISTS Computador(ID_Computador Integer PRIMARY KEY, Senha VARCHAR(45)  NOT NULL, FK_Loja INTEGER, CONSTRAINT FK_Computador_Loja FOREIGN KEY (FK_Loja) REFERENCES Loja(ID_Loja));
				
CREATE TABLE IF NOT EXISTS MemoriaMassa(ID_MemoriaMassa INT PRIMARY KEY AUTO_INCREMENT, FK_Computador INT, Modelo TEXT, EspacoArmazenamento BIGINT, CONSTRAINT FK_MemoriaMassa_Computador FOREIGN KEY (FK_Computador) REFERENCES Computador(ID_Computador))AUTO_INCREMENT = 1;
                          
CREATE TABLE IF NOT EXISTS Log_MemoriaMassa(ID_Log_MemoriaMassa INT PRIMARY KEY AUTO_INCREMENT, FK_MemoriaMassa INT, Leitura BIGINT, Escrita BIGINT, TempoTranferencia BIGINT, EspacoLivre BIGINT, DataLog TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, CONSTRAINT FK_Log_MemoriaMassa_MemoriaMassa FOREIGN KEY (Fk_MemoriaMassa) REFERENCES MemoriaMassa(ID_MemoriaMassa))AUTO_INCREMENT = 1;
                          
CREATE TABLE IF NOT EXISTS MemoriaRam(ID_MemoriaRam INT PRIMARY KEY AUTO_INCREMENT, FK_Computador INT, Total_Armazenamento BIGINT, CONSTRAINT FK_MemoriaRam_Computador FOREIGN KEY (FK_Computador) REFERENCES Computador(ID_Computador))AUTO_INCREMENT = 1;
                          
CREATE TABLE IF NOT EXISTS Log_MemoriaRam(ID_Log_MemoriaRam INT PRIMARY KEY AUTO_INCREMENT, FK_MemoriaRam INT, QTD_MemoriaUso BIGINT, MemoriaDisponivel BIGINT, DataLog TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, CONSTRAINT FK_Log_MemoriaRam_MemoriaRam FOREIGN KEY (FK_MemoriaRam) REFERENCES MemoriaRam(ID_MemoriaRam))AUTO_INCREMENT = 1;                   

CREATE TABLE IF NOT EXISTS Processador(ID_Processador INT PRIMARY KEY AUTO_INCREMENT, FK_Computador INT, Modelo TEXT, CONSTRAINT FK_Processador_Computador FOREIGN KEY (FK_Computador) REFERENCES Computador(ID_Computador))AUTO_INCREMENT = 1;                   
								
CREATE TABLE IF NOT EXISTS Log_Processador(ID_Log_Processador INT PRIMARY KEY AUTO_INCREMENT, FK_Processador INT, Frequencia BIGINT, Uso DOUBLE(4,2), DataLog TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, CONSTRAINT FK_Log_Processador_Processado FOREIGN KEY (FK_Processador) REFERENCES Processador(ID_Processador))AUTO_INCREMENT = 1;
}
intalacaoJavaLocal