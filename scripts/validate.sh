#!/usr/bin/env bash
set -euo pipefail

if ! command -v psql >/dev/null 2>&1; then
  echo "psql is required to validate this project." >&2
  exit 1
fi

DATABASE_URL="${DATABASE_URL:-postgresql:///healthcare_analytics}"
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_ROOT"

psql "$DATABASE_URL" -X -v ON_ERROR_STOP=1 <<'SQL'
BEGIN;
\i 'Database/create_tables.sql'
\i 'Database/insert_data.sql'
-- A second load proves that the sample-data workflow is repeatable.
\i 'Database/create_tables.sql'
\i 'Database/insert_data.sql'
\i 'SQL Queries/healthcare_analysis.sql'

DO $validation$
BEGIN
    IF (SELECT COUNT(*) FROM patients) <> 10
       OR (SELECT COUNT(*) FROM doctors) <> 6
       OR (SELECT COUNT(*) FROM appointments) <> 12
       OR (SELECT COUNT(*) FROM treatments) <> 10
       OR (SELECT COUNT(*) FROM billing) <> 10
       OR (SELECT COUNT(*) FROM insurance_claims) <> 7 THEN
        RAISE EXCEPTION 'Unexpected sample row count';
    END IF;

    IF (SELECT SUM(total_amount) FROM billing WHERE payment_status = 'Paid') <> 4300 THEN
        RAISE EXCEPTION 'Collected revenue assertion failed';
    END IF;

    IF EXISTS (
        SELECT 1
        FROM billing b
        JOIN treatments t ON t.treatment_id = b.treatment_id
        JOIN appointments a ON a.appointment_id = t.appointment_id
        WHERE b.patient_id <> a.patient_id OR b.billing_date < a.appointment_date
    ) THEN
        RAISE EXCEPTION 'Billing chronology or patient linkage assertion failed';
    END IF;
END
$validation$;

ROLLBACK;
SQL

echo "Healthcare SQL validation passed."
