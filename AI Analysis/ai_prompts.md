/*==========================================================
Project : Healthcare Patient & Hospital Analytics
Database: PostgreSQL
Author  : Jainali Mehta

File:
ai_prompts.md

Description:
This file documents the Generative AI prompts used after
completing SQL analysis for the Healthcare Patient &
Hospital Analytics project.

Generative AI was used as an analytical support tool to
interpret SQL outputs, generate healthcare insights,
improve data storytelling, and support dashboard preparation
before Power BI development.

AI was not used as a replacement for SQL analysis.

Workflow:

PostgreSQL Database
        ↓
SQL Analysis
        ↓
AI Interpretation
        ↓
Business Recommendations
        ↓
Power BI Dashboard Development

Database System:
PostgreSQL
==========================================================*/

/*==========================================================
SECTION 1 : HEALTHCARE BUSINESS OVERVIEW PROMPTS
==========================================================*/

-- Business Area:
-- Overall Healthcare Performance Analysis

AI Prompt:

Act as a Senior Healthcare Business Analyst.

Analyse the SQL results generated from the Healthcare
Patient & Hospital Analytics project.

The analysis includes:

- Total patients
- Total doctors
- Total appointments
- Total treatments
- Total healthcare revenue
- Average treatment cost

Explain:

1. What these healthcare KPIs indicate.
2. Why these metrics are important for hospital management.
3. What operational decisions can be supported from these results.


/*==========================================================
SECTION 2 : PATIENT ANALYSIS PROMPTS
==========================================================*/

-- Business Area:
-- Patient Demographic Analysis

AI Prompt:

Act as a Healthcare Data Analytics Specialist.

Analyse the SQL results showing patient demographic
information.

Identify:

- Patient distribution.
- Patient age patterns.
- Gender distribution.
- Patient location trends.

Explain:

1. What the results indicate.
2. Important patient behaviour patterns.
3. Opportunities to improve patient services and engagement.


-- Business Area:
-- Patient Healthcare Spending Analysis

AI Prompt:

Analyse the SQL output showing patient healthcare spending
behaviour.

Identify:

- Patients with higher healthcare spending.
- Patient treatment cost patterns.
- Important patient groups.

Explain:

1. What the results indicate.
2. Why high-value patients are important.
3. Recommendations to improve patient relationship
   management and healthcare services.

/*==========================================================
SECTION 3 : PATIENT SEGMENTATION PROMPTS
==========================================================*/

-- Business Area:
-- Patient Cost Segmentation Analysis

AI Prompt:

Act as a Healthcare Customer Analytics Consultant.

Analyse SQL results where patients are segmented based on
healthcare spending.

The analysis includes:

- Low Cost Patients
- Medium Cost Patients
- High Cost Patients

Explain:

1. Characteristics of each patient segment.
2. Healthcare utilisation behaviour.
3. Reasons for differences in healthcare costs.
4. Recommendations for improving patient care strategies.

/*==========================================================
SECTION 4 : DOCTOR PERFORMANCE ANALYSIS PROMPTS
==========================================================*/

-- Business Area:
-- Doctor Workload Analysis

AI Prompt:

Act as a Healthcare Operations Analyst.

Analyse the SQL results related to doctor performance.

Identify:

- Doctors handling higher patient volumes.
- Department workload patterns.
- Doctor performance ranking.
- Revenue contribution.

Explain:

1. What the results indicate.
2. Workforce utilisation patterns.
3. Recommendations for improving doctor workload
   management.


-- Business Area:
-- Department Performance Analysis

AI Prompt:

Analyse SQL results showing department performance.

Identify:

- Departments with higher patient activity.
- Departments generating higher revenue.
- Department performance differences.

Explain:

1. Business importance of department analysis.
2. Resource allocation opportunities.
3. Recommendations for operational improvement.

/*==========================================================
SECTION 5 : APPOINTMENT ANALYSIS PROMPTS
==========================================================*/

-- Business Area:
-- Appointment Efficiency Analysis

AI Prompt:

Analyse SQL results related to healthcare appointments.

Identify:

- Completed appointments.
- Cancelled appointments.
- Appointment trends.
- Visit type patterns.

Explain:

1. Appointment efficiency trends.
2. Possible reasons for appointment issues.
3. Recommendations to improve scheduling and patient
   experience.

/*==========================================================
SECTION 6 : TREATMENT ANALYSIS PROMPTS
==========================================================*/

-- Business Area:
-- Treatment Performance Analysis

AI Prompt:

Act as a Healthcare Service Analytics Consultant.

Analyse SQL results related to treatment performance.

Identify:

- Most frequently used treatments.
- Treatment categories.
- Treatment costs.
- Revenue contribution.

Explain:

1. Key treatment performance insights.
2. Business impact of treatment demand.
3. Recommendations for improving healthcare service
   planning.


-- Business Area:
-- Treatment Cost Analysis

AI Prompt:

Analyse SQL results related to treatment costs.

Explain:

- Treatment cost patterns.
- High-cost treatments.
- Cost management opportunities.

Provide healthcare business recommendations based on the
analysis.

/*==========================================================
SECTION 7 : BILLING AND REVENUE ANALYSIS PROMPTS
==========================================================*/

-- Business Area:
-- Healthcare Revenue Analysis

AI Prompt:

Act as a Healthcare Financial Analyst.

Analyse SQL outputs related to healthcare revenue.

Identify:

- Total revenue generated.
- Revenue contribution.
- Payment patterns.
- Financial performance trends.

Explain:

1. Revenue performance.
2. Important financial observations.
3. Opportunities to improve healthcare revenue.


-- Business Area:
-- Payment Analysis

AI Prompt:

Analyse SQL results showing payment information.

Identify:

- Payment methods.
- Payment status.
- Revenue collection patterns.

Explain:

1. Customer payment behaviour.
2. Possible financial challenges.
3. Recommendations to improve payment management.

/*==========================================================
SECTION 8 : INSURANCE CLAIM ANALYSIS PROMPTS
==========================================================*/

-- Business Area:
-- Insurance Claim Performance Analysis

AI Prompt:

Act as a Healthcare Insurance Analytics Specialist.

Analyse SQL results related to insurance claims.

Identify:

- Insurance providers.
- Claim amounts.
- Claim status.
- Approved and rejected claims.

Explain:

1. Insurance claim performance patterns.
2. Possible reasons for rejected claims.
3. Recommendations to improve claim processing efficiency.

/*==========================================================
SECTION 9 : ADVANCED SQL ANALYSIS PROMPTS
==========================================================*/

-- Business Area:
-- Advanced Healthcare Analytics

AI Prompt:

Analyse the advanced SQL results generated from the
Healthcare Patient & Hospital Analytics project.

The analysis includes:

- Ranking analysis.
- Patient segmentation.
- Doctor performance comparison.
- Revenue comparison.
- Trend analysis.

Explain:

1. What the advanced SQL results indicate.
2. Important healthcare business patterns.
3. Operational improvement opportunities.
4. Strategic recommendations.


-- Business Area:
-- Healthcare Performance Ranking Analysis

AI Prompt:

Analyse ranking-based SQL outputs.

Identify:

- Highest performing doctors.
- Highest value patients.
- Highest revenue contributors.

Explain:

1. Why ranking analysis is important.
2. How healthcare management can use these results.
3. Recommendations for improving performance.

/*==========================================================
SECTION 10 : POWER BI DASHBOARD PREPARATION PROMPTS
==========================================================*/

-- Business Area:
-- Healthcare Dashboard Planning

AI Prompt:

Act as a Power BI Healthcare Analytics Consultant.

Based on the completed SQL analysis results, recommend:

- Important healthcare KPIs.
- Suitable dashboard visuals.
- Required filters.
- Important healthcare insights to highlight.

The dashboard should support decision-making for hospital
management by monitoring:

- Patient activity.
- Doctor performance.
- Appointment efficiency.
- Treatment analysis.
- Revenue performance.
- Insurance claims.

/*==========================================================
SECTION 11 : EXECUTIVE INSIGHT GENERATION PROMPTS
==========================================================*/

-- Business Area:
-- Healthcare Management Summary

AI Prompt:

Act as a Healthcare Strategy Consultant.

Using the completed SQL analysis results, generate an
executive summary.

Include:

- Key healthcare insights.
- Operational challenges.
- Financial observations.
- Improvement opportunities.
- Strategic recommendations.

Write the summary for healthcare leadership.

/*==========================================================
SECTION 12 : AI USAGE SUMMARY
==========================================================*/

Generative AI was used in this project for:

- SQL output interpretation.
- Healthcare insight generation.
- Business recommendation creation.
- Data storytelling.
- Dashboard planning support.
- Executive summary preparation.

SQL remained the primary analytical tool for:

- Database creation.
- Data storage.
- Data modelling.
- SQL analysis.
- Business question solving.
- KPI calculations.

/*==========================================================
End of AI Prompt Documentation
==========================================================*/