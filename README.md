# Hospital Database Design and Implementation
## Project Overview
This repository contains the **Database Design and Implementation** for **Rebecca Hospital**, complete by **John Ikediashi** in Spetember 2024. The system is designed to efficiently manage hospital data, including patient information, doctor details, medical records, appointments and department data.

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
Rebecca Hospitals required a scalable solution to engage its healthcare operations, including patient registration, appointment scheduling, and medical management. This system enhances operational efficiency, ensures data integrity and provides quick access to essential information for medical staff.

---
## Database Design Process
### Requirement Gathering
In collaboration withstakeholders, the following requirements were established:
- Comprehensive details of patients, doctors and departments.
- Management of medical records (diagnoses, prescriptions, and treatment history).
- Real-time appointment scheduling and tracking.

### Conceptual Design
Using Enitiy-Relationship (ER) model, the following entities were defined:
- **Patients**: Personal and contact details.
- **Doctors**: Names, specialties, and availability
- **Medical Records**: Historical records of diagnoses and medications.
- **Appointments**: Scheduling and status
- **Departments**: Organizational structure for medical departments.
  
### Logical Design
The conceptual ER model was translated into structural relational database tables with appropriate relationships. Foreign keys were used to maintain referential integrity.

### Physical Design
This system was implemented using T-SQL on SQL server. Key features include:
- Triggers for appointment status updates.
- Constraints to ensure data accuracy.
- Optimized queries for performance.

---
## Database Schema and Implementation
### Patients Table
![image](https://github.com/user-attachments/assets/6bd33fde-a5c6-4766-81e0-6ae35057e920)

 
| Column         | Data Type   | Constraints                   |
|----------------|-------------|-------------------------------|
| PatientId      | INT         | PRIMARY KEY, AUTO-INCREMENT    |
|FullName        | VARCHAR(100)| NOT NULL                       |
| HomeAddress    | VARCHAR(50) | NOT NULL                      |
| DateOfBirth    | DATE        | NOT NULL                      |
| Age            | VARCHAR(2)  | NOT NULL                      |
| Insurance      | VARCHAR(100)|                               |
| Gender         | CHAR(1)     | DEFAULT ('M', 'F')            |
| EmailAddress   | VARCHAR(100)| UNIQUE                        |
| PhoneNumber    | VARCHAR(15) | UNIQUE                        |
| DateLeft       | DATE        |                               |

### Departments Table
| Column         | Data Type   | Constraints                   |
|----------------|-------------|-------------------------------|
| DepartmentId   | INT         | PRIMARY KEY, AUTO-INCREMENT    |
| DepartmentName | VARCHAR(20) | NOT NULL                      |

### Dcotors Table

| Column         | Data Type   | Constraints                   |
|----------------|-------------|-------------------------------|
| DoctorId       | INT         | PRIMARY KEY, AUTO-INCREMENT    |
| DepartmentId   | INT         | FOREIGN KEY REFERENCES Departments|
| DoctorName     | VARCHAR(30) | NOT NULL                      |
| Speciality     | VARCHAR(20) | NOT NULL                      |
| EmailAddress   | VARCHAR(50) | NOT NULL                      |
| PhoneNumber    | VARCHAR(15) |NOT NULL                       |
 
### Medical Records Table

| Column                | Data Type   | Constraints                   |
|-----------------------|-------------|-------------------------------|
| MedicalId             | INT         | PRIMARY KEY, AUTO-INCREMENT    |
| PatientId             | INT         | FOREIGN KEY REFERENCES Patients|
| DoctorId              | INT         | FOREIGN KEY REFERENCES Doctors |
| PastAppointment       | DATE        |                               |
| Diagnoses             | VARCHAR(100)|                               |
| Medicines             | VARCHAR(50) |                               |
| MedicinePrescribedDate| DATE        |                               |
| Allergies             | VARCHAR(50) |                               |



### Appointments Table

| Column         | Data Type   | Constraints                   |
|----------------|-------------|-------------------------------|
| AppointmentId  | INT         | PRIMARY KEY, AUTO-INCREMENT    |
| PatientId      | INT         | FOREIGN KEY REFERENCES Patients|
| DoctorId       | INT         | FOREIGN KEY REFERENCES Doctors |
| DepartmentId   | INT         | FOREIGN KEY REFERENCES Department|
| AppointmentDate| DATE        | NOT NULL                      |
| AppointmentTime| TIME        | NOT NULL                      |
| AppointmentStatus| VARCHAR(10) | DEFAULT('Pending',Çancelled', 'Completed')

---
## Normalization
### First Normal Form (1NF)
- Ensures atomicity of values in each column.

### Second Normal Form (2NF)
- Eliminate partial dependencies by ensuring that non-key attributes depend fully on the primary key.
  
### Third Normal Form (3NF)
- Eliminates transitive dependencies, ensuring data integrity by linking related tables through foreign keys.

---
## Justification of Design Choice
- Seperation of Concerns: Each table manages specific data, reducing redundancy
- Data Integrity: Foreign keys and constraints ensure consistent and valid data
- Scalability: The system can scale wirh hospital's growth

---
## Conclusion
The Rebecca Hospitals Database system is a robust and scalable designed to improve operational efficiency and healthcare quality, providing healthcare providers with quick access to essential data while ensurinf patient data integrity.
