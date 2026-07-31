# Healthcare Patient & Hospital Analytics

A PostgreSQL portfolio project that models patients, clinicians, appointments, treatments, billing, and insurance claims for operational and financial analysis.

## What this project demonstrates

- Relational healthcare data modelling with integrity constraints
- Repeatable loading of a synthetic dataset
- Patient, clinician, appointment, treatment, billing, and claim analysis
- CTEs, window functions, ranking, segmentation, and date-based reporting
- Clear separation between collected revenue and pending bill amounts

## Repository structure

```text
.
├── .github/workflows/sql-validation.yml
├── AI Analysis/
│   ├── ai_insights.md
│   ├── ai_prompts.md
│   └── business_recommendations.md
├── Database/
│   ├── create_tables.sql
│   └── insert_data.sql
├── SQL Queries/
│   └── healthcare_analysis.sql
├── scripts/validate.sh
└── README.md
```

## Data model

| Table | Purpose | Key relationships |
| --- | --- | --- |
| `patients` | Synthetic patient demographics and registration | Parent of appointments, bills, and claims |
| `doctors` | Clinician specialization and department | Parent of appointments |
| `appointments` | Patient visits and their outcomes | References patients and doctors |
| `treatments` | One treatment and cost per treated appointment | References appointments |
| `billing` | One bill per treatment with payment state | References patients and treatments |
| `insurance_claims` | Claim amount, provider, state, and date | References patients |

## Requirements

- PostgreSQL 12 or later
- `psql` and `createdb` on your `PATH`

## Run locally

From the repository root:

```bash
createdb healthcare_analytics
psql -v ON_ERROR_STOP=1 -d healthcare_analytics -f "Database/create_tables.sql"
psql -v ON_ERROR_STOP=1 -d healthcare_analytics -f "Database/insert_data.sql"
psql -v ON_ERROR_STOP=1 -d healthcare_analytics -f "SQL Queries/healthcare_analysis.sql"
```

`insert_data.sql` truncates these sample tables and restarts their identity values before loading data. Do not run it against tables containing data you need to preserve.

To use an existing PostgreSQL connection:

```bash
psql "$DATABASE_URL" -v ON_ERROR_STOP=1 -f "Database/create_tables.sql"
psql "$DATABASE_URL" -v ON_ERROR_STOP=1 -f "Database/insert_data.sql"
psql "$DATABASE_URL" -v ON_ERROR_STOP=1 -f "SQL Queries/healthcare_analysis.sql"
```

## Validate the project

Set `DATABASE_URL` to an empty PostgreSQL database and run:

```bash
DATABASE_URL="postgresql:///healthcare_analytics" ./scripts/validate.sh
```

The validator runs the schema and seed twice, executes every analysis query, checks expected row counts, collected revenue, billing chronology, and patient linkage, then rolls back its changes. GitHub Actions runs the same validation on every push and pull request.

## Metric definitions

- **Collected revenue:** sum of bills whose `payment_status` is `Paid`.
- **Unpaid amount:** sum of bills whose status is `Pending`.
- **Completion percentage:** completed appointments divided by all appointments.
- **Doctor patient count:** distinct patients with an appointment assigned to each doctor.

## Analysis coverage

The analysis file includes:

- Patient demographics and spending
- Doctor workload and treatment revenue
- Appointment status, completion, visit type, and monthly volume
- Treatment frequency, category revenue, and average cost
- Paid and pending billing analysis
- Insurance provider and claim-status summaries
- Patient and clinician rankings, segmentation, running totals, and lag comparisons

## AI analysis notes

Files under `AI Analysis/` contain prompt examples and qualitative recommendations. They are not clinical guidance. Validate every statement against the SQL output and appropriate domain expertise before operational use.

## Privacy and limitations

- All names and records are synthetic; do not replace them with identifiable patient information in a public repository.
- This schema is an analytics demonstration, not an electronic health record or clinical system.
- It does not model diagnosis codes, clinical outcomes, claim-to-bill links, partial payments, or regulatory controls.
- The dataset is too small for statistical or clinical inference.

## Author

Jainali Mehta — Data Analytics Portfolio Project
