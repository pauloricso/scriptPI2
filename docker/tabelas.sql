USE farmagraphsolutions;
CREATE TABLE IF NOT EXISTS  Responsavel(ID_Responsavel 	Integer PRIMARY KEY AUTO_INCREMENT
									   ,Nome 		  	VARCHAR(40)  NOT NULL
									   ,Email			VARCHAR(40)  NOT NULL
									   ,Senha 		  	VARCHAR(40)  NOT NULL
                        )AUTO_INCREMENT = 1;
		
CREATE TABLE IF NOT EXISTS Loja (ID_Loja 		 	Integer PRIMARY KEY AUTO_INCREMENT
								,Nome 				VARCHAR(70) NOT NULL
								,Rua 				VARCHAR(40) NOT NULL
								,Bairro  			VARCHAR(30) NOT NULL
								,Numero  			SMALLINT 	NOT NULL
								,Cidade 			VARCHAR(45) NOT NULL
								,Estado				CHAR(2)     NOT NULL
								,CEP  				CHAR(9) 	NOT NULL
								,CNPJ 				CHAR(14)	NOT NULL
								,FK_Responsavel   	Integer 
								,FK_Filial        	Integer
							  
									,CONSTRAINT FK_Responsavel_Loja 
												FOREIGN KEY (FK_Responsavel)	
															REFERENCES Responsavel(ID_Responsavel)
															
									,CONSTRAINT FK_Filial_Loja 
												FOREIGN KEY (FK_Filial)	
															REFERENCES Loja(ID_Loja)                                          						
                  );
                  
CREATE TABLE IF NOT EXISTS Monitorador (ID_Monitorador 		Integer PRIMARY KEY AUTO_INCREMENT
									   ,FK_Loja 		 	Integer 
									   ,Nome 			 	VARCHAR(40) NOT NULL
									   ,CPF 			 	CHAR(11)	NOT NULL
									   ,Email			 	VARCHAR(40) NOT NULL
									   ,Senha 		 		VARCHAR(40) NOT NULL
								
											,CONSTRAINT FK_Loja_Monitorador
														FOREIGN KEY (FK_Loja)
																	REFERENCES Loja(ID_Loja)
                         )AUTO_INCREMENT = 1;
                         
CREATE TABLE IF NOT EXISTS Computador(ID_Computador 	Integer PRIMARY KEY
									 ,Senha		 		VARCHAR(45)  NOT NULL
									 ,FK_Loja 	  		INTEGER 
                       
									 ,CONSTRAINT FK_Computador_Loja 
											FOREIGN KEY (FK_Loja)	
													REFERENCES Loja(ID_Loja)                                          						
                  );
				
CREATE TABLE IF NOT EXISTS MemoriaMassa(ID_MemoriaMassa 		INT PRIMARY KEY AUTO_INCREMENT
									   ,FK_Computador			INT 
                                       ,Modelo 					TEXT
                                       ,EspacoArmazenamento		BIGINT
                                       
                                       ,CONSTRAINT FK_MemoriaMassa_Computador
											FOREIGN KEY (FK_Computador)
												REFERENCES Computador(ID_Computador)
						  )AUTO_INCREMENT = 1;
                          
CREATE TABLE IF NOT EXISTS Log_MemoriaMassa(ID_Log_MemoriaMassa INT PRIMARY KEY AUTO_INCREMENT
										   ,FK_MemoriaMassa	    INT
                                           ,Leitura				BIGINT
                                           ,Escrita				BIGINT
                                           ,TempoTranferencia   BIGINT 
                                           ,EspacoLivre  		BIGINT
										   ,DataLog  			TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
										   ,CONSTRAINT FK_Log_MemoriaMassa_MemoriaMassa
												FOREIGN KEY (Fk_MemoriaMassa)
														REFERENCES MemoriaMassa(ID_MemoriaMassa)
						  )AUTO_INCREMENT = 1;
                          
CREATE TABLE IF NOT EXISTS MemoriaRam(ID_MemoriaRam 	    INT PRIMARY KEY AUTO_INCREMENT
									 ,FK_Computador			INT 		
									 ,Total_Armazenamento   BIGINT
                                     
                                     ,CONSTRAINT FK_MemoriaRam_Computador
											FOREIGN KEY (FK_Computador)
												REFERENCES Computador(ID_Computador)
						  )AUTO_INCREMENT = 1;
                          
CREATE TABLE IF NOT EXISTS Log_MemoriaRam(ID_Log_MemoriaRam INT PRIMARY KEY AUTO_INCREMENT
										 ,FK_MemoriaRam     INT
										 ,QTD_MemoriaUso	BIGINT
                                         ,MemoriaDisponivel BIGINT
										 ,DataLog  			TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
										,CONSTRAINT FK_Log_MemoriaRam_MemoriaRam
											FOREIGN KEY (FK_MemoriaRam)
												REFERENCES MemoriaRam(ID_MemoriaRam)
						)AUTO_INCREMENT = 1;                   

CREATE TABLE IF NOT EXISTS Processador(ID_Processador  	INT PRIMARY KEY AUTO_INCREMENT
									  ,FK_Computador    INT 
                                      ,Modelo 			TEXT
                                      
                                      ,CONSTRAINT FK_Processador_Computador
											FOREIGN KEY (FK_Computador)
												REFERENCES Computador(ID_Computador)
									)AUTO_INCREMENT = 1;                   
								
CREATE TABLE IF NOT EXISTS Log_Processador(ID_Log_Processador INT PRIMARY KEY AUTO_INCREMENT
										  ,FK_Processador     INT
										  ,Frequencia		  BIGINT
                                          ,Uso				  DOUBLE(4,2)
                                          ,DataLog  		  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
                                          ,CONSTRAINT FK_Log_Processador_Processado 
												FOREIGN KEY (FK_Processador)
													REFERENCES Processador(ID_Processador)
									)AUTO_INCREMENT = 1; 

INSERT INTO Responsavel (Nome, Email, Senha) values
("Alberto"	  ,"alberto41@granfram.com.br"	 ,"1234"),
("Matias" 	  ,"Matias@drogariasp.com.br"	 ,"1234"),
("Caio"		  ,"caio11@drogasil.com.br"	     ,"1234"),
("Thiago"     ,"thiago@paguemenos.com.br"    ,"1234"),
("Paula"      ,"paula@panvel.com.br"		 ,"1234");	
		
INSERT INTO  Loja (Nome, Rua, Bairro, Numero, Cidade, Estado, CEP, CNPJ, FK_Responsavel) VALUES
("GRAN FARMA GRAN FORMULAS - DROGARIA E MANIPULACAO"  , "Rua Senador Flaquer"  , "Centro"	   , 41  , "São Paulo"		   , "SP", "09010160", "06787654000193", 1),
("Drogaria Sao Paulo S.A."							  , "Praça da Sé"		   , "Sé"	 	   , 41  , "São Paulo"		   , "SP", "01001000", "06787654000193", 2),
("RAIA DROGASIL S/A"								  , "Praça da Sé"		   , "VILA BUTANTA", 3097, "São Paulo"		   , "SP", "01001001", "61585865000151", 3),
("EMPREENDIMENTOS PAGUE MENOS S/A"					  , "R SENADOR POMPEU"	   , "Centro"	   , 1520, "Fortaleza"		   , "CE","60025002" , "06626253000151", 4),
("DIMED S/A - DISTRIBUIDORA DE MEDICAMENTOS"		  , "3a Avenida"		   , "Centro"	   , 80  , "BALNEARIO CAMBORIU", "SC", "88330084", "92665611025161", 5);
                 
INSERT INTO Monitorador (FK_Loja, Nome, CPF, Email, Senha) Values
(1, "Guilherme Pereira", "25445695872",	"guilherme@hotmail.com", "1234"),
(2, "Rogeiro Alves"	   , "54562145876",	"rogerio@hotmail.com"  , "1234"),
(3, "Luis Caracio"	   , "25445695872",	"luis@hotmail.com"	   , "1234"),
(4, "Paulo Eduardo"    , "25445695872",	"paulo@hotmail.com"	   , "1234"),
(5, "Victo Santos"	   , "25445695872",	"vitor@hotmail.com"	   , "1234");

INSERT INTO Computador (ID_Computador, Senha, FK_Loja) Values
(1,"1234",2),
(2,"1234",2),
(3,"1234",2),
(4,"1234",1),
(5,"1234",1),
(6,"1234",1),
(7,"1234",2),
(8,"1234",2),
(9,"1234", 3),
(10,"1234",3),
(11,"1234",4),
(12,"1234",4),  
(13,"1234",5),
(14,"1234",5);                
