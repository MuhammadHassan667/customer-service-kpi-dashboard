-- =========================================
-- STEP 1: Create BI schema
-- =========================================
CREATE SCHEMA IF NOT EXISTS bi;

-- =========================================
-- STEP 2: Raw tickets table (as imported)
-- =========================================
DROP TABLE IF EXISTS bi.raw_tickets;

CREATE TABLE bi.raw_tickets (
    ticket_id TEXT,
    customer_name TEXT,
    customer_email TEXT,
    customer_age TEXT,
    customer_gender TEXT,
    product_purchased TEXT,
    date_of_purchase TEXT,
    ticket_type TEXT,
    ticket_subject TEXT,
    ticket_description TEXT,
    ticket_status TEXT,
    resolution TEXT,
    ticket_priority TEXT,
    ticket_channel TEXT,
    first_response_time_ts TEXT,
    resolution_time_ts TEXT,
    customer_satisfaction_rating TEXT,
    created_at TEXT
);

-- =========================================
-- STEP 3: Fact table (clean & typed)
-- =========================================
DROP TABLE IF EXISTS bi.fact_customer_tickets;

CREATE TABLE bi.fact_customer_tickets (
    ticket_id TEXT PRIMARY KEY,
    customer_name TEXT,
    customer_email TEXT,
    customer_age INTEGER,
    customer_gender TEXT,
    product_purchased TEXT,
    date_of_purchase DATE,
    ticket_type TEXT,
    ticket_subject TEXT,
    ticket_description TEXT,
    ticket_status TEXT,
    resolution TEXT,
    ticket_priority TEXT,
    ticket_channel TEXT,
    created_at TIMESTAMP,
    first_response_time_ts TIMESTAMP,
    resolution_time_ts TIMESTAMP,
    first_response_minutes INTEGER,
    resolution_minutes INTEGER,
    customer_satisfaction_rating NUMERIC
);

