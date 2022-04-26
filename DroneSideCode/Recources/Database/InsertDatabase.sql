CREATE DATABASE IF NOT EXISTS `crimes`;

CREATE TABLE IF NOT EXISTS `crimes`.`Zones` (
`Zone_ID` int NOT NULL AUTO_INCREMENT,
`Zone` VARCHAR(50) NOT NULL,
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
  REFERENCES `crimes`.`Zones` (`Zone_ID`));

CREATE TABLE IF NOT EXISTS `crimes`.`People_addresses` (
`AddressID` INT NOT NULL AUTO_INCREMENT,
`Country` VARCHAR(100) NOT NULL,
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
  `Age` VARCHAR(15) NOT NULL,
  `Sex` VARCHAR(10) NOT NULL,
  `Nationality` VARCHAR(10) NOT NULL,
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
`Date_and_time`DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
`Additional info` VARCHAR(300),
  PRIMARY KEY (`CrimeID`),
  CONSTRAINT `FKArea_ID`
  FOREIGN KEY (`Area_ID`)
  REFERENCES `crimes`.`Crime_area` (`Area_ID`)
  );


CREATE TABLE IF NOT EXISTS `crimes`.`Victims` (
  `VictimID` int NOT NULL AUTO_INCREMENT,
  `CrimeID` int NOT NULL,
  PRIMARY KEY (`VictimID`, `CrimeID`),
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
  PRIMARY KEY (`CriminalID`, CrimeID),
  CONSTRAINT `FKCriminalID`
  FOREIGN KEY (`CriminalID`)
  REFERENCES `crimes`.`People` (`Person_ID`),
  CONSTRAINT `FKCrime_ID1`
  FOREIGN KEY (`CrimeID`)
  REFERENCES `crimes`.`Crime_records` (`CrimeID`)
  );

INSERT INTO `crimes`.`Zones`(`Zone_ID`, `zone`)VALUES (1, 'Epirus,Thrace, Macedonia, Thessaly');
INSERT INTO `crimes`.`Zones`(`Zone_ID`, `zone`)VALUES (2, 'Central greece, Peloponnese, Ionian Islands');
INSERT INTO `crimes`.`Zones`(`Zone_ID`, `zone`)VALUES (3, 'Crete, Aegean islands');

INSERT INTO `crimes`.`Crime_area`(`Area_ID`,`Zone_ID`, `Street`, `AreaDescription`)VALUES (1,1, 'Aristotelous' , 'In the centre of Thessaloniki');
INSERT INTO `crimes`.`Crime_area`(`Area_ID`,`Zone_ID`, `Street`, `AreaDescription`)VALUES (2,1, 'Karaolh & dhmhtriou' , 'in The centre of Euosmos, Thessaloniki');
INSERT INTO `crimes`.`Crime_area`(`Area_ID`,`Zone_ID`, `Street`, `AreaDescription`)VALUES (3,1, 'Leoforos papanikolaou' , 'Papanikolaou hospital');

INSERT INTO `crimes`.`Crime_area`(`Area_ID`,`Zone_ID`, `Street`, `AreaDescription`)VALUES (4,2 ,'Leoforos Aleksandras' , 'Athens,field of areos');
INSERT INTO `crimes`.`Crime_area`(`Area_ID`,`Zone_ID`, `Street`, `AreaDescription`)VALUES (5,2, 'Hrwwn polutechniou' , 'Patra, University');
INSERT INTO `crimes`.`Crime_area`(`Area_ID`,`Zone_ID`, `Street`, `AreaDescription`)VALUES (6,2, 'Gourgiwth' , 'Larisa, Folkfore museum');

INSERT INTO `crimes`.`Crime_area`(`Area_ID`,`Zone_ID`, `Street`, `AreaDescription`)VALUES (7,3, 'Eleuftheriou venizelou' , 'Crete, Atticon cinema');
INSERT INTO `crimes`.`Crime_area`(`Area_ID`,`Zone_ID`, `Street`, `AreaDescription`)VALUES (8,3, 'Sofoulh' , 'Samos, port');
INSERT INTO `crimes`.`Crime_area`(`Area_ID`,`Zone_ID`, `Street`, `AreaDescription`)VALUES (9,3, 'Stefanou Ksanthoudirh' , 'Crete, Archailogical museum of heraklion');

INSERT INTO `crimes`.`People_addresses`(`AddressID`,`Country`, `Town`, `ZipCode`, `Street`,`Type` )VALUES ( 1,'Greece' , 'Thessaloniki, centre','58810','ermou 20', 'permanent residence address');
INSERT INTO `crimes`.`People_addresses`(`AddressID`,`Country`, `Town`, `ZipCode`, `Street`,`Type` )VALUES ( 2,'Greece' , 'Thessaloniki, Kalamaria','74124','Kerasountous', 'permanent residence address');
INSERT INTO `crimes`.`People_addresses`(`AddressID`,`Country`, `Town`, `ZipCode`, `Street`,`Type` )VALUES ( 3,'Greece' , 'Katerinh','95214','Sofokleous 100', 'permanent residence address');
INSERT INTO `crimes`.`People_addresses`(`AddressID`,`Country`, `Town`, `ZipCode`, `Street`,`Type` )VALUES ( 4,'Greece' , 'Patra','Uknown','Uknown', '-');
INSERT INTO `crimes`.`People_addresses`(`AddressID`,`Country`, `Town`, `ZipCode`, `Street`,`Type` )VALUES ( 5,'Greece' , 'Larisa','Uknown','Uknown', '-');
INSERT INTO `crimes`.`People_addresses`(`AddressID`,`Country`, `Town`, `ZipCode`, `Street`,`Type` )VALUES ( 6,'Greece' , 'Karditsa','Uknown','Uknown', '-');
INSERT INTO `crimes`.`People_addresses`(`AddressID`,`Country`, `Town`, `ZipCode`, `Street`,`Type` )VALUES ( 7,'Greece' , 'Xios','Uknown','Uknown', '-');
INSERT INTO `crimes`.`People_addresses`(`AddressID`,`Country`, `Town`, `ZipCode`, `Street`,`Type` )VALUES ( 8,'Greece' , 'Heraklion','Uknown','Uknown', '-');
INSERT INTO `crimes`.`People_addresses`(`AddressID`,`Country`, `Town`, `ZipCode`, `Street`,`Type` )VALUES ( 9,'Greece' , 'Kerkura','Uknown','Uknown', '-');
INSERT INTO `crimes`.`People_addresses`(`AddressID`,`Country`, `Town`, `ZipCode`, `Street`,`Type` )VALUES ( 10,'Greece' , 'Patra','Uknown','Uknown', '-');
INSERT INTO `crimes`.`People_addresses`(`AddressID`,`Country`, `Town`, `ZipCode`, `Street`,`Type` )VALUES ( 11,'Greece' , 'Kalamata','Uknown','Uknown', '-');
INSERT INTO `crimes`.`People_addresses`(`AddressID`,`Country`, `Town`, `ZipCode`, `Street`,`Type` )VALUES ( 12,'Greece' , 'Komothnh','Uknown','Uknown', '-');

INSERT INTO `crimes`.`People`(`Person_ID`,`Surname`, `First_name`, `Phone`, `Height`,`Weight`, `Age`,`Sex`,`Nationality`, `PhotoURL`,`Years_in_jail`, `AddressID`)VALUES ( 1,'Sourlis' , 'Kosmas', '-', '1.93','100kg', '24','male','Greek' , 'Recources\\Images\\Kosmas_Sourlis.jpg' , '0',1);
INSERT INTO `crimes`.`People`(`Person_ID`,`Surname`, `First_name`, `Phone`, `Height`,`Weight`, `Age`,`Sex`,`Nationality`, `PhotoURL`,`Years_in_jail`, `AddressID`)VALUES( 2,'Sourlis' , 'Athanasios', '-', '1.93','80kg', '24','male','Greek', 'Recources\\Images\\Athanasios_Sourlis.jpg', '0',2);
INSERT INTO `crimes`.`People`(`Person_ID`,`Surname`, `First_name`, `Phone`, `Height`,`Weight`, `Age`,`Sex`,`Nationality`, `PhotoURL`,`Years_in_jail`, `AddressID`)VALUES ( 3,'Fragkedakis' , 'Dhmhtrhs', '-', '1.91','78kg', '22','male' ,'Greek', 'Recources\\Images\\Dhmhtrhs_Fragkedakis.jpg', '0',3);
INSERT INTO `crimes`.`People`(`Person_ID`,`Surname`, `First_name`, `Phone`, `Height`,`Weight`, `Age`,`Sex`,`Nationality`, `PhotoURL`,`Years_in_jail`, `AddressID`)VALUES ( 4,'Izdra' , 'Elina', '-', '1.70','55kg', '26','female' ,'Greek', 'Recources\\Images\\Elina_Izdra.jpg','0', 4);
INSERT INTO `crimes`.`People`(`Person_ID`,`Surname`, `First_name`, `Phone`, `Height`,`Weight`, `Age`,`Sex`,`Nationality`, `PhotoURL`,`Years_in_jail`, `AddressID`)VALUES ( 5,'Lazaros' , 'Kapoukranidis', '-', '1.85','82kg', '25','male' ,'Greek', 'Recources\\Images\\Lazaros_Kapoukranidis.jpg', '0',5);
INSERT INTO `crimes`.`People`(`Person_ID`,`Surname`, `First_name`, `Phone`, `Height`,`Weight`, `Age`,`Sex`,`Nationality`, `PhotoURL`,`Years_in_jail`, `AddressID`)VALUES ( 6,'Doe' , 'John', '-', '1.78','80kg', '24','female' ,'Greek', '-', '0', 6);
INSERT INTO `crimes`.`People`(`Person_ID`,`Surname`, `First_name`, `Phone`, `Height`,`Weight`, `Age`,`Sex`,`Nationality`, `PhotoURL`,`Years_in_jail`, `AddressID`)VALUES ( 7,'John' , 'Smith', '-', '1.63','90kg', '29','male' ,'Greek', '-', '0', 7);
INSERT INTO `crimes`.`People`(`Person_ID`,`Surname`, `First_name`, `Phone`, `Height`,`Weight`, `Age`,`Sex`,`Nationality`, `PhotoURL`,`Years_in_jail`, `AddressID`)VALUES ( 8,'Jones' , 'Sarah', '-', '1.61','60kg', '60','female' ,'Greek', '-', '0',8);
INSERT INTO `crimes`.`People`(`Person_ID`,`Surname`, `First_name`, `Phone`, `Height`,`Weight`, `Age`,`Sex`,`Nationality`, `PhotoURL`,`Years_in_jail`, `AddressID`)VALUES ( 9,'Papadopoulos' , 'Giwrgos', '-', '1.98','102kg', '52','male' ,'Greek', '-', '0',9);
INSERT INTO `crimes`.`People`(`Person_ID`,`Surname`, `First_name`, `Phone`, `Height`,`Weight`, `Age`,`Sex`,`Nationality`, `PhotoURL`,`Years_in_jail`, `AddressID`)VALUES( 10,'Karragiannis' , 'Ioannis', '-', '1.63','60kg', '38','male' ,'Greek', '-', '0', 10);

INSERT INTO `crimes`.`Crime_records`(`CrimeID`, `Crime_description`, `Area_ID`, `Date_and_time`, `Additional info`)VALUES (1 ,'Bank robbery', 1, '2011-03-10 01:10:00', '-');
INSERT INTO `crimes`.`Crime_records`(`CrimeID`, `Crime_description`, `Area_ID`, `Date_and_time`, `Additional info`)VALUES  (2,'Physical assault and hospitalized victims', 2,'2012-03-10 03:44:05', '-');
INSERT INTO `crimes`.`Crime_records`(`CrimeID`, `Crime_description`, `Area_ID`, `Date_and_time`, `Additional info`)VALUES  (3,'Gun shot on hospitalized victims', 3,'2017-09-10 01:50:00', '-');
INSERT INTO `crimes`.`Crime_records`(`CrimeID`, `Crime_description`, `Area_ID`, `Date_and_time`, `Additional info`)VALUES  (4,'Street theft, stole bag and purse', 4,'2022-01-25 16:30:00', '-');
INSERT INTO `crimes`.`Crime_records`(`CrimeID`, `Crime_description`, `Area_ID`, `Date_and_time`, `Additional info`)VALUES (5,'Physically asaulted professor', 5,'2016-07-25 18:05:45', '-');
INSERT INTO `crimes`.`Crime_records`(`CrimeID`, `Crime_description`, `Area_ID`, `Date_and_time`, `Additional info`)VALUES  (6,'Stole artifacts from museum', 6,'2014-11-10 20:20:00', '-');
INSERT INTO `crimes`.`Crime_records`(`CrimeID`, `Crime_description`, `Area_ID`, `Date_and_time`, `Additional info`)VALUES  (7,'Vandalized cinema', 7,'2021-04-11 22:00:00', '-');
INSERT INTO `crimes`.`Crime_records`(`CrimeID`, `Crime_description`, `Area_ID`, `Date_and_time`, `Additional info`)VALUES  (8,'Αrson on a tourist ship', 8,'2018-09-15 10:15:05', '-');
INSERT INTO `crimes`.`Crime_records`(`CrimeID`, `Crime_description`, `Area_ID`, `Date_and_time`, `Additional info`)VALUES  (9,'Stole artifacts from museum ', 9,'2015-12-11 03:50:00', '-');

INSERT INTO `crimes`.`Criminals`(`CriminalID`,`CrimeID`)VALUES (1, 1);
INSERT INTO `crimes`.`Criminals`(`CriminalID`,`CrimeID`)VALUES (3, 2);
INSERT INTO `crimes`.`Criminals`(`CriminalID`,`CrimeID`)VALUES (3, 3);
INSERT INTO `crimes`.`Criminals`(`CriminalID`,`CrimeID`)VALUES (1, 4);
INSERT INTO `crimes`.`Criminals`(`CriminalID`,`CrimeID`)VALUES (4, 5);
INSERT INTO `crimes`.`Criminals`(`CriminalID`,`CrimeID`)VALUES (5, 6);
INSERT INTO `crimes`.`Criminals`(`CriminalID`,`CrimeID`)VALUES (2, 7);
INSERT INTO `crimes`.`Criminals`(`CriminalID`,`CrimeID`)VALUES (3, 8);
INSERT INTO `crimes`.`Criminals`(`CriminalID`,`CrimeID`)VALUES (5, 9);


INSERT INTO `crimes`.`Victims`(`VictimID`,`CrimeID`)VALUES (6, 2);
INSERT INTO `crimes`.`Victims`(`VictimID`,`CrimeID`)VALUES (7, 2);
INSERT INTO `crimes`.`Victims`(`VictimID`,`CrimeID`)VALUES (8, 3);
INSERT INTO `crimes`.`Victims`(`VictimID`,`CrimeID`)VALUES (9, 3);
INSERT INTO `crimes`.`Victims`(`VictimID`,`CrimeID`)VALUES (10, 3);



