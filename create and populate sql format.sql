--
-- File generated with SQLiteStudio v3.3.3 on Tue May 10 18:58:13 2022
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Absences
CREATE TABLE Absences(  

EmployeID INT,  

Starts DATETIME,  

Ends DATETIME, 

FOREIGN KEY (EmployeID) REFERENCES Employe (ID)  

);
INSERT INTO Absences (EmployeID, Starts, Ends) VALUES (1000, '09/01/2022 00:00:00:000', '10/01/2022 00:07:00:000');

-- Table: Car
CREATE TABLE Car(  

LicenNum CHAR(50) PRIMARY KEY,  

Distance INT

);
INSERT INTO Car (LicenNum, Distance) VALUES ('ABC-123', 40000);
INSERT INTO Car (LicenNum, Distance) VALUES ('BVC-123', 800000);

-- Table: Customer
CREATE TABLE Customer( 

CurstomerID INT PRIMARY KEY, 

LicenNum CHAR(50), 

Name CHAR(50), 

Phone INT, 

Mail VARCHAR(319), 

Address CHAR(200), 

FOREIGN KEY (LicenNum) REFERENCES Car(LicenNum) 

);
INSERT INTO Customer (CurstomerID, LicenNum, Name, Phone, Mail, Address) VALUES (123, 'ABC-123', 'AlliSmith', 4081688, 'homer@home.com', 'Mistdrive 15');
INSERT INTO Customer (CurstomerID, LicenNum, Name, Phone, Mail, Address) VALUES (456, 'BVC-123', 'Trudoro', 4088779, 'dseer@hpre.com', 'Doomdrive 98');

-- Table: Device
CREATE TABLE Device( 

DeviceID INT PRIMARY KEY, 

DeviceType CHAR(50), 

AvabilityDateAndTime DATETIME);
INSERT INTO Device (DeviceID, DeviceType, AvabilityDateAndTime) VALUES (1, 'Hoister', '01/02/2022 00:00:00:000');

-- Table: Employe
CREATE TABLE Employe(  

ID INT PRIMARY KEY,  

Name CHAR(50), 

AvabiliDateAndTime DATETIME 

);
INSERT INTO Employe (ID, Name, AvabiliDateAndTime) VALUES (88, 'James Creew', '01/01/2022 00:00:00:000');
INSERT INTO Employe (ID, Name, AvabiliDateAndTime) VALUES (1000, 'Veeti Hakkinen', '2021-05-23T14:25:10');

-- Table: Invoice
CREATE TABLE Invoice(  

OrderID INT PRIMARY KEY,  

CustomerID INT,  

EmployeID INT,  

Hours INT,  

Deadline DATETIME,  

Status CHAR(30),  

OriginalSum INT, 

NewSum INT DEFAULT OriginalSum,  

RemindersNo INT DEFAULT 0 

);
INSERT INTO Invoice (OrderID, CustomerID, EmployeID, Hours, Deadline, Status, OriginalSum, NewSum, RemindersNo) VALUES (123, 123, 88, 48, '01/01/2022 00:00:00:000', 'unpaid', 1000, 1000, 1);
INSERT INTO Invoice (OrderID, CustomerID, EmployeID, Hours, Deadline, Status, OriginalSum, NewSum, RemindersNo) VALUES (456, 456, 1000, 48, '04/01/2022 00:00:00:000', 'unpaid', 1000, 1000, 0);

-- Table: Operation
CREATE TABLE Operation( 

Duration INT , 

OpreationName CHAR(50), 

Distance INT, 

ReqDevice CHAR(50) );
INSERT INTO Operation (Duration, OpreationName, Distance, ReqDevice) VALUES (3, 'Take engine out', NULL, 'Hoister');
INSERT INTO Operation (Duration, OpreationName, Distance, ReqDevice) VALUES (4, 'Put engine in', NULL, 'Hoister');
INSERT INTO Operation (Duration, OpreationName, Distance, ReqDevice) VALUES (4, 'Oil changet', 60000, NULL);

-- Table: Owner
CREATE TABLE Owner( 

LicenNum CHAR(50), 

Name CHAR(50), 

FOREIGN KEY (LicenNum) REFERENCES Car(LicenNum) 

);
INSERT INTO Owner (LicenNum, Name) VALUES ('ABC-123', 'Mary Holinen');
INSERT INTO Owner (LicenNum, Name) VALUES ('ABC-123', 'Jake Harin');

-- Table: Regular_maintenance
CREATE TABLE Regular_maintenance( 

Distance INT , 

OrderID INT, 

LicenNum CHAR(50) , 

DurationTotal INT, 

FOREIGN KEY (LicenNum) REFERENCES Car(LicenNum), 

FOREIGN KEY (OrderID) REFERENCES Invoice(OrderID));
INSERT INTO Regular_maintenance (Distance, OrderID, LicenNum, DurationTotal) VALUES (70000, 456, 'BVC-123', 4);

-- Table: Reminder
CREATE TABLE Reminder(  

OrderID INT ,  

Extra INT,  

NewSum INT, 

FOREIGN KEY (OrderID) REFERENCES Invoice(OrderID) 

);
INSERT INTO Reminder (OrderID, Extra, NewSum) VALUES (123, 320, 1320);
INSERT INTO Reminder (OrderID, Extra, NewSum) VALUES (456, 70, 1070);
INSERT INTO Reminder (OrderID, Extra, NewSum) VALUES (456, 70, 1140);

-- Table: Repair
CREATE TABLE Repair(  

RepairName CHAR(50),  

OrderID INT ,  

LicenNum CHAR(50), 

DurationTotal INT,  

FOREIGN KEY (LicenNum) REFERENCES Car(LicenNum),  

FOREIGN KEY (OrderID) REFERENCES Invoice(OrderID)  

);
INSERT INTO Repair (RepairName, OrderID, LicenNum, DurationTotal) VALUES ('Engine swap', 123, 'ABC-123', 7);

-- Table: Reservation_of_operation
CREATE TABLE Reservation_of_operation(  

OrderID INT , 

EmployeID INT, 

DeviceID INT, 

Starts DATETIME,  

Ends DATETIME,  

FOREIGN KEY (OrderID) REFERENCES Invoice(OrderID), 

FOREIGN KEY (EmployeID) REFERENCES Employe(ID), 

FOREIGN KEY (DeviceID) REFERENCES Device (DeviceID) 

);
INSERT INTO Reservation_of_operation (OrderID, EmployeID, DeviceID, Starts, Ends) VALUES (123, 1000, NULL, '02/01/2022 00:00:00:000', '03/01/2022 00:07:00:000');
INSERT INTO Reservation_of_operation (OrderID, EmployeID, DeviceID, Starts, Ends) VALUES (123, NULL, 1, '02/01/2022 00:00:00:000', '03/01/2022 00:07:00:000');

-- Table: SparePart
CREATE TABLE SparePart( 

OrderID INT, 

Partnumber INT, 

Amount INT, 

Sum INT, 

FOREIGN KEY (OrderID) REFERENCES Invoice(OrderID) 

);
INSERT INTO SparePart (OrderID, Partnumber, Amount, Sum) VALUES (123, 11427, 2, 70);

-- Index: DeviceType
CREATE INDEX DeviceType on Device(DeviceType);

-- Index: Reminders
CREATE INDEX Reminders on Reminder(OrderID);

-- View: HistoryOFLicenNum123
CREATE VIEW HistoryOFLicenNum123 AS  

SELECT OrderID  

FROM Repair, Regular_maintenance

WHERE Car.LicenNum="ABC-123";

-- View: PartsForOrder123
CREATE VIEW PartsForOrder123 AS 

SELECT *  

FROM SparePart 

WHERE OrderID=123;

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
