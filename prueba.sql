CREATE TABLE IF NOT EXISTS proveïdor(
	idproveïdor INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(30) NOT NULL,
    adreça VARCHAR(30) NOT NULL,
    télefon INT NOT NULL,
    fax INT NOT NULL,
    nif VARCHAR(9) NOT NULL UNIQUE,
    PRIMARY KEY(idproveïdor)  
);

CREATE TABLE IF NOT EXISTS marca(
	idmarca INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(20),
    proveidorid INT NOT NULL,
    PRIMARY KEY(idmarca),
    CONSTRAINT proveidorid 
		FOREIGN KEY (proveidorid) 
		REFERENCES proveïdor(idproveïdor)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS colorsvidres(
	

	
	
    
    
    
    