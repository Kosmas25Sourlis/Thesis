CREATE DATABAse IF NOT EXISTS `crimes`;
  CREATE TABLE IF NOT EXISTS `crimes`.`people` (
  `Person_ID` int NOT NULL AUTO_INCREMENT,
  `Surname` VARCHAR(80) NOT NULL,
  `First_name` VARCHAR(80) NOT NULL,
  `Phone` VARCHAR(15) NOT NULL,
  `Height` VARCHAR(10) NOT NULL,
  `Weight` VARCHAR(80) NOT NULL,
  `Age` VARCHAR(80) NOT NULL,
  `Sex` VARCHAR(80) NOT NULL,
  `PhotoURL` VARCHAR(80) NOT NULL,
  `Years_in_jail` VARCHAR(30),
  `AddressID` INT NOT NULL,
  PRIMARY KEY (`Person_ID`)
  );




CREATE TABLE IF NOT EXISTS `crimes`.`Zones` (
`Zone_ID` int NOT NULL ,
`Zone` VARCHAR(16) NOT NULL,
PRIMARY KEY (`Zone_ID`)
);

CREATE TABLE IF NOT EXISTS `crimes`.`Crime_area` (
  `Area_ID` int NOT NULL AUTO_INCREMENT,
  `Zone_ID` VARCHAR(16) NOT NULL,
  `Street` VARCHAR(80) NOT NULL,
  `AreaDescription` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`Area_ID`),

  CONSTRAINT `FKAreaID`
    FOREIGN  (`Zone_ID`)
    REFERENCES `crimes`.`Zones` (`Zone_ID`)
  );


CREATE TABLE IF NOT EXISTS `crimes`.`Criminals` (
  `CriminalID` VARCHAR(16) NOT NULL,
  `CrimeID` VARCHAR(16) NOT NULL ,
  PRIMARY KEY (`CriminalID`)
  );
CREATE TABLE IF NOT EXISTS `crimes`.`Victims` (
  `VictimID` VARCHAR(16) NOT NULL,
  `CrimeID` VARCHAR(16) NOT NULL ,
  PRIMARY KEY (`VictimID`)
  );
    CREATE TABLE IF NOT EXISTS `crimes`.`People_Addresses` (
  `AddressID` int NOT NULL AUTO_INCREMENT,
  `Country` VARCHAR(300) NOT NULL,
  `Town` VARCHAR(100) NOT NULL,
  `ZipCode` VARCHAR(100) NOT NULL,
  `Street` VARCHAR(100) NOT NULL,
  `Type` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`AddressID`)
  );
    CREATE TABLE IF NOT EXISTS `crimes`.`crime_records` (
  `CrimeID` int NOT NULL AUTO_INCREMENT,
  `Crime_description` VARCHAR(300) NOT NULL,
  `AreaID` int NOT NULL,
  `Date` VARCHAR(300) NOT NULL,
  `Time` VARCHAR(300) NOT NULL,
  `Additional info` VARCHAR(300),
  PRIMARY KEY (`CrimeID`)
  );


  CREATE TABLE IF NOT EXISTS `crimes`.`Zones` (
  `Zone_the_ID` int NOT NULL AUTO_INCREMENT,
  `Zone` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`Zone_the_ID`)
  );
ALTER TABLE  `crimes`.`Criminals`
ADD CONSTRAINT `fk_criminalID`
FOREIGN KEY (`CriminalID`)
REFERENCES `People`(`Person_ID`);

ALTER TABLE  `crimes`.`Victims`
ADD CONSTRAINT `fk_victimID`
FOREIGN KEY (`VictimID`)
REFERENCES `People`(`Person_ID`);

ALTER TABLE  `crimes`.`People_Addresses`
ADD CONSTRAINT `fk_addressID`
FOREIGN KEY (`AddressID`)
REFERENCES `People`(`Addrees_ID`);

ALTER TABLE  `crimes`.`Crime_area`
ADD CONSTRAINT `fk_Zone_ID`
FOREIGN KEY (`Zone_ID`)
REFERENCES `Zones`(`Zone_ID`);

ALTER TABLE  `crimes`.`crime_records`
ADD CONSTRAINT `fk_CrimeID1`
FOREIGN KEY (`fk_crimeid`)
REFERENCES `Criminals`(`CrimeID`);

ALTER TABLE  `crimes`.`crime_records`
ADD CONSTRAINT `fk_CrimeID2`
FOREIGN KEY (`fk_crimeid2`)
REFERENCES `Victims`(`CrimeID`);

ALTER TABLE  `crimes`.`crime_records`
ADD CONSTRAINT `fk_Crime_area_ID`
FOREIGN KEY (`AreaID`)
REFERENCES `Crime_area`(`Area_ID`);


INSERT INTO `crimes`.`users`
 (`username`, `password`)
VALUES ('admin', 'admin');
INSERT INTO `crimes`.`songs`(`song_ID`, `song_title`, `writer`, `path`, `type`) VALUES ('1','The Blaze - Territory - Official Video.wav','The Blaze','src\\DownloadedSongs\\The Blaze - Territory - Official Video.wav','wav');
INSERT INTO `crimes`.`songs`(`song_ID`, `song_title`, `writer`, `path`, `type`) VALUES ('2','The Blaze - Virile.wav','The Blaze','src\\DownloadedSongs\\The Blaze - Virile.wav','wav');
INSERT INTO `crimes`.`songs`(`song_ID`, `song_title`, `writer`, `path`, `type`) VALUES ('3','Legends Never Die (ft. Against The Current) [OFFICIAL AUDIO] _ Worlds 2017 - League of Legends.wav','riot studio','src\\DownloadedSongs\\Legends Never Die (ft. Against The Current) [OFFICIAL AUDIO] _ Worlds 2017 - League of Legends.wav','wav');
INSERT INTO `crimes`.`songs`(`song_ID`, `song_title`, `writer`, `path`, `type`) VALUES ('4','Kanye West - Stronger.wav','The Blaze','src\\DownloadedSongs\\Kanye West - Stronger.wav','wav');