/*==========================================================
Project : Healthcare Patient & Hospital Analytics
Database: PostgreSQL
Author  : Jainali Mehta

File:
insert_data.sql

Description:
This file inserts sample healthcare operational data into
the Healthcare Analytics database tables.

Insertion Order:
1. patients
2. doctors
3. appointments
4. treatments
5. billing
6. insurance_claims

Note:
Data is inserted according to foreign key relationships.

Database System:
PostgreSQL
==========================================================*/

-- Make the sample load repeatable without creating duplicate rows.
TRUNCATE TABLE insurance_claims, billing, treatments, appointments, doctors, patients
RESTART IDENTITY CASCADE;

/*==========================================================
SECTION 1 : INSERT DATA INTO PATIENTS TABLE
Stores patient demographic information.
==========================================================*/

INSERT INTO patients

(patient_name, age, gender, city, province, registration_date)

VALUES

('Emma Wilson',34,'Female','Toronto','Ontario','2025-01-10'),

('Daniel Brown',56,'Male','Vancouver','British Columbia','2025-01-15'),

('Olivia Martin',29,'Female','Calgary','Alberta','2025-02-05'),

('James Anderson',45,'Male','Montreal','Quebec','2025-02-20'),

('Sophia Taylor',67,'Female','Ottawa','Ontario','2025-03-01'),

('William Harris',52,'Male','Toronto','Ontario','2025-03-15'),

('Ava Thompson',38,'Female','Vancouver','British Columbia','2025-04-01'),

('Benjamin Clark',61,'Male','Calgary','Alberta','2025-04-12'),

('Isabella Lewis',26,'Female','Montreal','Quebec','2025-05-05'),

('Henry Walker',49,'Male','Ottawa','Ontario','2025-05-20');

/*==========================================================
SECTION 2 : INSERT DATA INTO DOCTORS TABLE
Stores healthcare provider information.
==========================================================*/

INSERT INTO doctors

(doctor_name, specialization, department, experience_years)

VALUES

('Dr. Sarah Johnson','Cardiology','Heart Care',15),

('Dr. Michael Smith','Neurology','Brain & Nerve Care',12),

('Dr. Emily Davis','Dermatology','Skin Care',8),

('Dr. Robert Wilson','Orthopedics','Bone & Joint Care',20),

('Dr. Jessica Brown','General Medicine','Primary Care',10),

('Dr. David Miller','Pediatrics','Child Healthcare',14);

/*==========================================================
SECTION 3 : INSERT DATA INTO APPOINTMENTS TABLE
Stores patient appointment information.
==========================================================*/

INSERT INTO appointments

(patient_id, doctor_id, appointment_date, appointment_status, visit_type)

VALUES

(1,1,'2025-02-01','Completed','Consultation'),

(2,2,'2025-02-05','Completed','Follow-up'),

(3,3,'2025-02-10','Completed','Consultation'),

(4,4,'2025-02-15','Cancelled','Consultation'),

(5,5,'2025-03-05','Completed','Routine Checkup'),

(6,1,'2025-03-15','Completed','Follow-up'),

(7,6,'2025-04-01','Completed','Consultation'),

(8,4,'2025-04-10','Completed','Treatment'),

(9,3,'2025-05-01','Cancelled','Consultation'),

(10,2,'2025-05-15','Completed','Follow-up'),

(1,5,'2025-06-01','Completed','Routine Checkup'),

(3,1,'2025-06-10','Completed','Consultation');

/*==========================================================
SECTION 4 : INSERT DATA INTO TREATMENTS TABLE
Stores treatment details and healthcare costs.
==========================================================*/

INSERT INTO treatments

(appointment_id, treatment_name, treatment_category, treatment_cost)

VALUES

(1,'Heart Examination','Cardiology',500),

(2,'MRI Scan','Neurology',1200),

(3,'Skin Treatment','Dermatology',300),

(5,'Health Screening','General Medicine',250),

(6,'Cardiac Test','Cardiology',800),

(7,'Child Wellness Check','Pediatrics',200),

(8,'Physiotherapy','Orthopedics',700),

(10,'Neurological Assessment','Neurology',900),

(11,'General Consultation','General Medicine',150),

(12,'Heart Monitoring','Cardiology',1000);

/*==========================================================
SECTION 5 : INSERT DATA INTO BILLING TABLE
Stores payment and billing information.
==========================================================*/

INSERT INTO billing

(bill_id, patient_id, treatment_id, billing_date, total_amount, payment_status, payment_method)

VALUES

(1,1,1,'2025-02-01',500.00,'Paid','Credit Card'),

(2,2,2,'2025-02-05',1200.00,'Paid','Insurance'),

(3,3,3,'2025-02-10',300.00,'Paid','Debit Card'),

(4,5,4,'2025-03-05',250.00,'Paid','Credit Card'),

(5,6,5,'2025-03-15',800.00,'Pending','Insurance'),

(6,7,6,'2025-04-01',200.00,'Paid','Debit Card'),

(7,8,7,'2025-04-10',700.00,'Paid','Credit Card'),

(8,10,8,'2025-05-15',900.00,'Pending','Insurance'),

(9,1,9,'2025-06-01',150.00,'Paid','Cash'),

(10,3,10,'2025-06-10',1000.00,'Paid','Insurance');

/*==========================================================
SECTION 6 : INSERT DATA INTO INSURANCE_CLAIMS TABLE
Stores insurance claim information.
==========================================================*/

INSERT INTO insurance_claims

(patient_id, insurance_provider, claim_amount, claim_status, claim_date)

VALUES

(1,'Sun Life',500,'Approved','2025-02-05'),

(2,'Manulife',1200,'Approved','2025-02-10'),

(5,'Blue Cross',250,'Approved','2025-03-10'),

(6,'Sun Life',800,'Pending','2025-03-20'),

(8,'Manulife',700,'Approved','2025-04-15'),

(10,'Blue Cross',900,'Rejected','2025-05-20'),

(3,'Sun Life',1000,'Approved','2025-06-15');

/*==========================================================
End of Data Loading
==========================================================*/
