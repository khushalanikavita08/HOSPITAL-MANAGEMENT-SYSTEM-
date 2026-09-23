# HOSPITAL-MANAGEMENT-SYSTEM
<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&size=28&pause=1000&color=2E86DE&center=true&vCenter=true&width=650&lines=Hospital+Management+System+%F0%9F%8F%A5;PostgreSQL+%7C+SQL+%7C+Relational+Database;Patients+%E2%80%A2+Doctors+%E2%80%A2+Appointments+%E2%80%A2+Billing;Built+by+Kavita+Khushalani" alt="Typing SVG" />

<br/>

![PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/Language-SQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-2ECC71?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)

</div>

---

## 🏥 About the Project

**Hospital Management System** is a relational database project built in **PostgreSQL** that models the core operations of a hospital — patient registration, doctor management, appointment scheduling, medical records, billing, and department mapping.

It's designed as a hands-on SQL practice project covering everything from **table design & constraints** to **joins, subqueries, window functions, and aggregate reporting**.

---

## ✨ Features

- 🧑‍⚕️ **Patient Management** — registration, contact details, and history tracking
- 👨‍⚕️ **Doctor Directory** — specialization, fees, experience, and availability
- 📅 **Appointment Scheduling** — status tracking (Scheduled / Completed / Cancelled)
- 📋 **Medical Records** — diagnosis & prescription history per patient
- 💰 **Billing System** — invoices, payment status, and revenue reports
- 🏢 **Department Mapping** — many-to-many doctor–department relationships
- 📊 **Analytics Queries** — top-paying patients, top-performing doctors, monthly revenue trends, risk classification with `CASE`, running totals with `OVER()`, and more

---

## 🗂️ Database Schema (ER Overview)

```mermaid
erDiagram
    PATIENTS ||--o{ APPOINTMENTS : books
    DOCTORS ||--o{ APPOINTMENTS : attends
    PATIENTS ||--o{ MEDICAL_RECORDS : has
    DOCTORS ||--o{ MEDICAL_RECORDS : writes
    APPOINTMENTS ||--o| BILLING : generates
    PATIENTS ||--o{ BILLING : pays
    DOCTORS }o--o{ DEPARTMENT : belongs_to

    PATIENTS {
        int patient_id PK
        string name
        date dob
        string gender
        string phone_number
        string email
        string address
        date registration_date
    }
    DOCTORS {
        int doctor_id PK
        string name
        string specialization
        string phone_number
        string email
        string available_days
        numeric consultation_fee
        int experience_years
    }
    APPOINTMENTS {
        int appointment_id PK
        int patient_id FK
        int doctor_id FK
        date appointment_date
        string status
    }
    MEDICAL_RECORDS {
        int record_id PK
        int patient_id FK
        int doctor_id FK
        string diagnosis
        string prescription
        date treatment_date
    }
    BILLING {
        int invoice_id PK
        int patient_id FK
        int appointment_id FK
        numeric amount
        string payment_status
        date payment_date
    }
    DEPARTMENT {
        int department_id PK
        string department_name
    }
```

---

## 🧩 Tech Stack

| Layer | Technology |
|---|---|
| Database Engine | PostgreSQL |
| Query Language | SQL (DDL, DML, DQL) |
| Concepts Used | Joins, Subqueries, Aggregates, Window Functions, `CASE`, `DATE_TRUNC`, `COALESCE` |

---

## 📁 Project Structure

```
📦 hospital-management-system
 ┣ 📜 hospital_management_system.sql   # Full schema + data + queries
 ┗ 📜 README.md                        # You are here
```

---

## 🚀 How to Run

1. Install **PostgreSQL** and open `psql` or **pgAdmin**
2. Create the database:
   ```sql
   CREATE DATABASE hospital_management;
   ```
3. Run the script:
   ```bash
   psql -U your_username -d hospital_management -f hospital_management_system.sql
   ```
4. Explore the tables and run the sample analytics queries included in the file 🎉

---

## 📊 Sample Query Highlights

```sql
-- Top 5 patients by total amount paid
SELECT patient_id, SUM(amount) AS total_paid
FROM Billing
WHERE payment_status = 'Paid'
GROUP BY patient_id
ORDER BY total_paid DESC
LIMIT 5;

-- Department-wise revenue
SELECT d.department_name, SUM(b.amount) AS total_revenue
FROM Billing b
JOIN Appointmentss a ON b.appointment_id = a.appointment_id
JOIN Doctor_Department dd ON a.doctor_id = dd.doctor_id
JOIN Department d ON dd.department_id = d.department_id
WHERE b.payment_status = 'Paid'
GROUP BY d.department_name;

-- Doctor experience classification
SELECT name,
CASE
    WHEN experience_years > 15 THEN 'Senior'
    WHEN experience_years >= 5 THEN 'Mid-Level'
    ELSE 'Junior'
END AS seniority
FROM doctorss;
```

---
## SAMPLE OUTPUT
<img width="1840" height="1600" alt="sample_output (1)" src="https://github.com/user-attachments/assets/3b2b7e57-49af-453b-ba8b-70d2ae50b37c" />


## 🗺️ Tables Overview

| Table | Purpose |
|---|---|
| `patientsss` | Patient personal & contact details |
| `doctorss` | Doctor profiles, fees & specialization |
| `appointmentss` | Links patients ↔ doctors with date & status |
| `medical_recordss` | Diagnosis & prescription history |
| `billing` | Invoices & payment tracking |
| `department` | List of hospital departments |
| `doctor_department` | Many-to-many doctor–department mapping |

---

## 👩‍💻 Author

**Kavita Khushalani**

<div align="center">

⭐ If you found this project useful, consider giving it a star!

</div>
