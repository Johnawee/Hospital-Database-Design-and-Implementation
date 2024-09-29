---INTRODUCTION
/*
I have been hired as the new database developer with Splendor_Analytics hospital. They are currently in the process of developing a 
new database system which they require for storing information on their patients, doctors, medical records 
(past appointments, diagnoses, medicines, medicine prescribed date, allergies), appointments, and departments.
In your initial consultation with the hospital, i was tasked to gather the information by creating the following tables to help in storing the hospital's records.

1. PATIENTS TABLE
2. APPOINTMENTS TABLE
3. MEDICAL_RECORDS
4. DOCTORS 
5. DEPARTMENTS
*/


CREATE DATABASE RebeccaHospitals --CREATING THE HOSPITALS DATABASE

USE RebeccaHospitals

/*CREATE A TABLE FOR THE PATIENTS WHICH INCLUDES; PATIENT ID(A UNIQUE IDENTIFIER FOR EACH PATIENT, 
FULL NAME, HOME ADDRESS, DATE OF BIRTH, AGE, INSURANCE, GENDER, EMAIL ADDRESS, PHONE NUMBER AND DATE LEFT (THE DAY THE PATIENT
DECIDES TO LEAVE THE HOSPITAL FOR GOOD)
constraints we will use in the course of creating this table are;
the NOT NULL constraint for informations that can't be overlooked like Full name, Home Address, Date of Birth, Age and Gender.
*/

CREATE TABLE Patients (
PatientID INT PRIMARY KEY IDENTITY (1,1),
	FullName VARCHAR(50) NOT NULL,
	HomeAddress VARCHAR(100) NOT NULL,
	DateOfBirth DATE NOT NULL,
	Age VARCHAR(2) NOT NULL,
	Insurance VARCHAR(100),
	Gender CHAR(1) DEFAULT ('M''F') NOT NULL,
	EmailAddress VARCHAR(100) UNIQUE,
	PhoneNumber VARCHAR(15) UNIQUE,
	DateLeft DATE
);

--INSERT INTO PATIENTS TABLE
INSERT INTO Patients (FullName, HomeAddress, DateOfBirth, Age, Insurance, Gender, EmailAddress, PhoneNumber, DateLeft)
VALUES
('John Doe', '123 Elm St, Springfield', '1980-01-15', '44', 'Blue Shield', 'M', 'john.doe@example.com', '555-0101', NULL),
('Jane Smith', '456 Oak St, Springfield', '1990-05-20', '34', 'Aetna', 'F', 'jane.smith@example.com', '555-0102', NULL),
('Michael Johnson', '789 Pine St, Springfield', '1975-03-30', '49', 'Cigna', 'M', 'michael.j@example.com', '555-0103', NULL),
('Emily Davis', '321 Maple St, Springfield', '1985-11-10', '38', 'United Health', 'F', 'emily.davis@example.com', '555-0104', NULL),
('Chris Brown', '654 Birch St, Springfield', '2000-06-25', '24', 'Blue Cross', 'M', 'chris.brown@example.com', '555-0105', NULL),
('Sarah Wilson', '987 Cedar St, Springfield', '1978-02-14', '46', 'HealthNet', 'F', 'sarah.wilson@example.com', '555-0106', NULL),
('David Martinez', '159 Spruce St, Springfield', '1995-12-05', '28', 'Anthem', 'M', 'david.martinez@example.com', '555-0107', NULL),
('Laura Garcia', '753 Fir St, Springfield', '1982-08-30', '41', 'Kaiser Permanente', 'F', 'laura.garcia@example.com', '555-0108', NULL),
('James Wilson', '951 Willow St, Springfield', '1965-09-22', '58', 'Humana', 'M', 'james.wilson@example.com', '555-0109', NULL),
('Linda Thompson', '258 Oak Ave, Springfield', '1970-04-18', '54', 'MediCare', 'F', 'linda.thompson@example.com', '555-0110', NULL),
('Robert Taylor', '369 Ash St, Springfield', '1988-01-12', '36', 'Medicaid', 'M', 'robert.taylor@example.com', '555-0111', NULL),
('Jennifer Anderson', '147 Chestnut St, Springfield', '1992-10-28', '31', 'Blue Shield', 'F', 'jennifer.anderson@example.com', '555-0112', NULL),
('William Harris', '258 Elm St, Springfield', '1981-06-19', '42', 'Aetna', 'M', 'william.harris@example.com', '555-0113', NULL),
('Patricia Clark', '369 Oak St, Springfield', '1977-07-05', '47', 'Cigna', 'F', 'patricia.clark@example.com', '555-0114', NULL),
('Charles Lewis', '741 Pine St, Springfield', '1968-03-17', '56', 'United Health', 'M', 'charles.lewis@example.com', '555-0115', NULL),
('Barbara Lee', '852 Birch St, Springfield', '1990-09-10', '34', 'Blue Cross', 'F', 'barbara.lee@example.com', '555-0116', NULL),
('Joseph Walker', '963 Cedar St, Springfield', '1986-11-23', '37', 'HealthNet', 'M', 'joseph.walker@example.com', '555-0117', NULL),
('Susan Hall', '147 Fir St, Springfield', '1974-02-11', '50', 'Anthem', 'F', 'susan.hall@example.com', '555-0118', NULL),
('Thomas Allen', '258 Spruce St, Springfield', '1983-12-30', '40', 'Kaiser Permanente', 'M', 'thomas.allen@example.com', '555-0119', NULL),
('Mary Young', '369 Maple St, Springfield', '1994-05-05', '30', 'Humana', 'F', 'mary.young@example.com', '555-0120', NULL),
('Daniel Hernandez', '789 Oak St, Springfield', '1987-08-12', '36', 'MediCare', 'M', 'daniel.hernandez@example.com', '555-0121', NULL),
('Jessica King', '654 Birch St, Springfield', '1993-03-25', '31', 'Medicaid', 'F', 'jessica.king@example.com', '555-0122', NULL),
('Matthew Wright', '321 Pine St, Springfield', '1985-07-22', '39', 'Blue Shield', 'M', 'matthew.wright@example.com', '555-0123', NULL),
('Sarah Scott', '987 Elm St, Springfield', '1991-06-11', '32', 'Aetna', 'F', 'sarah.scott@example.com', '555-0124', NULL),
('Mark Green', '753 Maple St, Springfield', '1984-09-15', '39', 'Cigna', 'M', 'mark.green@example.com', '555-0125', NULL),
('Angela Adams', '159 Cedar St, Springfield', '1989-04-29', '35', 'United Health', 'F', 'angela.adams@example.com', '555-0126', NULL),
('Paul Nelson', '258 Birch St, Springfield', '1980-01-02', '44', 'Blue Cross', 'M', 'paul.nelson@example.com', '555-0127', NULL),
('Laura Carter', '369 Spruce St, Springfield', '1996-05-18', '28', 'HealthNet', 'F', 'laura.carter@example.com', '555-0128', NULL),
('Kevin Mitchell', '741 Elm St, Springfield', '1979-11-11', '44', 'Anthem', 'M', 'kevin.mitchell@example.com', '555-0129', NULL),
('Dorothy Perez', '852 Oak St, Springfield', '1992-07-04', '32', 'Kaiser Permanente', 'F', 'dorothy.perez@example.com', '555-0130', NULL),
('George Roberts', '963 Pine St, Springfield', '1988-10-14', '35', 'Humana', 'M', 'george.roberts@example.com', '555-0131', NULL),
('Michelle Turner', '147 Cedar St, Springfield', '1973-08-21', '50', 'MediCare', 'F', 'michelle.turner@example.com', '555-0132', NULL),
('Steven Phillips', '258 Birch St, Springfield', '1982-12-09', '41', 'Medicaid', 'M', 'steven.phillips@example.com', '555-0133', NULL),
('Angela Campbell', '369 Oak St, Springfield', '1994-03-13', '30', 'Blue Shield', 'F', 'angela.campbell@example.com', '555-0134', NULL),
('Jason Parker', '741 Maple St, Springfield', '1980-06-28', '43', 'Aetna', 'M', 'jason.parker@example.com', '555-0135', NULL),
('Helen Edwards', '852 Fir St, Springfield', '1987-10-10', '36', 'Cigna', 'F', 'helen.edwards@example.com', '555-0136', NULL),
('Ryan Rivera', '963 Elm St, Springfield', '1978-01-17', '46', 'United Health', 'M', 'ryan.rivera@example.com', '555-0137', NULL),
('Rebecca Collins', '147 Maple St, Springfield', '1991-02-28', '33', 'Blue Cross', 'F', 'rebecca.collins@example.com', '555-0138', NULL),
('Eric Stewart', '258 Pine St, Springfield', '1985-04-05', '39', 'HealthNet', 'M', 'eric.stewart@example.com', '555-0139', NULL),
('Laura Morris', '369 Cedar St, Springfield', '1995-07-19', '29', 'Anthem', 'F', 'laura.morris@example.com', '555-0140', NULL),
('Henry Hughes', '741 Birch St, Springfield', '1971-09-30', '52', 'Kaiser Permanente', 'M', 'henry.hughes@example.com', '555-0141', NULL),
('Kimberly Price', '852 Oak St, Springfield', '1988-12-11', '35', 'Humana', 'F', 'kimberly.price@example.com', '555-0142', NULL),
('Anthony Brooks', '963 Fir St, Springfield', '1976-05-23', '48', 'MediCare', 'M', 'anthony.brooks@example.com', '555-0143', NULL);


SELECT * FROM Patients

/*CREATE A TABLE FOR THE DEPARTMENTS WHICH INCLUDES; DEPARTMENT ID(A UNIQUE IDENTIFIER FOR EACH DEPARTMENT AND DEPARTMENT NAME
constraints we will use in the course of creating this table are;
the NOT NULL constraint for THE DEPARTMENT NAME AS IT IS EXPECTED THAT ALL DEPARTMENTS INM THE HOSPITAL HAVE A NAME.
*/

CREATE TABLE Departments (
	DepartmentID INT PRIMARY KEY IDENTITY,
	DepartmentName VARCHAR(20) NOT NULL,
);

--INSERT INTO DEPARTMENT TABLE
INSERT INTO Departments (DepartmentName)
VALUES
('Cardiology'),
('Neurology'),
('Pediatrics'),
('Oncology'),
('Orthopedics'),
('Gastroenterology'),
('Dermatology'),
('Radiology'),
('Emergency Medicine');


SELECT * FROM Departments


/*CREATE A TABLE FOR THE DOCTORS WHICH INCLUDES; DOCTORS ID(A UNIQUE IDENTIFIER FOR EACH DOCTOR, 
DOCTOR NAME, DEPARTMENT ID(WHICH IS A FOREIGN KEY GOTTEN FROM THE DEPARTMENT TABLE, SPECIALTY(THE AREA OF MEDICINE THE DOCTOR SPECIALIZES IN),
EMAIL ADDRESS AND PHONE NUMBER
constraints we will use in the course of creating this table are;
the NOT NULL constraint for informations that can't be overlooked like Full name, EMAIL ADDRESS, SPECIALTY AND PHONE NUMBER.
*/

CREATE TABLE Doctors (
	DoctorID INT PRIMARY KEY IDENTITY,
	DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID),
	DoctorName VARCHAR(30) NOT NULL,
	Specialty VARCHAR(20) NOT NULL,
	EmailAddress VARCHAR(50) NOT NULL,
	PhoneNumber VARCHAR(15) NOT NULL
);

--INSERTING INTO DOCTORS TABLE
INSERT INTO Doctors (DepartmentID, DoctorName, Specialty, EmailAddress, PhoneNumber)
VALUES
(1, 'Dr. John Smith', 'Cardiology', 'john.smith@hospital.com', '555-0001'),
(2, 'Dr. Jane Doe', 'Neurology', 'jane.doe@hospital.com', '555-0002'),
(3, 'Dr. Emily White', 'Pediatrics', 'emily.white@hospital.com', '555-0003'),
(4, 'Dr. Robert Brown', 'Oncology', 'robert.brown@hospital.com', '555-0004'),
(5, 'Dr. Michael Green', 'Orthopedics', 'michael.green@hospital.com', '555-0005'),
(6, 'Dr. Sarah Johnson', 'Gastroenterology', 'sarah.johnson@hospital.com', '555-0006'),
(7, 'Dr. David Lee', 'Dermatology', 'david.lee@hospital.com', '555-0007'),
(8, 'Dr. Laura Taylor', 'Radiology', 'laura.taylor@hospital.com', '555-0008'),
(9, 'Dr. Daniel Martinez', 'Emergency Medicine', 'daniel.martinez@hospital.com', '555-0009'),
(1, 'Dr. Jessica Thompson', 'Cardiology', 'jessica.thompson@hospital.com', '555-0010'),
(2, 'Dr. William Harris', 'Neurology', 'william.harris@hospital.com', '555-0011'),
(3, 'Dr. Patricia Lewis', 'Pediatrics', 'patricia.lewis@hospital.com', '555-0012'),
(4, 'Dr. Christopher Walker', 'Oncology', 'christopher.walker@hospital.com', '555-0013'),
(5, 'Dr. Angela Hall', 'Orthopedics', 'angela.hall@hospital.com', '555-0014'),
(6, 'Dr. Kevin Young', 'Gastroenterology', 'kevin.young@hospital.com', '555-0015'),
(7, 'Dr. Nancy King', 'Dermatology', 'nancy.king@hospital.com', '555-0016'),
(8, 'Dr. Brian Wright', 'Radiology', 'brian.wright@hospital.com', '555-0017'),
(9, 'Dr. Rebecca Scott', 'Emergency Medicine', 'rebecca.scott@hospital.com', '555-0018');


SELECT * FROM Doctors


/*CREATE A TABLE FOR THE MEDICAL RECORDS WHICH INCLUDES; MEDICAL ID(A UNIQUE IDENTIFIER FOR EACH RECORD, 
PATIENT ID, DOCTOR ID,PAST APPOINTMENT, DIAGNOSES, MEDICINES, MEDICINE PRESCRIBED DATE,
AND ALLERGIES
*/

CREATE TABLE MedicalRecords (
	MedicalID INT PRIMARY KEY IDENTITY,
	PatientID INT FOREIGN KEY REFERENCES Patients(PatientID),
	DoctorID INT FOREIGN KEY REFERENCES Doctors(DoctorID),
	PastAppointment DATE,
	Diagnoses VARCHAR(100),
	Medicines VARCHAR(50),
	MedicinePrescribedDate DATE,
	Allergies VARCHAR(50),
);

--INSERT THE MEDICAL RECORDS
INSERT INTO MedicalRecords (PatientID, DoctorID, PastAppointment, Diagnoses, Medicines, MedicinePrescribedDate, Allergies)
VALUES
(1, 4, '2023-01-15', 'Hypertension', 'Lisinopril', '2023-01-16', NULL),
(2, 1, '2022-12-10', 'Diabetes', 'Metformin', '2022-12-11', 'Peanuts'),
(3, 6, '2023-02-22', 'Common Cold', 'Antihistamine', '2023-02-23', 'Penicillin'),
(4, 5, '2022-11-05', 'Anemia', 'Iron Supplements', '2022-11-06', NULL),
(5, 3, '2023-03-17', 'Cancer', 'Chemotherapy', '2023-03-18', 'Aspirin'),
(6, 7, '2023-04-21', 'Allergy', 'Antihistamine', '2023-04-22', 'Dust'),
(7, 2, '2022-10-29', 'Asthma', 'Inhaler', '2022-10-30', NULL),
(8, 8, '2023-05-15', 'Flu', 'Tamiflu', '2023-05-16', 'Shellfish'),
(9, 4, '2023-01-02', 'Cancer', 'Radiation Therapy', '2023-01-03', 'Latex'),
(10, 1, '2022-12-01', 'Gastroenteritis', 'Proton Pump Inhibitor', '2022-12-02', NULL),
(11, 6, '2023-06-10', 'Allergy', 'Epinephrine', '2023-06-11', 'Bee Stings'),
(12, 5, '2023-02-12', 'Back Pain', 'Muscle Relaxant', '2023-02-13', NULL),
(13, 7, '2022-09-30', 'Diabetes', 'Insulin', '2022-10-01', 'Wheat'),
(14, 3, '2022-11-20', 'Anxiety', 'Sertraline', '2022-11-21', NULL),
(15, 2, '2023-03-30', 'Hypertension', 'Amlodipine', '2023-03-31', NULL),
(16, 6, '2022-08-15', 'Cancer', 'Chemotherapy', '2022-08-16', 'Sulfa Drugs'),
(17, 1, '2023-01-12', 'Allergy', 'Antihistamine', '2023-01-13', NULL),
(18, 4, '2023-02-01', 'Cancer', 'Radiation Therapy', '2023-02-02', 'Pollen'),
(19, 5, '2023-04-05', 'Heartburn', 'Proton Pump Inhibitor', '2023-04-06', NULL),
(20, 2, '2022-11-11', 'Asthma', 'Inhaler', '2022-11-12', NULL),
(21, 3, '2023-05-25', 'Cold', 'Decongestant', '2023-05-26', NULL),
(22, 6, '2023-06-05', 'Allergy', 'Antihistamine', '2023-06-06', 'Grass'),
(23, 4, '2022-10-05', 'Cancer', 'Chemotherapy', '2022-10-06', 'None'),
(24, 1, '2023-03-14', 'Flu', 'Tamiflu', '2023-03-15', NULL),
(25, 5, '2023-07-20', 'Arthritis', 'NSAIDs', '2023-07-21', NULL),
(26, 8, '2022-09-15', 'Allergy', 'Epinephrine', '2022-09-16', 'Fish'),
(27, 9, '2023-01-01', 'Cold', 'Cough Syrup', '2023-01-02', NULL),
(28, 3, '2022-08-18', 'Anemia', 'Iron Supplements', '2022-08-19', NULL),
(29, 4, '2022-12-15', 'Cancer', 'Radiation Therapy', '2022-12-16', NULL),
(30, 6, '2023-05-05', 'Diabetes', 'Metformin', '2023-05-06', NULL),
(31, 2, '2023-02-25', 'Allergy', 'Antihistamine', '2023-02-26', 'Mold'),
(32, 1, '2022-07-30', 'Gastroenteritis', 'Proton Pump Inhibitor', '2022-07-31', NULL),
(33, 5, '2023-01-18', 'Flu', 'Tamiflu', '2023-01-19', NULL),
(34, 4, '2023-03-11', 'Cancer', 'Chemotherapy', '2023-03-12', 'None'),
(35, 6, '2022-11-02', 'Asthma', 'Inhaler', '2022-11-03', NULL),
(36, 7, '2023-05-22', 'Anxiety', 'Sertraline', '2023-05-23', NULL),
(37, 8, '2023-04-15', 'Back Pain', 'Muscle Relaxant', '2023-04-16', 'Citrus'),
(38, 1, '2022-08-01', 'Cold', 'Decongestant', '2022-08-02', NULL),
(39, 9, '2022-10-25', 'Heartburn', 'Proton Pump Inhibitor', '2022-10-26', NULL),
(40, 4, '2023-06-30', 'Cancer', 'Radiation Therapy', '2023-07-01', NULL),
(41, 2, '2023-05-01', 'Allergy', 'Epinephrine', '2023-05-02', 'Insect Stings'),
(42, 3, '2023-01-05', 'Asthma', 'Inhaler', '2023-01-06', NULL),
(43, 8, '2023-03-20', 'Anemia', 'Iron Supplements', '2023-03-21', NULL);


SELECT * FROM MedicalRecords

/*CREATE A TABLE FOR THE APPOINTMENTS WHICH INCLUDES; APOINTMENT ID(A UNIQUE IDENTIFIER FOR EACH APPOINTMENT, 
PATIENT ID, DOCTOR ID,DEPARTMENT ID, APPOINTMENT DATE, APPOINTMENT TIME AND APPOINTMENT STATUS
THE NOT NULL CONSTRAINT IS USED IN THE TABLE FOR THE APPOINTMENT DATE AND TIME WHICH HAS TO BE KNOWN FOR AN APPOINTMNET TO TAKE PLACE
*/

CREATE TABLE Appointments (
	AppointmentID INT PRIMARY KEY IDENTITY (1,1),
	PatientID INT FOREIGN KEY REFERENCES Patients(PatientID),
	DoctorID INT FOREIGN KEY REFERENCES Doctors(DoctorID),
	DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID),
	AppointmentDate DATE NOT NULL,
	AppointmentTime TIME NOT NULL,
	AppointmentStatus VARCHAR(10) DEFAULT('Pending''Canceled''Completed'),
);

-- Insert appointments
INSERT INTO Appointments (PatientID, DoctorID, DepartmentID, AppointmentDate, AppointmentTime, AppointmentStatus)
VALUES
(1, 4, 1, '2024-09-25', '09:00', 'Completed'),
(2, 1, 2, '2024-09-25', '10:00', 'Canceled'),
(3, 6, 3, '2024-09-25', '11:00', 'Completed'),
(4, 5, 4, '2024-09-25', '12:00', 'Completed'),
(5, 3, 5, '2024-09-25', '13:00', 'Canceled'),
(6, 7, 6, '2024-09-26', '09:00', 'Pending'),
(7, 2, 7, '2024-09-26', '10:00', 'Pending'),
(8, 8, 8, '2024-09-26', '11:00', 'Pending'),
(9, 4, 1, '2024-09-27', '09:00', 'Pending'),
(10, 1, 2, '2024-09-27', '10:00', 'Pending'),
(11, 6, 3, '2024-09-27', '11:00', 'Pending'),
(12, 5, 4, '2024-09-27', '12:00', 'Pending'),
(13, 7, 5, '2024-09-25', '14:00', 'Canceled'),
(14, 3, 6, '2024-09-25', '15:00', 'Completed'),
(15, 2, 7, '2024-09-26', '09:30', 'Pending'),
(16, 6, 8, '2024-09-26', '10:30', 'Pending'),
(17, 1, 1, '2024-09-27', '14:00', 'Pending'),
(18, 4, 2, '2024-09-27', '15:00', 'Pending'),
(19, 5, 3, '2024-09-25', '09:15', 'Completed'),
(20, 2, 4, '2024-09-25', '10:15', 'Canceled'),
(21, 3, 5, '2024-09-26', '11:15', 'Pending'),
(22, 6, 6, '2024-09-26', '12:15', 'Pending'),
(23, 4, 7, '2024-09-27', '13:15', 'Pending'),
(24, 1, 8, '2024-09-25', '14:15', 'Completed'),
(25, 5, 1, '2024-09-25', '15:15', 'Canceled'),
(26, 8, 2, '2024-09-26', '09:45', 'Pending'),
(27, 9, 3, '2024-09-27', '10:45', 'Pending'),
(28, 3, 4, '2024-09-27', '11:45', 'Pending'),
(29, 4, 5, '2024-09-25', '12:45', 'Completed'),
(30, 6, 6, '2024-09-26', '13:45', 'Pending'),
(31, 2, 7, '2024-09-27', '14:45', 'Pending'),
(32, 1, 8, '2024-09-25', '15:45', 'Canceled'),
(33, 5, 1, '2024-09-26', '09:30', 'Pending'),
(34, 4, 2, '2024-09-26', '10:30', 'Pending'),
(35, 6, 3, '2024-09-27', '11:30', 'Pending'),
(36, 7, 4, '2024-09-27', '12:30', 'Pending'),
(37, 8, 5, '2024-09-25', '13:30', 'Completed'),
(38, 1, 6, '2024-09-25', '14:30', 'Canceled'),
(39, 9, 7, '2024-09-26', '15:30', 'Pending'),
(40, 4, 8, '2024-09-27', '09:00', 'Pending'),
(41, 2, 1, '2024-09-27', '10:00', 'Pending'),
(42, 3, 2, '2024-09-25', '11:00', 'Canceled'),
(43, 8, 3, '2024-09-26', '12:00', 'Pending');

SELECT * FROM Appointments

--QUESTION 1.	Add the constraint to check that the appointment date is not in the past.

/* AN UPDATE HAD TO BE MADE TO THE APPOINTMNET TABLE BECAUSE SOME OF THE APPOINMENT DATES WEREN'T IN THE PRESENT,
MAKING IT IMPOSSIBLE FOR THE QUERY TO ENSURE ALL THE APPOINTMENT DATES WERE IN THE FUTURE
*/
--UPDATE APPOINMENT DATES THAT ARE NOT IN THE FUTURE USING THE SET COMMAND AND UPDATE STATEMENT
UPDATE Appointments
SET AppointmentDate = GETDATE() + 1  -- This is a query to set the appointment dates in the past to a future date
WHERE AppointmentDate <= GETDATE();

--ALTER APPOINTMENTS USING CHECK CONSTRAINT 
ALTER TABLE Appointments
ADD CONSTRAINT AppointmentDate --This is the query to check if the appointment dates are in the future
CHECK (AppointmentDate >= GETDATE());

-- QUESTION 2.	List all the patients who are older than 40 and have cancer in their diagnosis.

SELECT * FROM MedicalRecords, Patients
WHERE Age > 40
  AND Diagnoses LIKE '%cancer%'; --This query lists the number of patients that are over 40 and are diagnosed with cancer

--QUESTION 3.	Write a select query that allows the hospital to identify the number of completed appointments 
--with the specialty of doctors as ‘Gastroenterologists’.

SELECT COUNT(*) AS NumberCompletedAppointments 
FROM Appointments A
JOIN Doctors D ON A.DoctorID = D.DoctorID
WHERE A.AppointmentStatus = 'Completed'AND D.Specialty = 'Gastroenterology';-- This query checks for the appointments with a gastroenterologist and lists the appointments


--From the above query and result only one appointment was completed from appointment for specialty Gastroenterology.


