CREATE DATABASE IF NOT EXISTS `crimes`;

CREATE TABLE IF NOT EXISTS `crimes`.`Zones` (
`Zone_ID` int NOT NULL AUTO_INCREMENT,
`Zone` VARCHAR(16) NOT NULL,
PRIMARY KEY (`Zone_ID`)
);

CREATE TABLE IF NOT EXISTS `crimes`.`Crime_area` (
  `Area_ID` int NOT NULL AUTO_INCREMENT,
  `Zone_ID` int NOT NULL,
  `Street` VARCHAR(80) NOT NULL,
  `AreaDescription` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`Area_ID`),
  CONSTRAINT `FKAreaID`
  FOREIGN KEY (`Zone_ID`)
  REFERENCES `crimes`.`Zones` (`Zone_ID`)
  );


CREATE TABLE IF NOT EXISTS `crimes`.`People_addresses` (
`AddressID` INT NOT NULL AUTO_INCREMENT,
`Country` VARCHAR(300) NOT NULL,
`Town` VARCHAR(100) NOT NULL,
`ZipCode` VARCHAR(100) NOT NULL,
`Street` VARCHAR(100) NOT NULL,
`Type` VARCHAR(50) NOT NULL,
PRIMARY KEY (`AddressID`)
);
CREATE TABLE IF NOT EXISTS `crimes`.`People` (
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
  PRIMARY KEY (`Person_ID`),
  CONSTRAINT `FKAddress_ID`
  FOREIGN KEY (`AddressID`)
  REFERENCES `crimes`.`People_addresses` (`AddressID`)
  );

CREATE TABLE IF NOT EXISTS `crimes`.`Crime_records` (
`CrimeID` int NOT NULL AUTO_INCREMENT,
`Crime_description` VARCHAR(300) NOT NULL,
`Area_ID` int NOT NULL,
`Date` VARCHAR(300) NOT NULL,
`Time` VARCHAR(300) NOT NULL,
`Additional info` VARCHAR(300),
  PRIMARY KEY (`CrimeID`),
  CONSTRAINT `FKArea_ID`
  FOREIGN KEY (`Area_ID`)
  REFERENCES `crimes`.`Crime_area` (`Area_ID`)
  );


CREATE TABLE IF NOT EXISTS `crimes`.`Victims` (
  `VictimID` int NOT NULL AUTO_INCREMENT,
  `CrimeID` int NOT NULL,
  PRIMARY KEY (`VictimID`),
  CONSTRAINT `FKVictimID`
  FOREIGN KEY (`VictimID`)
  REFERENCES `crimes`.`People` (`Person_ID`),
  CONSTRAINT `FKCrime_ID2`
  FOREIGN KEY (`CrimeID`)
  REFERENCES `crimes`.`Crime_records` (`CrimeID`)
  );

CREATE TABLE IF NOT EXISTS `crimes`.`Criminals` (
  `CriminalID`int NOT NULL AUTO_INCREMENT,
  `CrimeID` int NOT NULL,
  PRIMARY KEY (`CriminalID`),
  CONSTRAINT `FKCriminalID`
  FOREIGN KEY (`CriminalID`)
  REFERENCES `crimes`.`People` (`Person_ID`),
  CONSTRAINT `FKCrime_ID1`
  FOREIGN KEY (`CrimeID`)
  REFERENCES `crimes`.`Crime_records` (`CrimeID`)
  );









INSERT INTO `crimes`.`users`
 (`username`, `password`)
VALUES ('admin', 'admin');
INSERT INTO `crimes`.`songs`(`song_ID`, `song_title`, `writer`, `path`, `type`) VALUES ('1','The Blaze - Territory - Official Video.wav','The Blaze','src\\DownloadedSongs\\The Blaze - Territory - Official Video.wav','wav');
INSERT INTO `crimes`.`songs`(`song_ID`, `song_title`, `writer`, `path`, `type`) VALUES ('2','The Blaze - Virile.wav','The Blaze','src\\DownloadedSongs\\The Blaze - Virile.wav','wav');
INSERT INTO `crimes`.`songs`(`song_ID`, `song_title`, `writer`, `path`, `type`) VALUES ('3','Legends Never Die (ft. Against The Current) [OFFICIAL AUDIO] _ Worlds 2017 - League of Legends.wav','riot studio','src\\DownloadedSongs\\Legends Never Die (ft. Against The Current) [OFFICIAL AUDIO] _ Worlds 2017 - League of Legends.wav','wav');
INSERT INTO `crimes`.`songs`(`song_ID`, `song_title`, `writer`, `path`, `type`) VALUES ('4','Kanye West - Stronger.wav','The Blaze','src\\DownloadedSongs\\Kanye West - Stronger.wav','wav');