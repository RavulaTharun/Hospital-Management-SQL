
# Hospital Management System Database

A comprehensive SQL database project designed to streamline hospital operations. This system moves away from manual data management, which is often time-consuming and prone to errors, by providing a structured and efficient database solution. By storing all patient, doctor, and appointment information in a single, centralized system, it aims to improve speed, accuracy, and overall patient care.

---

## Features

* Patient Management: Register new patients and easily access a full list of all patient records.
* Doctor & Department Administration: Manage doctor information, specializations, and assign them to specific hospital departments.
* Appointment Scheduling: Book, view, and manage patient appointments with status tracking (e.g., Scheduled, Completed, Cancelled).
* Medical Records: Keep detailed medical records for each patient visit, including diagnosis and treatment plans.
* Billing & Payments: Generate bills for patient consultations and track payments to identify outstanding dues.
* Advanced Reporting:
    * Generate comprehensive reports combining patient, doctor, and appointment data.
    * Identify top-performing doctors using custom views.
    * Prioritize patient care by sorting appointments based on the severity of the medical reason.
    * Filter patients based on various criteria, such as name or age.

---

## Database Schema

The database is organized into the following tables:

* `Departments`: Stores hospital departments like 'Cardiology' and 'Neurology'.
* `Patients`: Contains detailed information about each patient.
* `Doctors`: Contains doctor profiles and their assigned department.
* `Appointments`: Tracks all scheduled and completed patient appointments.
* `MedicalRecords`: Logs the diagnosis and treatment for each patient encounter.
* `Bills`: Manages the financial records and payment status for patients.

---

## Technology Stack

* Database: MySQL, MS SQL Server
* Schema & Data: Provided in `.sql` script files.

---


1. **Set up the Database:**

    * Two SQL script files are provided: one for MySQL and one for MS SQL.
    * Choose the script that matches your database system.
    * Run the entire script in your preferred database management tool (like MySQL Workbench or SQL Server Management Studio).
    * This will create the `HospitalDB` database, all the necessary tables, and populate them with sample data.

---

## Example Queries

Here are a few examples of what you can do with this database.

### Find Patients with Unpaid Bills

This query helps the finance team identify and follow up on outstanding payments.

```sql
SELECT * FROM bills WHERE paidamount < totalamount;
```

--
