# Hospital Database Design and Implementation
## Project Overview
This repository contains the **Database Design and Implementation** for **Rebecca Hospital**, complete by **Splendor Analytics** in Spetember 2024. The system is designed to efficiently manage hospital data, including patient information, doctor details, medical records, appointments and department data.

---

##Table of Contents
1. [Introduction](#introduction)
2. [Database Design Process](#database-design-process)
   - [Requirements Gathering](#requirements-gathering)
   - [Conceptual Design](#conceptual-design)
   - [Logical Design](#logical-design)
   - [Physical Design](#physical-design)
3. [Database Schema and Implementation](#database-schema-and-implementation)
   - [Patients Table](#patients-table)
   -[Departments Table](#departments-table)
   - [Medical Records Table](#medical-records-table)
   - [Doctors Table](#doctors-table)
   - [Appointments Table](#appointments-table)
4. [Normalization](#normalization)
   - [First Normal Form](#first-normal-form)
   - [Second Normal Form](#second-normal-form)
   - [Third Normal Form](#third-normal-form)
5. [Triggers and Business Logic](#triggers-and-business-logic)
6. [Justification of Design Choices](justification-of-design-choices)

---
## Intoduction

---
## Database Design Process
### Requirement Gathering


### Conceptual Design

### Logical Design
### Physical Design

===
## Database Schema and Implementation
### Patients Table
 
| Column         | Data Type   | Constraints                   |
|----------------|-------------|-------------------------------|
| PatientId      | INT         | PRIMARY KEY, AUTO-INCREMENT    |
| Prefix         | VARCHAR(10) |                               |
| FirstName      | VARCHAR(50) | NOT NULL                      |
| LastName       | VARCHAR(50) | NOT NULL                      |
| DateOfBirth    | DATE        | NOT NULL                      |
| Insurance      | VARCHAR(50) |                               |
| Gender         | CHAR(1)     | CHECK (Gender IN 'M', 'F', 'O')|
| MaritalStatus  | VARCHAR(20) | CHECK (IN 'Single', 'Married')|
| EmailAddress   | VARCHAR(100)| UNIQUE                        |
| PhoneNumber    | VARCHAR(15) | UNIQUE                        |

### Departments Table

| Column         | Data Type   | Constraints                   |
|----------------|-------------|-------------------------------|
| DepartmentId   | INT         | PRIMARY KEY, AUTO-INCREMENT    |
| DepartmentName | VARCHAR(50) | NOT NULL                      |
 
### Medical Records Table

| Column          | Data Type   | Constraints                   |
|-----------------|-------------|-------------------------------|
| RecordId        | INT         | PRIMARY KEY, AUTO-INCREMENT    |
| PatientId       | INT         | FOREIGN KEY REFERENCES Patients|
| DepartmentId    | INT         | FOREIGN KEY REFERENCES Departments |
| DiagnosisHistory| TEXT        |                               |
| StartDate       | DATE        |                               |
| EndDate         | DATE        |                               |

### Dcotors Table

| Column         | Data Type   | Constraints                   |
|----------------|-------------|-------------------------------|
| DoctorId       | INT         | PRIMARY KEY, AUTO-INCREMENT    |
| FirstName      | VARCHAR(20) |                               |
| Speciality     | VARCHAR(50) |                               |
| DepartmentId   | INT         | FOREIGN KEY REFERENCES Departments|

### Appointments Table

| Column         | Data Type   | Constraints                   |
|----------------|-------------|-------------------------------|
| AppointmentId  | INT         | PRIMARY KEY, AUTO-INCREMENT    |
| DoctorId       | INT         | FOREIGN KEY REFERENCES Doctors |
| PatientId      | INT         | FOREIGN KEY REFERENCES Patients|
| Date           | DATE        | NOT NULL                      |
| Status         | VARCHAR(50) | CHECK (IN 'Scheduled', 'Completed')|

---
## Normalization
### First Normal Form
### Second Normal Form
### Third Normal Form

---
## Triggers and Business Logic

---
## Justification of Design Choice
