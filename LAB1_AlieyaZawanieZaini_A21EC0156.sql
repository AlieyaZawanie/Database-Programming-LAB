create database lab1_dbPGr;
use lab1_dbPGr;

CREATE TABLE STAFF (
    Staff_ID INT AUTO_INCREMENT PRIMARY KEY,
    Staff_Name CHAR(100) NOT NULL,
    Address VARCHAR(200) NOT NULL,
    Position_Grade VARCHAR(2),
    FOREIGN KEY (Position_Grade) REFERENCES POSITION (Position_Grade)
);
   
SELECT * FROM STAFF;
INSERT INTO STAFF (Staff_Name, Address, Position_Grade) VALUES
('ALIEYA', 'KTDI', 'G2');

 CREATE TABLE POSITION (
    Position_Grade VARCHAR(10) CHECK (Position_Grade IN ('G1', 'G2', 'G3', 'G4')) ,
    Position_Name VARCHAR(60) NOT NULL,
    Increment DECIMAL(10, 2) NOT NULL,
	PRIMARY KEY (Position_Grade)
 );
SELECT * FROM Position;
INSERT INTO Position (Position_Grade, Position_Name, Increment)
VALUES ('G2', 'Fresh Grad', 100);
 

CREATE TABLE EMOLUMENT_RECORD (
    Start_Date DATE,
    Staff_ID INT,
    Wage_Type_ID INT,
    Wage_Amount DECIMAL(10, 2) CHECK (Wage_Amount > 0),
    End_Date DATE,
    PRIMARY KEY (Start_Date, Staff_ID, Wage_Type_ID),
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID),
    FOREIGN KEY (Wage_Type_ID) REFERENCES Wage_Type(Wage_Type_ID)
);
SELECT * FROM EMOLUMENT_RECORD;
INSERT INTO EMOLUMENT_RECORD (Start_Date, Staff_ID, Wage_Type_ID, Wage_Amount, End_Date)
VALUES ('2023-10-26', 8, 1001, 5000.00, '2024-10-26');

 CREATE TABLE Wage_Type (
    Wage_Type_ID INT PRIMARY KEY  CHECK (Wage_Type_ID >= 1001 AND Wage_Type_ID <= 2999) ,
    Wage_Desc VARCHAR(100) NOT NULL
);

SELECT * FROM Wage_Type;
INSERT INTO Wage_Type (Wage_Type_ID, Wage_Desc)
VALUES
(1001, 'Basic Pay'),
(1002, 'Allowance'),
(1003, 'Overtime Pay'),
(1004, 'Bonus');
