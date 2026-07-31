# Healthcare Patient & Hospital Analytics Project


## Project Overview

This project focuses on analysing healthcare patient and hospital data to understand patient behaviour, doctor performance, treatment patterns, appointment trends, and revenue generation.

The project demonstrates an end-to-end data analytics workflow by designing a relational database, loading healthcare data, performing SQL analysis, integrating Generative AI for insight generation, and preparing insights for dashboard development.

The objective of this project is to transform raw healthcare data into meaningful insights that support data-driven decision-making and improve healthcare operational efficiency.

---

# Business Problem

A healthcare organisation wants to analyse its patient management, hospital operations, treatment performance, and financial outcomes.

The business requires answers to important questions:

- Which patients contribute the highest healthcare value?
- Which doctors manage the highest patient workload?
- Which departments perform best?
- Which treatments generate the highest revenue?
- What are the appointment and patient activity trends?
- How can healthcare operations be improved using data?

---

# Project Objectives

The main objectives of this project are:

- Design and build a relational database using PostgreSQL.
- Create structured tables for patients, doctors, visits, treatments, billing, and insurance claims.
- Load healthcare data into the database.
- Write SQL queries to solve healthcare business questions.
- Analyse patient, doctor, treatment, appointment, and revenue performance.
- Apply advanced SQL techniques for healthcare analytics.
- Use Generative AI to interpret SQL outputs and generate healthcare insights.
- Prepare analytical outputs for Power BI dashboard development.

---

# Tools & Technologies Used

| Tool | Purpose |
|---|---|
| PostgreSQL | Database creation, data storage and SQL analysis |
| pgAdmin 4 | Database administration and query execution |
| VS Code | SQL development and project documentation |
| GitHub | Version control and portfolio presentation |
| Power BI | Interactive dashboard development |
| Generative AI | SQL interpretation, insights generation and business recommendations |

---

# Project Workflow

```

Business Understanding

    ↓

Database Design

     ↓

Create Tables Using PostgreSQL

    ↓

Insert Data

    ↓

SQL Business Analysis

    ↓

AI Analysis

    ↓

Business Insights

    ↓

Power BI Dashboard Development

    ↓

Business Recommendations

```

---

# Database Design

The project uses a relational database structure containing six main tables:


                patients
                     |
                     |
                  visits
                     |
      --------------------------------
      |              |               |
      |              |               |
   doctors       treatments       billing
                                     |
                                     |
                            insurance_claims


---

# Database Tables

| Table | Description |
|---|---|
| patients | Stores patient demographic information |
| doctors | Stores doctor information and department details |
| visits | Stores patient appointment and visit information |
| treatments | Stores treatment details and healthcare services |
| billing | Stores payment and revenue transaction records |
| insurance_claims | Stores insurance claim information |

---

# Data Model Explanation

## Patients Table

Stores patient information:

- Patient name
- Age
- Gender
- Contact information
- City
- Registration date

## Doctors Table

Stores doctor information:

- Doctor name
- Department
- Specialisation
- Experience

## Visits Table

Stores patient visit information:

- Patient ID
- Doctor ID
- Visit date
- Appointment status
- Visit type

## Treatments Table

Stores treatment information:

- Treatment name
- Treatment category
- Treatment cost
- Treatment date

## Billing Table

Stores financial transaction information:

- Patient ID
- Treatment cost
- Payment method
- Payment status

## Insurance Claims Table

Stores insurance information:

- Insurance provider
- Claim amount
- Claim status
- Claim date

---

# SQL Analysis Performed

## Patient Analysis

Business questions analysed:

- Who are the highest value patients?
- How many patients are registered?
- What are patient demographic patterns?
- Which patients contribute higher healthcare spending?

SQL concepts used:

- JOIN operations
- GROUP BY
- COUNT()
- SUM()
- ORDER BY

---

## Doctor Analysis

Business questions analysed:

- Which doctors handle the highest patient volume?
- Which departments have the highest activity?
- What is doctor workload distribution?

SQL concepts used:

- INNER JOIN
- LEFT JOIN
- Aggregations
- Ranking analysis

---

## Appointment Analysis

Business questions analysed:

- How many visits were recorded?
- What are appointment status trends?
- How efficient is appointment management?

SQL concepts used:

- Date functions
- COUNT()
- GROUP BY
- Filtering

---

## Treatment Analysis

Business questions analysed:

- Which treatments are most common?
- Which treatments generate the highest revenue?
- What are treatment cost patterns?

SQL concepts used:

- SUM()
- AVG()
- GROUP BY
- Revenue calculations

---

## Revenue Analysis

Business questions analysed:

- What is the total healthcare revenue?
- What are the major revenue contributors?
- What are healthcare payment trends?

SQL concepts used:

- SUM()
- AVG()
- GROUP BY
- KPI calculations

---

# SQL Skills Demonstrated

This project demonstrates practical SQL and database skills:

- Database creation
- Relational database design
- Primary keys and foreign keys
- Data insertion
- SELECT statements
- Filtering using WHERE
- Aggregate functions:
  - COUNT()
  - SUM()
  - AVG()
- GROUP BY analysis
- ORDER BY ranking
- INNER JOIN
- LEFT JOIN
- Subqueries
- CASE statements
- Date-based analysis
- Window functions
- Business KPI calculations

---

# AI Analysis

This project integrates Generative AI after completing SQL analysis to enhance healthcare understanding and improve data-driven decision-making.

Generative AI was used as an analytical support tool to interpret SQL outputs, convert technical results into healthcare insights, generate recommendations, and support dashboard planning.

AI was not used as a replacement for SQL analysis. SQL remained the primary analytical tool for database creation, data extraction, querying, KPI calculations, and solving business questions.

---

# AI Workflow

```

SQL Business Analysis 

    ↓

AI Prompt Engineering

    ↓

SQL Resullt Interpretation

    ↓

Healthcare Insights Generation

    ↓

Business recommendations

    ↓

Power BI Dashboard Develpoment

```

---

# AI Files Included

| File | Purpose |
|---|---|
| ai_prompts.md | Documents Generative AI prompts used to analyse SQL outputs |
| ai_insights.md | Converts SQL analysis results into healthcare-focused insights |
| business_recommendations.md | Provides AI-assisted business recommendations based on SQL findings |

---

# AI Capabilities Demonstrated

Generative AI was used in this project for:

- SQL result interpretation.
- Healthcare insight generation.
- Data storytelling.
- Recommendation development.
- KPI explanation.
- Dashboard planning support.

---

# AI Skills Demonstrated

This project demonstrates practical use of Generative AI in analytics:

- Prompt Engineering
- AI-assisted Business Intelligence
- Data Interpretation
- Business Recommendation Generation
- AI-supported Decision Making
- Analytical Storytelling

---

# Key Business Insights

## Patient Insights

The analysis helps identify:

- High-value patients contributing higher healthcare revenue.
- Patient behaviour patterns.
- Patient healthcare utilisation trends.
- Opportunities to improve patient engagement.

## Doctor Insights

The analysis helps identify:

- Doctor workload distribution.
- Department performance.
- Healthcare resource requirements.
- Workforce optimisation opportunities.

## Treatment Insights

The analysis helps identify:

- Best-performing treatments.
- Treatment cost patterns.
- Revenue-generating healthcare services.
- Areas for treatment improvement.

## Revenue Insights

The analysis helps identify:

- Overall healthcare financial performance.
- Revenue contributors.
- Payment patterns.
- Opportunities for cost optimisation.

---

# Project Structure

Healthcare-Patient-Hospital-Analytics
│
├── database
│ │
│ ├── create_tables.sql
│ │
│ └── insert_data.sql
│
├── sql_queries
│ │
│ └── healthcare_analysis.sql
│
├── ai_analysis
│ │
│ ├── ai_prompts.md
│ │
│ ├── ai_insights.md
│ │
│ └── business_recommendations.md
│
├── powerbi
│ │
│ └── Healthcare_Dashboard.pbix
│
├── images
│ │
│ └── dashboard.png
│
└── README.md

---

# How To Run This Project

## Step 1: Create Database Tables

Run:

```
database/create_tables.sql
```

This creates all required PostgreSQL tables.

## Step 2: Insert Data

Run:

```
database/insert_data.sql
```

This loads sample healthcare transaction data.

## Step 3: Run SQL Analysis

Run:

```
sql_queries/healthcare_analysis.sql
```

This executes healthcare business analysis queries.

## Step 4: AI Analysis

Review:

```
ai_analysis/
```

This contains:

- AI prompts.
- AI insights.
- Business recommendations.

## Step 5: Power BI Dashboard

Connect PostgreSQL with Power BI to create interactive dashboards and visualise healthcare insights.

---

# Future Enhancements

Future improvements planned:

- Build interactive Power BI healthcare dashboard.
- Add patient segmentation analysis.
- Include advanced SQL window functions.
- Add healthcare forecasting.
- Automate healthcare reporting workflow.

---

# Author

**Jainali Mehta**

Data Analytics Portfolio Project

Skills Demonstrated:
PostgreSQL | SQL | Data Modelling | Business Intelligence | Generative AI | Power BI