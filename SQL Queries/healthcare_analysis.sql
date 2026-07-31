/*==========================================================
Project : Healthcare Patient & Hospital Analytics
Database: PostgreSQL
Author  : Jainali Mehta

File:
healthcare_analysis.sql

Description:
This file contains SQL queries used to analyse healthcare
operations, patient behaviour, doctor performance,
treatment costs, billing performance and insurance trends.

Advanced SQL Concepts Included:
- JOIN operations
- GROUP BY analysis
- Aggregate functions
- CASE statements
- Common Table Expressions (CTEs)
- Window Functions
- Ranking Analysis
- Date Analysis

Database System:
PostgreSQL
==========================================================*/

/*==========================================================
SECTION 1 : HEALTHCARE BUSINESS OVERVIEW
==========================================================*/

-- Business Question 1
-- How many patients are registered?

SELECT COUNT(*) AS total_patients
FROM patients;


-- Business Question 2
-- How many doctors are available?

SELECT COUNT(*) AS total_doctors
FROM doctors;


-- Business Question 3
-- How many appointments have been recorded?

SELECT COUNT(*) AS total_appointments
FROM appointments;


-- Business Question 4
-- What is the collected healthcare revenue?

SELECT SUM(total_amount) AS total_healthcare_revenue
FROM billing
WHERE payment_status = 'Paid';


-- Business Question 5
-- What is the average treatment cost?

SELECT ROUND(AVG(treatment_cost),2) AS average_treatment_cost
FROM treatments;

/*==========================================================
SECTION 2 : PATIENT ANALYSIS
==========================================================*/

-- Which cities have the highest number of patients?

SELECT city, COUNT(patient_id) AS total_patients
FROM patients
GROUP BY city
ORDER BY total_patients DESC;


-- What is the patient gender distribution?

SELECT gender, COUNT(patient_id) AS patient_count
FROM patients
GROUP BY gender
ORDER BY patient_count DESC;


-- What is the average patient age?

SELECT ROUND(AVG(age),2) AS average_patient_age
FROM patients;


-- Which patients have the highest healthcare spending?

SELECT p.patient_name, SUM(b.total_amount) AS total_spending
FROM patients p
JOIN billing b
ON p.patient_id = b.patient_id
GROUP BY p.patient_name
ORDER BY total_spending DESC;


-- Which patients have spent more than average?

SELECT p.patient_name, SUM(b.total_amount) AS total_spending
FROM patients p
JOIN billing b
ON p.patient_id = b.patient_id
GROUP BY p.patient_name
HAVING SUM(b.total_amount) > (SELECT AVG(total_amount)
FROM billing)
ORDER BY total_spending DESC;


/*==========================================================
SECTION 3 : DOCTOR PERFORMANCE ANALYSIS
==========================================================*/

-- How many patients are handled by each doctor?

SELECT d.doctor_name, COUNT(DISTINCT a.patient_id) AS total_patients
FROM doctors d
LEFT JOIN appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_name
ORDER BY total_patients DESC;


-- Which departments have the highest workload?

SELECT d.department, COUNT(a.appointment_id) AS appointment_volume
FROM doctors d
JOIN appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.department
ORDER BY appointment_volume DESC;


-- Which doctors generate the highest treatment revenue?

SELECT d.doctor_name, SUM(t.treatment_cost) AS generated_revenue
FROM doctors d
JOIN appointments a
ON d.doctor_id = a.doctor_id
JOIN treatments t
ON a.appointment_id = t.appointment_id
GROUP BY d.doctor_name
ORDER BY generated_revenue DESC;


/*==========================================================
SECTION 4 : APPOINTMENT ANALYSIS
==========================================================*/

-- What is the appointment status distribution?

SELECT appointment_status, COUNT(*) AS total_appointments
FROM appointments
GROUP BY appointment_status
ORDER BY total_appointments DESC;


-- What is the appointment completion percentage?

SELECT ROUND(
    COUNT(*) FILTER (WHERE appointment_status = 'Completed') * 100.0
    / NULLIF(COUNT(*), 0),
    2
) AS completion_percentage
FROM appointments;


-- Monthly appointment trend

SELECT DATE_TRUNC('month',appointment_date) AS appointment_month, COUNT(*) AS total_appointments
FROM appointments
GROUP BY appointment_month
ORDER BY appointment_month;


-- Which visit type is most common?

SELECT visit_type, COUNT(*) AS total_visits
FROM appointments
GROUP BY visit_type
ORDER BY total_visits DESC;


/*==========================================================
SECTION 5 : TREATMENT ANALYSIS
==========================================================*/

-- Which treatments are most frequently provided?

SELECT treatment_name, COUNT(*) AS treatment_count
FROM treatments
GROUP BY treatment_name
ORDER BY treatment_count DESC;


-- Which treatment categories generate the highest revenue?

SELECT treatment_category, SUM(treatment_cost) AS total_revenue
FROM treatments
GROUP BY treatment_category
ORDER BY total_revenue DESC;


-- Average treatment cost by category

SELECT treatment_category, ROUND(AVG(treatment_cost),2) AS average_cost
FROM treatments
GROUP BY treatment_category
ORDER BY average_cost DESC;

/*==========================================================
SECTION 6 : BILLING ANALYSIS
==========================================================*/

-- What is the payment status distribution?

SELECT payment_status, COUNT(*) AS total_bills
FROM billing
GROUP BY payment_status
ORDER BY total_bills DESC;


-- Which payment methods are commonly used?

SELECT payment_method, COUNT(*) AS transaction_count, SUM(total_amount) AS total_amount
FROM billing
GROUP BY payment_method
ORDER BY total_amount DESC;


-- Total unpaid billing amount

SELECT SUM(total_amount) AS unpaid_amount
FROM billing
WHERE payment_status='Pending';


-- Monthly collected healthcare revenue trend

SELECT DATE_TRUNC('month', billing_date) AS month, SUM(total_amount) AS revenue
FROM billing
WHERE payment_status = 'Paid'
GROUP BY DATE_TRUNC('month', billing_date)
ORDER BY month;


/*==========================================================
SECTION 7 : INSURANCE CLAIM ANALYSIS
==========================================================*/

-- Which insurance providers process the highest claims?

SELECT insurance_provider, COUNT(*) AS total_claims, SUM(claim_amount) AS claim_value
FROM insurance_claims
GROUP BY insurance_provider
ORDER BY claim_value DESC;


-- Insurance claim approval status

SELECT claim_status, COUNT(*) AS claim_count
FROM insurance_claims
GROUP BY claim_status
ORDER BY claim_count DESC;


-- Total insurance claim value

SELECT SUM(claim_amount) AS total_claim_value
FROM insurance_claims;


/*==========================================================
SECTION 8 : ADVANCED SQL ANALYSIS
==========================================================*/

-- Advanced Analysis 1
-- Rank doctors based on patient workload

WITH doctor_patient_count AS (SELECT d.doctor_name,
COUNT(a.patient_id) AS total_patients
FROM doctors d
JOIN appointments a
ON d.doctor_id=a.doctor_id
GROUP BY d.doctor_name)
SELECT doctor_name, total_patients, RANK() OVER (ORDER BY total_patients DESC) AS doctor_rank
FROM doctor_patient_count;


-- Advanced Analysis 2
-- Rank patients based on healthcare spending


WITH patient_spending AS (SELECT p.patient_name, SUM(b.total_amount) AS total_spending
FROM patients p
JOIN billing b
ON p.patient_id=b.patient_id
GROUP BY p.patient_name)
SELECT patient_name, total_spending,
DENSE_RANK() OVER (ORDER BY total_spending DESC) AS spending_rank
FROM patient_spending;


-- Advanced Analysis 3
-- Patient cost segmentation

SELECT p.patient_name, SUM(b.total_amount) AS total_spending,
CASE
WHEN SUM(b.total_amount) < 500
THEN 'Low Cost Patient'
WHEN SUM(b.total_amount) BETWEEN 500 AND 1000
THEN 'Medium Cost Patient'
ELSE 'High Cost Patient'
END AS patient_category
FROM patients p
JOIN billing b
ON p.patient_id=b.patient_id
GROUP BY p.patient_name;


-- Advanced Analysis 4
-- Running healthcare revenue calculation

SELECT bill_id, total_amount, SUM(total_amount) OVER (ORDER BY bill_id) AS running_revenue
FROM billing;


-- Advanced Analysis 5
-- Revenue comparison using previous transaction

SELECT bill_id, total_amount, LAG(total_amount) OVER (ORDER BY bill_id) AS previous_amount
FROM billing;

/*==========================================================
End of SQL Analysis
==========================================================*/
