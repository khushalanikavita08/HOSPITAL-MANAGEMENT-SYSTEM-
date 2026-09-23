# HOSPITAL-MANAGEMENT-SYSTEM
<div align="center">

# 🏥 HOSPITAL-MANAGEMENT-SQL

<img src="banner.svg" alt="Hospital Data Vault Banner" width="100%">

### 🧍 Patients ➤ 📅 Appointments ➤ 💊 Care ➤ 💳 Billing

![SQL](https://img.shields.io/badge/🧬%20SQL-2f81f7?style=flat-square)![DATABASE](https://img.shields.io/badge/🗄️%20DATABASE-POSTGRESQL-16a085?style=flat-square)![STATUS](https://img.shields.io/badge/✅%20STATUS-COMPLETED-2ecc71?style=flat-square)![LEVEL](https://img.shields.io/badge/📈%20LEVEL-BEGINNER--INTERMEDIATE-e67e22?style=flat-square)

![LICENSE](https://img.shields.io/badge/📜%20LICENSE-MIT-7f8c8d?style=flat-square)![MAINTAINED](https://img.shields.io/badge/🔧%20MAINTAINED-YES-2ecc71?style=flat-square)![LIVE](https://img.shields.io/badge/🚀%20STATUS-LIVE-brightgreen?style=flat-square)![OPEN%20SOURCE](https://img.shields.io/badge/💻%20OPEN%20SOURCE-YES-9b59b6?style=flat-square)

[![Star](https://img.shields.io/badge/⭐-GIVE%20IT%20A%20STAR-f1c40f?style=flat-square)](#)[![Fork](https://img.shields.io/badge/🍴-FORK%20%26%20LEARN-9b59b6?style=flat-square)](#)[![Watch](https://img.shields.io/badge/👀-WATCH%20REPO-3498db?style=flat-square)](#)

> 💭 *"Data is the heartbeat of every hospital — this project turns raw records into meaningful care."*

</div>

<br>

## 🔴 Live Status

<div align="center">

![Live](https://img.shields.io/badge/🟢%20LIVE-Actively%20Updated-brightgreen?style=for-the-badge)
![Last Updated](https://img.shields.io/badge/📅%20LAST%20UPDATED-September%202026-blue?style=for-the-badge)
![Commits](https://img.shields.io/badge/🔥%20BUILD%20STREAK-Ongoing-orange?style=for-the-badge)

</div>

This repo is **🟢 live and actively evolving** — it's not a one-time submission, it's an ongoing SQL practice log.

- 🆕 New queries are being added regularly as new SQL concepts are learned
- 🔁 Existing queries get refined for performance & readability
- 🧪 Currently experimenting with: CTEs, triggers & stored procedures
- 📬 Open to feedback & pull requests anytime

<div align="right"><a href="#hospital-management-sql">⬆️ back to top</a></div>

---

## 📚 Table of Contents

- [🔴 Live Status](#live-status)
- [📌 Project Overview](#project-overview)
- [🗂️ Project Structure](#project-structure)
- [🧾 Sample Output](#sample-output)
- [✨ Features](#features)
- [🧠 What This Project Taught Me](#what-this-project-taught-me)
- [🗺️ Roadmap](#roadmap)
- [🛠️ Tech Stack](#tech-stack)
- [▶️ How to Run](#how-to-run)
- [💬 Feedback](#feedback)
- [🤝 Contributing](#contributing)
- [👩‍💻 Author](#author)

<br>

## 📌 Project Overview

**HOSPITAL-MANAGEMENT-SQL** is a relational database project built in PostgreSQL that models the day-to-day operations of a hospital — from registering patients and scheduling appointments, to tracking diagnoses, prescriptions, and billing.

It's designed as a hands-on learning project covering the full SQL spectrum:

| 🧩 Area | 💡 What's covered |
|---|---|
| 🏗️ Design | Database & table design with primary/foreign key relationships |
| 🧹 CRUD | `INSERT`, `UPDATE`, `DELETE`, `SELECT` |
| 🔗 Joins | Multi-table JOINs & nested subqueries |
| 📊 Aggregation | `GROUP BY`, `HAVING`, aggregate functions |
| 🪟 Analytics | Window functions & `CASE`-based logic |
| 🗓️ Utility | Date, string & null-handling functions |

🎯 The goal — go from raw hospital data to real, decision-ready insights (revenue, patient load, doctor performance, etc.) using pure SQL.

<div align="right"><a href="#hospital-management-sql">⬆️ back to top</a></div>

---

## 🗂️ Project Structure

```
📦 HOSPITAL-MANAGEMENT-SQL
┣ 📜 hospital_management.sql      → Full script: schema + data + queries
┣ 🖼️ banner.svg                   → README banner graphic
┣ 📖 README.md                    → Project documentation (you are here)
┃
┣ 🧍 patientsss                   → Patient records (name, dob, gender, contact, address)
┣ 🩺 doctorss                     → Doctor records (specialization, fee, experience)
┣ 📅 appointmentss                → Links patients ↔ doctors with date & status
┣ 📋 medical_recordss              → Diagnosis & prescription history
┣ 💳 billing                      → Invoices, payment status & amounts
┣ 🏬 department                   → Hospital departments
┗ 🔗 doctor_department             → Maps doctors to their department(s)
```

**🔗 Table relationships:**

```
patientsss ──┐
             ├──▶ appointmentss ──▶ billing
   doctorss ─┘         │
      │                └──▶ medical_recordss
      ▼
doctor_department ──▶ department
```

<div align="right"><a href="#hospital-management-sql">⬆️ back to top</a></div>

---

## 🧾 Sample Output

**Query:** Total revenue collected per department 💰

```sql
SELECT d.department_name, SUM(b.amount) AS total_revenue
FROM Billing b
JOIN Appointmentss a ON b.appointment_id = a.appointment_id
JOIN Doctor_Department dd ON a.doctor_id = dd.doctor_id
JOIN Department d ON dd.department_id = d.department_id
WHERE b.payment_status = 'Paid'
GROUP BY d.department_name;
```

**Result:**

| 🏬 department_name | 💰 total_revenue |
|:---|---:|
| Cardiology  | 2500.00 |
| Neurology   | 2000.00 |
| Dermatology | 1000.00 |

📌 *(Sample output for illustration — actual values depend on the data loaded into your database.)*

<div align="right"><a href="#hospital-management-sql">⬆️ back to top</a></div>

---

## ✨ Features

- 🧑‍⚕️ Patient, Doctor, Appointment, Medical Record & Billing management
- 🏬 Department-wise doctor mapping
- 💰 Revenue & billing analytics
- 📊 Aggregate functions — `SUM`, `AVG`, `MAX`, `MIN`, `COUNT`
- 🔗 All JOIN types — `INNER`, `LEFT`, `RIGHT`, `FULL OUTER`
- 🧮 Subqueries & nested queries
- 🪟 Window functions — `RANK() OVER`, `COUNT() OVER`
- 🗓️ Date & string functions — `EXTRACT`, `TO_CHAR`, `TRIM`, `UPPER`, `COALESCE`
- 🎯 `CASE`-based classification (doctor seniority, patient risk level)
- 🧹 CRUD operations — `INSERT`, `UPDATE`, `DELETE`
- 🩹 Data cleanup using `COALESCE` for missing phone numbers
- 🕵️ "No-show" patient detection using `NOT IN` subqueries
- 🏆 Top revenue-generating patients using `ORDER BY ... LIMIT`

<div align="right"><a href="#hospital-management-sql">⬆️ back to top</a></div>

---

## 🧠 What This Project Taught Me

- 🔑 How to design normalized tables with proper foreign key relationships
- 🧮 Writing nested subqueries to answer "which patients/doctors" style questions
- 🪟 Using window functions (`RANK`, `COUNT OVER`) for ranking & running totals
- 🧹 Handling messy/missing data gracefully with `COALESCE`
- 📊 Turning raw transactional data into business insights (revenue, top doctors, patient risk)
- 🔗 Choosing the right JOIN (`INNER` vs `LEFT` vs `FULL OUTER`) for the question being asked

<div align="right"><a href="#hospital-management-sql">⬆️ back to top</a></div>

---

## 🗺️ Roadmap

- [x] ✅ Core schema — patients, doctors, appointments, billing, departments
- [x] ✅ CRUD, joins, subqueries, aggregates, window functions
- [ ] 🔜 Add stored procedures for common operations (e.g., book appointment)
- [ ] 🔜 Add triggers (e.g., auto-update billing on appointment completion)
- [ ] 🔜 Add views for frequently used reports
- [ ] 🔜 Add an ER diagram image
- [ ] 🔜 Connect to a simple front-end / dashboard

<div align="right"><a href="#hospital-management-sql">⬆️ back to top</a></div>

---

## 🛠️ Tech Stack

<div align="center">

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![pgAdmin](https://img.shields.io/badge/pgAdmin-2f81f7?style=for-the-badge&logo=postgresql&logoColor=white)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)

</div>

<div align="right"><a href="#hospital-management-sql">⬆️ back to top</a></div>

---

## ▶️ How to Run

1. 📥 Clone this repository
2. 🐘 Open the script in PostgreSQL (pgAdmin, psql, or any SQL client)
3. ▶️ Run `hospital_management.sql` top to bottom — it creates the database, tables, sample data, and all queries
4. 🔍 Explore or tweak the queries to try your own analysis

<div align="right"><a href="#hospital-management-sql">⬆️ back to top</a></div>

---

## 💬 Feedback

Found a bug or have a suggestion? 🐞 Feel free to open an issue or drop your feedback — every bit of it helps make this project better! 🙌

## 🤝 Contributing

Contributions are welcome! 🎉

1. 🍴 Fork this repository
2. 🌿 Create a new branch (`git checkout -b feature-name`)
3. 💾 Commit your changes
4. 📤 Push and open a Pull Request

## 👩‍💻 Author

<div align="center">

**Kavita Khushalani** ✨

📧 Feel free to connect for queries, suggestions, or collaboration!

![Made with Love](https://img.shields.io/badge/Made%20with-❤️-red?style=flat-square)

</div>

---

<div align="center">

> 🌟 *"Every query written here is a step toward smarter, faster, and more compassionate healthcare management."*

⭐ **If this helped you, consider giving it a star!** ⭐

</div>
