CREATE DATABASE hospital_management;
---------CREATE table of pateints-----------
CREATE TABLE patientsss(
patient_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
name VARCHAR(100) NOT NULL,
dob DATE,
gender VARCHAR(20),
phone_number VARCHAR(15),
email VARCHAR(100),
address VARCHAR(200),
registration_date DATE
);
INSERT INTO patientsss(name,dob,gender,phone_number,email,address,registration_date)
VALUES 
('Kavita', '2004-08-13', 'Female', '9876543210',
 'kavita@gmail.com', 'Ahmedabad', '2026-01-10'),
('Bhavika', '2005-12-03', 'Female', '9876543211',
 'bhavika@gmail.com', 'Surat', '2026-02-15'),
('Rahul', '1998-04-20', 'Male', '9876543212',
 'rahul@gmail.com', 'Rajkot', '2025-06-20'),
('Priya', '2000-01-10', 'Female', NULL,
 'priya@gmail.com', 'Vadodara', '2026-03-18')
SELECT * FROM patientsss;
 -------CREATE TABLE OF DOCTORS------
CREATE TABLE doctorss(
doctor_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
name VARCHAR(100),
specialization VARCHAR (50),
phone_number VARCHAR(50),
email VARCHAR(50),
available_days VARCHAR(50),
consultation_fee NUMERIC (10,2),
experience_years INT
);
INSERT INTO doctorss(name,specialization,phone_number,email,available_days,consultation_fee,experience_years)
VALUES
('Dr. Sharma', 'Cardiology',
 '9000000001', 'sharma@hospital.com',
 'Mon,Wed,Fri', 1500, 18),
('Dr. Mehta', 'Neurology',
 '9000000002', 'mehta@hospital.com',
 'Tue,Thu,Sat', 2000, 12),
('Dr. Patel', 'Dermatology',
 '9000000003', 'patel@hospital.com',
 'Mon,Tue,Fri', 1000, 7),
 SELECT* FROM doctorss;
 -------CREATE TABLE OF APPOINTMENTS-----
 CREATE TABLE appointmentss(
appointment_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
patient_id INT,
doctor_id INT,
appointment_date DATE,
status VARCHAR(30),
FOREIGN KEY (patient_id)
        REFERENCES Patientsss(patient_id),
FOREIGN KEY (doctor_id)
        REFERENCES Doctorss(doctor_id)
);
INSERT INTO Appointmentss
(patient_id, doctor_id, appointment_date, status)
VALUES
(1,1,'2026-09-01','Completed'),
(2,2,'2026-09-02','Completed'),
(3,3,'2026-09-05','Scheduled'),
(4,3,'2026-09-10','Completed'),
(5,1,'2026-09-15','Scheduled'),
(1,3,'2026-09-20','Completed'),
(2,1,'2026-09-22','Cancelled'),
(3,2,'2025-12-10','Completed');
SELECT * FROM Appointmentss;
-------CREATE TABLE OF MEDICAL_RECORDS-----
CREATE TABLE Medical_Recordss(
    record_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	patient_id INT,
	doctor_id INT,
    diagnosis VARCHAR(200),
    prescription VARCHAR(200),
    treatment_date DATE,
FOREIGN KEY (patient_id)
        REFERENCES Patientsss(patient_id),
FOREIGN KEY (doctor_id)
        REFERENCES Doctorss(doctor_id)
);
INSERT INTO Medical_Recordss
(patient_id, doctor_id, diagnosis,
 prescription, treatment_date)
VALUES
(1,1,'High Blood Pressure',
 'Medicine A','2026-09-01'),
(2,2,'Migraine',
 'Medicine B','2026-09-02'),
(1,3,'Skin Infection',
 'Medicine D','2026-09-20'),
(3,2,'Headache',
 'Medicine E','2025-12-10');
 SELECT * FROM medical_recordss;
-------CREATE TABLE OF BILLING-----
CREATE TABLE Billing (
invoice_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
patient_id INT,
appointment_id INT,
amount NUMERIC(10,2),
payment_status VARCHAR(30),
payment_date DATE,
FOREIGN KEY (patient_id)
     REFERENCES patientsss(patient_id),
FOREIGN KEY (appointment_id)
    REFERENCES Appointmentss (appointment_id)
);
INSERT INTO Billing
(patient_id, appointment_id, amount,
 payment_status, payment_date)
VALUES
(1,1,1500,'Paid','2026-09-01'),
(2,2,2000,'Paid','2026-09-02'),
(3,3,1000,'Pending',NULL),
(4,4,1000,'Paid','2026-09-10'),
(5,5,1500,'Pending',NULL),
(1,6,1000,'Paid','2026-09-20');
SELECT * FROM billing;
-------CREATR TABLE OF DEPARTMENTS-----
CREATE TABLE Department(
    department_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);
INSERT INTO Department
(department_name)
VALUES
('Cardiology'),
('Neurology'),
('Dermatology'),
('Orthopedic');
SELECT * FROM department;
------ CREATE TABLE OF DOCTOR-DEPARTMENT------
CREATE TABLE Doctor_Department (
    doctor_id INT,
    department_id INT,
 PRIMARY KEY (doctor_id, department_id),
FOREIGN KEY (doctor_id)
   REFERENCES doctorss (doctor_id),
 FOREIGN KEY (department_id)
   REFERENCES department(department_id)
 );
INSERT INTO Doctor_Department
(doctor_id, department_id)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,1);
SELECT * FROM Doctor_Department;
-------ADD PATIENT IN PATIENT TABLE-----
INSERT INTO Patientsss(name, dob, gender, phone_number, email, address, registration_date)
VALUES('Sakshi', '2002-08-15', 'Female','9999999999', 'sakshi@gmail.com','Ahmedabad', CURRENT_DATE);
-------UPDATE PATIENT-----
UPDATE Patientsss
SET address = 'Gandhinagar'
WHERE patient_id = 1;
-----DELETE APPOINTMENT OLDER THAN 6 MONTHS----
DELETE FROM Appointmentss
WHERE status = 'Cancelled'
AND appointment_date < CURRENT_DATE - INTERVAL '6 months';
--------PATIENT WHICH REGISTERED IN LAST YEAR -----
SELECT *
FROM Patientsss
WHERE registration_date >= CURRENT_DATE - INTERVAL '1 year';
------- 5 TOP MOST PATIENTS ----
SELECT
    patient_id,
    SUM(amount) AS total_paid
FROM Billing
WHERE payment_status = 'Paid'
GROUP BY patient_id
ORDER BY total_paid DESC
LIMIT 5;
---------- DOCTORS WHO CHARGE MORE THAN 1000----
SELECT *
FROM Doctorss
WHERE consultation_fee > 1000;
----APPOINTMENT WHERE STATUS=SCHEDULED-----
SELECT *
FROM Appointmentss
WHERE status = 'Scheduled'AND doctor_id = 3;

SELECT *
FROM Doctorss
WHERE specialization = 'Cardiology'
OR specialization = 'Neurology';

SELECT *
FROM Patientsss
WHERE patient_id NOT IN
(
    SELECT patient_id
    FROM Appointmentss
    WHERE appointment_date >= CURRENT_DATE - INTERVAL '1 year'
);

--------SORTING & GROUPING  DATA-----
SELECT *
FROM Doctorss
ORDER BY specialization ASC;
SELECT
    doctor_id,
    COUNT(DISTINCT patient_id) AS total_patients
FROM Appointmentss
GROUP BY doctor_id;
SELECT
    d.department_name,
    SUM(b.amount) AS total_revenue
FROM Billing b
JOIN Appointmentss a
ON b.appointment_id = a.appointment_id
JOIN Doctor_Department dd
ON a.doctor_id = dd.doctor_id
JOIN Department d
ON dd.department_id = d.department_id
WHERE b.payment_status = 'Paid'
GROUP BY d.department_name;
----USE AGGREGATE FUNCTIONS ---
SELECT
    SUM(amount) AS total_revenue
FROM Billing
WHERE payment_status = 'Paid';
SELECT
    doctor_id,
    COUNT(*) AS total_visits
FROM Appointmentss
WHERE status = 'Completed'
GROUP BY doctor_id
ORDER BY total_visits DESC
LIMIT 1;
SELECT
    AVG(consultation_fee) AS average_fee
FROM Doctorss;
SELECT
    MAX(consultation_fee) AS maximum_fee
FROM Doctorss;
SELECT
    MIN(consultation_fee) AS minimum_fee
FROM Doctorss;
SELECT COUNT(*) AS total_doctors
FROM Doctorss;
SELECT
    mr.record_id,
    p.name AS patient_name,
    d.name AS doctor_name,
    mr.diagnosis,
    mr.prescription
FROM Medical_Records mr
JOIN Patientsss p
ON mr.patient_id = p.patient_id
JOIN Doctorss d
ON mr.doctor_id = d.doctor_id;
SELECT
    b.invoice_id,
    b.amount,
    a.appointment_date,
    a.status
FROM Billing b
JOIN Appointments a
ON b.appointment_id = a.appointment_id;
----USE OF JOINS ----
SELECT
    d.name AS doctor_name,
    dep.department_name
FROM Doctors d
INNER JOIN Doctor_Department dd
ON d.doctor_id = dd.doctor_id
INNER JOIN Department dep
ON dd.department_id = dep.department_id;
SELECT
    p.name AS patient_name,
    a.appointment_date,
    a.status
FROM Patientsss p
LEFT JOIN Appointmentss a
ON p.patient_id = a.patient_id
AND a.status = 'Completed';
SELECT
    a.appointment_id,
    a.patient_id,
    b.invoice_id,
    b.payment_status
FROM Billing b
RIGHT JOIN Appointmentss a
ON b.appointment_id = a.appointment_id
WHERE b.invoice_id IS NULL;
SELECT
    p.patient_id,
    p.name AS patient_name,
    a.appointment_id
FROM Patients p
FULL OUTER JOIN Appointmentss a
ON p.patient_id = a.patient_id;
SELECT
    p.patient_id,
    p.name
FROM Patients p
FULL OUTER JOIN Appointments a
ON p.patient_id = a.patient_id
WHERE a.appointment_id IS NULL;
SELECT
    doctor_id,
    name
FROM Doctorss
WHERE doctor_id IN
(
    SELECT doctor_id
    FROM Appointmentss
    GROUP BY doctor_id
    HAVING COUNT(DISTINCT patient_id) > 50
);
SELECT
    patient_id,
    name
FROM Patientsss
WHERE patient_id =
(
    SELECT patient_id
    FROM Billing
	WHERE payment_status = 'Paid'
	GROUP BY patient_id
    ORDER BY SUM(amount) DESC
    LIMIT 1
);
SELECT *
FROM Appointmentss
WHERE doctor_id IN
(
    SELECT doctor_id
    FROM Doctorss
    WHERE specialization = 'Dermatology'
);
SELECT EXTRACT(MONTH FROM appointment_date), COUNT(*)
FROM appointmentss
GROUP BY EXTRACT(MONTH FROM appointment_date);
SELECT discharge_date - admission_date AS stay_days
FROM patientsss;
SELECT TO_CHAR(treatment_date, 'DD-MM-YYYY')
FROM medical_records;
SELECT UPPER(name)
FROM patientsss;
SELECT TRIM(name)
FROM doctorss;
SELECT COALESCE(phone_number, 'Not Available')
FROM patientsss;
SELECT name,
RANK() OVER(ORDER BY COUNT(*) DESC)
FROM appointmentss a
JOIN doctorss d ON a.doctor_id = d.doctor_id
GROUP BY name;
SELECT DATE_TRUNC('month', payment_date),
SUM(amount)
FROM billing
GROUP BY 1;
SELECT appointment_date,
COUNT(*) OVER(ORDER BY appointment_date)
FROM appointmentss;

SELECT patient_id,
CASE
 WHEN COUNT(*) > 5 THEN 'High'
 WHEN COUNT(*) BETWEEN 3 AND 5 THEN 'Medium'
 ELSE 'Low'
END AS risk
FROM medical_records
GROUP BY patient_id;

SELECT name,
CASE
 WHEN experience_years > 15 THEN 'Senior'
 WHEN experience_years >= 5 THEN 'Mid-Level'
 ELSE 'Junior'
END
FROM doctorss;






  

