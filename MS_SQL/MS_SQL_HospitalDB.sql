-- * Problem Statement *:

-- Managing hospital data manually is time-consuming and confusing.
-- Doctors and staff often struggle to track patient info, appointments, and bills.
-- This results in delays, errors, and poor patient service.
-- To solve this, I created a Hospital Management System using a structured database.
-- It stores all data in one place to improve speed, accuracy, and care.


CREATE DATABASE HospitalDB;
GO

USE HospitalDB;
GO

-- Create Tables
CREATE TABLE Departments (
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Patients (
    PatientID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    DOB DATE NOT NULL,
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female', 'Other')),
    PhoneNumber VARCHAR(20) NOT NULL,
    Email VARCHAR(100) UNIQUE
);

CREATE TABLE Doctors (
    DoctorID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100) UNIQUE,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Appointments (
    AppointmentID INT IDENTITY(1,1) PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATETIME NOT NULL,
    Status VARCHAR(50) DEFAULT 'Scheduled',
    Reason VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE MedicalRecords (
    RecordID INT IDENTITY(1,1) PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    Diagnosis TEXT NOT NULL,
    Treatment TEXT,
    RecordDate DATETIME NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE Bills (
    BillID INT IDENTITY(1,1) PRIMARY KEY,
    PatientID INT NOT NULL,
    TotalAmount DECIMAL(10,2) CHECK (TotalAmount >= 0),
    PaidAmount DECIMAL(10,2) CHECK (PaidAmount >= 0),
    BillDate DATETIME NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- Insert Sample Data
INSERT INTO Departments (DepartmentName) VALUES
('Cardiology'),
('Neurology'),
('Orthopedics'),
('Pediatrics'),
('General Medicine');

INSERT INTO Patients (FirstName, LastName, DOB, Gender, PhoneNumber, Email) VALUES
('Saanvi', 'Reddy', '2024-04-14', 'Female', '+91-9000000002', 'saanvi.reddy.parents@gmail.com'),
('Myra', 'Das', '2015-05-20', 'Female', '+91-9000000004', 'myra.das007@gmail.com'),
('Gopal', 'Krishnan', '1949-07-03', 'Male', '+91-9011111122', 'gopal.krishnan@hotmail.com'),
('Ritu', 'Khandelwal', '1994-06-18', 'Female', '+91-9845332211', 'ritu.k.94@gmail.com'),
('Vihaan', 'Shah', '2017-08-30', 'Male', '+91-9000000003', 'vihaan.shah200@gmail.com'),
('Priya', 'Reddy', '1990-07-22', 'Female', '+91-9123456789', 'priya.r@gmail.com'),
('Amit', 'Sharma', '1985-03-15', 'Male', '+91-9876543210', 'amitsharma85@gmail.com'),
('Meena', 'Chopra', '1958-05-09', 'Female', '+91-9911223344', 'meena.chopra@yahoo.com'),
('Rohan', 'Singhania', '2009-11-18', 'Male', '+91-9000000005', 'rohan.singh09@gmail.com'),
('Anjali', 'Menon', '1995-09-18', 'Female', '+91-9012345678', 'anjali.menon95@gmail.com'),
('Savita', 'Joshi', '1952-12-12', 'Female', '+91-9022222233', 'savita.joshi1952@gmail.com'),
('Harsh', 'Agarwal', '1999-12-11', 'Male', '+91-9333344444', 'harsh.agarwal99@gmail.com'),
('Simran', 'Kapoor', '2007-06-25', 'Female', '+91-9000000006', 'simran.kapoor07@gmail.com'),
('Suresh', 'Nair', '1963-08-21', 'Male', '+91-9845112233', 'suresh.nair63@gmail.com'),
('Sakshi', 'Jain', '2000-03-22', 'Female', '+91-9111223344', 'sakshi.jain20@gmail.com'),
('Rohit', 'Patel', '1978-12-05', 'Male', '+91-9988776655', 'rohit.patel78@gmail.com'),
('Aarush', 'Sharma', '2023-10-25', 'Male', '+91-9000000001', 'aarush.sharma.parents@gmail.com'),
('Kiran', 'Desai', '1988-01-12', 'Male', '+91-9898989898', 'kiran.desai88@gmail.com'),
('Gauri', 'Saxena', '1983-02-14', 'Female', '+91-9876543212', 'gauri.saxena83@gmail.com'),
('Alok', 'Yadav', '1981-04-22', 'Male', '+91-9911552233', 'alok.yadav81@gmail.com');

INSERT INTO Doctors (FirstName, LastName, Specialization, PhoneNumber, Email, DepartmentID) VALUES
('Anil', 'Kumar', 'Cardiologist', '+91-9111000001', 'anil.kumar@hospital.com', 1),
('Sneha', 'Verma', 'Cardiologist', '+91-9111000002', 'sneha.verma@hospital.com', 1),
('Vikram', 'Singh', 'Neurologist', '+91-9111000003', 'vikram.singh@hospital.com', 2),
('Priya', 'Mehta', 'Orthopedist', '+91-9111000004', 'priya.mehta@hospital.com', 3),
('Rahul', 'Joshi', 'Orthopedist', '+91-9111000005', 'rahul.joshi@hospital.com', 3),
('Neha', 'Gupta', 'Pediatrician', '+91-9111000006', 'neha.gupta@hospital.com', 4),
('Amita', 'Sharma', 'Pediatrician', '+91-9111000007', 'amita.sharma@hospital.com', 4),
('Sanjay', 'Patel', 'General Physician', '+91-9111000008', 'sanjay.patel@hospital.com', 5);

INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Status, Reason) VALUES
(1, 6, '2025-01-10 09:00:00', 'Completed', 'Growth Checkup'),
(2, 7, '2025-01-15 10:30:00', 'Completed', 'Fever'),
(3, 8, '2025-01-20 11:00:00', 'Completed', 'Routine Checkup'),
(4, 1, '2025-02-01 14:00:00', 'Completed', 'Chest Pain'),
(5, 6, '2025-02-05 09:30:00', 'Completed', 'Ear Pain'),
(6, 4, '2025-02-10 15:00:00', 'Completed', 'Back Pain'),
(7, 2, '2025-02-15 10:00:00', 'Completed', 'Chest Pain'),
(8, 5, '2025-02-20 11:30:00', 'Completed', 'Arthritis'),
(9, 8, '2025-03-01 13:00:00', 'Scheduled', 'Vision Issues'),
(10, 8, '2025-03-05 14:30:00', 'Completed', 'Diabetes'),
(11, 4, '2025-03-10 09:00:00', 'Completed', 'Arthritis'),
(12, 8, '2025-03-15 10:00:00', 'Scheduled', 'Fatigue'),
(13, 8, '2025-03-20 11:00:00', 'Completed', 'Acne'),
(14, 1, '2025-04-01 12:00:00', 'Completed', 'Hypertension'),
(15, 3, '2025-04-05 13:30:00', 'Scheduled', 'Headache'),
(16, 5, '2025-04-10 14:00:00', 'Completed', 'Back Pain'),
(17, 7, '2025-04-15 09:00:00', 'Completed', 'Growth Checkup'),
(18, 4, '2025-04-20 10:30:00', 'Scheduled', 'Back Pain'),
(19, 2, '2025-05-01 11:00:00', 'Completed', 'Chest Pain'),
(20, 5, '2025-05-05 12:30:00', 'Completed', 'Back Pain'),
(3, 8, '2025-03-25 09:00:00', 'Completed', 'Follow-up Checkup'),
(4, 1, '2025-04-15 14:00:00', 'Scheduled', 'Follow-up Chest Pain'),
(7, 2, '2025-04-20 10:00:00', 'Completed', 'Follow-up Chest Pain'),
(8, 5, '2025-05-10 11:30:00', 'Scheduled', 'Arthritis Follow-up'),
(10, 8, '2025-05-15 14:30:00', 'Completed', 'Diabetes Follow-up'),
(11, 4, '2025-05-20 09:00:00', 'Cancelled', 'Arthritis Follow-up'),
(14, 1, '2025-06-01 12:00:00', 'Scheduled', 'Hypertension Follow-up'),
(16, 5, '2025-06-05 14:00:00', 'Completed', 'Back Pain Follow-up'),
(19, 2, '2025-06-10 11:00:00', 'Scheduled', 'Chest Pain Follow-up'),
(20, 5, '2025-06-15 12:30:00', 'Cancelled', 'Back Pain Follow-up');

INSERT INTO MedicalRecords (PatientID, DoctorID, Diagnosis, Treatment, RecordDate) VALUES
(1, 6, 'Normal growth, no abnormalities (Z00.2)', 'Routine monitoring, next checkup in 6 months', '2025-01-10 10:00:00'),
(2, 7, 'Viral fever (B34.9)', 'Prescribed Crocin 500mg, rest for 3 days', '2025-01-15 11:30:00'),
(3, 8, 'Age-related fatigue (Z00.0)', 'Vitamin B12 supplements, advised regular exercise', '2025-01-20 12:00:00'),
(4, 1, 'Angina pectoris (I20.9)', 'Prescribed Nitroglycerin, advised ECG', '2025-02-01 15:00:00'),
(5, 6, 'Acute otitis media (H66.9)', 'Prescribed Amoxicillin 250mg, ear drops', '2025-02-05 10:30:00'),
(6, 4, 'Lumbar strain (M54.5)', 'Prescribed Diclofenac, physiotherapy advised', '2025-02-10 16:00:00'),
(7, 2, 'Unstable angina (I20.0)', 'Prescribed Aspirin, referred for angiogram', '2025-02-15 11:00:00'),
(8, 5, 'Osteoarthritis (M15.0)', 'Prescribed Aceclofenac, joint exercises', '2025-02-20 12:30:00'),
(10, 8, 'Type 2 diabetes mellitus (E11.9)', 'Prescribed Metformin 500mg, diet plan', '2025-03-05 15:30:00'),
(11, 4, 'Rheumatoid arthritis (M06.9)', 'Prescribed Methotrexate, regular monitoring', '2025-03-10 10:00:00'),
(13, 8, 'Acne vulgaris (L70.0)', 'Prescribed Clindamycin gel, skin care advice', '2025-03-20 12:00:00'),
(14, 1, 'Essential hypertension (I10)', 'Prescribed Amlodipine 5mg, lifestyle changes', '2025-04-01 13:00:00'),
(16, 5, 'Chronic back pain (M54.9)', 'Prescribed Ibuprofen, physiotherapy sessions', '2025-04-10 15:00:00'),
(17, 7, 'Normal growth, no concerns (Z00.2)', 'Routine monitoring, vaccination schedule', '2025-04-15 10:00:00'),
(19, 2, 'Chest pain, non-cardiac (R07.4)', 'Prescribed Pantoprazole, stress management', '2025-05-01 12:00:00'),
(20, 5, 'Muscle strain (M54.5)', 'Prescribed Paracetamol, rest for 1 week', '2025-05-05 13:30:00'),
(3, 8, 'Stable condition, no new issues (Z00.0)', 'Continue Vitamin B12, follow-up in 3 months', '2025-03-25 10:00:00'),
(7, 2, 'Stable post-angiogram (I20.0)', 'Continue Aspirin, monitor symptoms', '2025-04-20 11:00:00'),
(10, 8, 'Controlled diabetes (E11.9)', 'Continue Metformin, HbA1c test in 3 months', '2025-05-15 15:30:00'),
(16, 5, 'Improved back pain (M54.9)', 'Continue physiotherapy, reduce Ibuprofen', '2025-06-05 15:00:00');

INSERT INTO Bills (PatientID, TotalAmount, PaidAmount, BillDate) VALUES
(1, 1500.00, 1500.00, '2025-01-10 12:00:00'),
(2, 3000.00, 3000.00, '2025-01-16 09:00:00'),
(3, 2000.00, 1000.00, '2025-01-21 10:00:00'),
(4, 25000.00, 0.00, '2025-02-02 09:00:00'),
(5, 5000.00, 5000.00, '2025-02-05 12:00:00'),
(6, 8000.00, 4000.00, '2025-02-11 10:00:00'),
(7, 30000.00, 30000.00, '2025-02-16 09:00:00'),
(8, 15000.00, 12000.00, '2025-02-21 10:00:00'),
(10, 6000.00, 6000.00, '2025-03-06 09:00:00'),
(11, 20000.00, 0.00, '2025-03-11 10:00:00'),
(13, 1000.00, 1000.00, '2025-03-20 14:00:00'),
(14, 8000.00, 8000.00, '2025-04-02 09:00:00'),
(16, 10000.00, 5000.00, '2025-04-11 10:00:00'),
(17, 1500.00, 1500.00, '2025-04-15 12:00:00'),
(19, 12000.00, 0.00, '2025-05-02 09:00:00'),
(20, 7000.00, 7000.00, '2025-05-06 09:00:00'),
(3, 2000.00, 2000.00, '2025-03-26 09:00:00'),
(7, 15000.00, 0.00, '2025-04-21 10:00:00'),
(10, 4000.00, 3200.00, '2025-05-16 09:00:00'),
(16, 5000.00, 5000.00, '2025-06-06 09:00:00');

-- View all tables (MS SQL Server way)
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE';

SELECT * FROM departments;
SELECT * FROM Patients;
SELECT * FROM doctors;
SELECT * FROM appointments;
SELECT * FROM medicalrecords;
SELECT * FROM bills;

-- QUERY EXAMPLES

-- To quickly view all patient records stored in the system.
SELECT * FROM Patients;

-- Get names and phone numbers of patients whose gender is 'Female'.
SELECT firstname, lastname, phonenumber FROM patients WHERE gender='Female';

-- To identify the most recently born patients (youngest)
SELECT firstname, lastname, DOB FROM patients ORDER BY DOB DESC;

-- To list all completed appointments in the hospital sorted by most recent date
SELECT * FROM appointments WHERE status='Completed' ORDER BY appointmentdate DESC;

-- To identify patients with pending payments
SELECT * FROM bills WHERE paidamount < totalamount;

-- To find patients whose names start with the letter 'S'
SELECT firstname, lastname FROM patients WHERE firstname LIKE 'S%';

-- Get completed appointments after 1st Jan 2025
SELECT * FROM appointments WHERE status='Completed' AND appointmentdate >= '2025-01-01';

-- Show all unique appointment statuses
SELECT DISTINCT status FROM appointments;

-- Retrieve the second page of appointment records (5 per page) - MS SQL Server pagination
SELECT * FROM appointments ORDER BY appointmentdate 
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;

-- Count total number of patients in the system
SELECT COUNT(*) AS TotalPatients FROM patients;

-- Count number of doctors in each department
SELECT departmentid, COUNT(*) AS DoctorCount FROM doctors GROUP BY departmentid;

-- Show departments with more than 1 doctor
SELECT departmentid, COUNT(*) AS DoctorCount FROM doctors GROUP BY departmentid HAVING COUNT(*) > 1;

-- Show appointment details with patient names
SELECT A.appointmentid, P.firstname, P.lastname, A.appointmentdate 
FROM patients P JOIN appointments A ON P.patientid = A.patientid;

-- List all patients with or without appointments (LEFT JOIN)
SELECT p.firstname, p.lastname, a.appointmentdate 
FROM patients p LEFT JOIN appointments a ON p.patientid = a.patientid;

-- Show appointment report with patient, doctor, and department info
SELECT a.appointmentid, p.firstname, p.lastname, d.firstname, d.lastname, dep.departmentname
FROM appointments AS a
JOIN patients AS p ON a.patientid = p.patientid
JOIN doctors AS d ON a.doctorid = d.doctorid
JOIN departments AS dep ON dep.departmentid = d.departmentid;

-- Find doctors who have more appointments than average
SELECT DoctorID, COUNT(*) AS TotalAppointments  
FROM Appointments  
GROUP BY DoctorID  
HAVING COUNT(*) > (
    SELECT AVG(CAST(CountPerDoctor AS FLOAT)) 
    FROM (  
        SELECT COUNT(*) AS CountPerDoctor  
        FROM Appointments  
        GROUP BY DoctorID  
    ) AS AvgSub
);

-- Get departments with total appointments
SELECT D.Departmentid, SUM(AppCount) AS TotalAppointments  
FROM (  
    SELECT DoctorID, COUNT(*) AS AppCount  
    FROM Appointments  
    GROUP BY DoctorID  
) AS DocAppointments  
JOIN Doctors D ON DocAppointments.DoctorID = D.DoctorID  
GROUP BY D.Departmentid;

-- List patients who had more than one appointment
SELECT firstname as PatientName 
FROM Patients P  
WHERE 1 < (SELECT COUNT(*)  
           FROM Appointments A  
           WHERE A.PatientID = P.PatientID);

-- Combine patient's first and last name for full name
SELECT CONCAT(FirstName, ' ', LastName) AS FullName  
FROM Patients;

-- Mask middle digits of phone numbers
SELECT REPLACE(Phonenumber, SUBSTRING(Phonenumber, 4, 3), '***') AS MaskedPhone  
FROM Patients;

-- Get first 3 characters of department name
SELECT LEFT(DepartmentName, 3) AS DeptCode  
FROM Departments;

-- Extract date and time from appointment date
SELECT a.appointmentid, p.firstname, CAST(a.appointmentdate AS DATE) as AppDate, 
       CAST(a.appointmentdate AS TIME) as AppTime
FROM appointments as a JOIN patients p ON a.patientid=p.patientid;

-- Log current system date and time
SELECT GETDATE() AS CurrentTimestamp;

-- Set follow-up appointment 30 days after current date
SELECT DATEADD(DAY, 30, GETDATE()) AS FollowUpDate;

-- Assign status to appointments based on date
SELECT 
    AppointmentID,
    PatientID,
    DoctorID,
    AppointmentDate,
    CASE 
        WHEN CAST(AppointmentDate AS DATE) > CAST(GETDATE() AS DATE) THEN 'Upcoming'
        WHEN CAST(AppointmentDate AS DATE) = CAST(GETDATE() AS DATE) THEN 'Today'
        ELSE 'Past'
    END AS AppointmentStatus
FROM Appointments;

-- Sort patients by severity of medical condition
SELECT *
FROM appointments
ORDER BY
  CASE 
    -- Critical Conditions
    WHEN Reason LIKE '%Chest Pain%' THEN 1
    WHEN Reason LIKE '%Hypertension%' THEN 2
    WHEN Reason LIKE '%Diabetes%' THEN 3
    -- Moderate Conditions
    WHEN Reason LIKE '%Back Pain%' THEN 4
    WHEN Reason LIKE '%Arthritis%' THEN 5
    WHEN Reason = 'Vision Issues' THEN 6
    WHEN Reason = 'Fatigue' THEN 7
    WHEN Reason = 'Headache' THEN 8
    WHEN Reason = 'Ear Pain' THEN 9
    -- Mild / Routine Conditions
    WHEN Reason = 'Fever' THEN 10
    WHEN Reason = 'Acne' THEN 11
    WHEN Reason = 'Growth Checkup' THEN 12
    WHEN Reason = 'Routine Checkup' THEN 13
    WHEN Reason LIKE '%Follow-up%' THEN 14
    ELSE 15  -- Unclassified or unknown reasons
  END;

-- Create View: Top 6 doctors based on appointment count
GO
CREATE VIEW TopDoctors AS
SELECT TOP 6 doctorid, COUNT(*) AS total_appointments
FROM Appointments
GROUP BY doctorid
ORDER BY total_appointments DESC;
GO

SELECT * FROM TopDoctors;

-- Create View: Non-sensitive appointment data for reports
GO
CREATE VIEW PublicAppointments AS
SELECT appointmentid, doctorid, appointmentdate
FROM Appointments;
GO

SELECT * FROM PublicAppointments;

-- Get department names for top doctors from the view
SELECT td.doctorid, d.departmentname, td.total_appointments
FROM TopDoctors td
JOIN Doctors doc ON td.doctorid = doc.doctorid
JOIN Departments d ON doc.departmentid = d.departmentid;