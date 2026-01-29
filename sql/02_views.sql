-- KPI Summary---
CREATE OR REPLACE VIEW bi.v_kpi_ticket_summary AS
SELECT
  COUNT(*) AS total_tickets,
  COUNT(*) FILTER (WHERE lower(ticket_status) = 'closed') AS closed_tickets,
  COUNT(*) FILTER (WHERE lower(ticket_status) <> 'closed') AS open_or_pending_tickets,
  ROUND(
    100.0 * COUNT(*) FILTER (WHERE lower(ticket_status) = 'closed') / NULLIF(COUNT(*), 0),
    2
  ) AS closure_rate_pct,
  NULL::numeric AS avg_first_response_minutes,
  ROUND(AVG(resolution_minutes)::numeric, 2) AS avg_resolution_minutes,
  ROUND(AVG(customer_satisfaction_rating)::numeric, 2) AS avg_csat
FROM bi.fact_customer_tickets;


--- SLA Comliance---
CREATE OR REPLACE VIEW bi.v_kpi_sla_compliance AS
SELECT
  COUNT(*) AS total_tickets,
  ROUND(
    100.0 * COUNT(*) FILTER (WHERE first_response_minutes IS NOT NULL AND first_response_minutes <= 60)
    / NULLIF(COUNT(*), 0),
    2
  ) AS first_response_sla_pct,
  ROUND(
    100.0 * COUNT(*) FILTER (WHERE resolution_minutes IS NOT NULL AND resolution_minutes <= 1440)
    / NULLIF(COUNT(*), 0),
    2
  ) AS resolution_sla_pct
FROM bi.fact_customer_tickets;

--- Ticket By Channel----

CREATE OR REPLACE VIEW bi.v_tickets_by_channel AS
SELECT
  ticket_channel,
  COUNT(*) AS total_tickets,
  ROUND(AVG(first_response_minutes)::numeric, 2) AS avg_first_response_min,
  ROUND(AVG(resolution_minutes)::numeric, 2) AS avg_resolution_min,
  ROUND(AVG(customer_satisfaction_rating)::numeric, 2) AS avg_csat
FROM bi.fact_customer_tickets
GROUP BY ticket_channel;


---- Tickets By Priority----

CREATE OR REPLACE VIEW bi.v_tickets_by_priority AS
SELECT
  ticket_priority,
  COUNT(*) AS total_tickets,
  ROUND(AVG(first_response_minutes)::numeric, 2) AS avg_first_response_min,
  ROUND(AVG(resolution_minutes)::numeric, 2) AS avg_resolution_min,
  ROUND(AVG(customer_satisfaction_rating)::numeric, 2) AS avg_csat
FROM bi.fact_customer_tickets
GROUP BY ticket_priority;


----Tickets by Type-----

CREATE OR REPLACE VIEW bi.v_tickets_by_type AS
SELECT
  ticket_type,
  COUNT(*) AS total_tickets,
  ROUND(AVG(first_response_minutes)::numeric, 2) AS avg_first_response_min,
  ROUND(AVG(resolution_minutes)::numeric, 2) AS avg_resolution_min,
  ROUND(AVG(customer_satisfaction_rating)::numeric, 2) AS avg_csat
FROM bi.fact_customer_tickets
GROUP BY ticket_type;

--- Daily Ticket Volume---

CREATE OR REPLACE VIEW bi.v_daily_ticket_volume AS
SELECT
  created_at AS ticket_date,
  COUNT(*) AS tickets_created
FROM bi.fact_customer_tickets
GROUP BY created_at
ORDER BY created_at;

----Hourly Ticket Volume---
CREATE OR REPLACE VIEW bi.v_hourly_ticket_volume AS
SELECT
  date_trunc('hour', first_response_time_ts) AS ticket_hour,
  COUNT(*) AS tickets_created
FROM bi.fact_customer_tickets
WHERE first_response_time_ts IS NOT NULL
GROUP BY 1
ORDER BY 1;


-- Performance by Channel (SLA + volumes)
CREATE OR REPLACE VIEW bi.v_perf_by_channel AS
SELECT
  ticket_channel,
  COUNT(*) AS total_tickets,
  ROUND(AVG(first_response_minutes)::numeric, 2) AS avg_first_response_min,
  ROUND(AVG(resolution_minutes)::numeric, 2) AS avg_resolution_min,
  ROUND(AVG(customer_satisfaction_rating)::numeric, 2) AS avg_csat,
  ROUND(
    100.0 * COUNT(*) FILTER (WHERE first_response_minutes IS NOT NULL AND first_response_minutes <= 60)
    / NULLIF(COUNT(*), 0),
    2
  ) AS first_response_sla_pct,
  ROUND(
    100.0 * COUNT(*) FILTER (WHERE resolution_minutes IS NOT NULL AND resolution_minutes <= 1440)
    / NULLIF(COUNT(*), 0),
    2
  ) AS resolution_sla_pct
FROM bi.fact_customer_tickets
GROUP BY ticket_channel;


-- Performance by Priority (SLA + volumes)
CREATE OR REPLACE VIEW bi.v_perf_by_priority AS
SELECT
  ticket_priority,
  COUNT(*) AS total_tickets,
  ROUND(AVG(first_response_minutes)::numeric, 2) AS avg_first_response_min,
  ROUND(AVG(resolution_minutes)::numeric, 2) AS avg_resolution_min,
  ROUND(AVG(customer_satisfaction_rating)::numeric, 2) AS avg_csat,
  ROUND(
    100.0 * COUNT(*) FILTER (WHERE first_response_minutes IS NOT NULL AND first_response_minutes <= 60)
    / NULLIF(COUNT(*), 0),
    2
  ) AS first_response_sla_pct,
  ROUND(
    100.0 * COUNT(*) FILTER (WHERE resolution_minutes IS NOT NULL AND resolution_minutes <= 1440)
    / NULLIF(COUNT(*), 0),
    2
  ) AS resolution_sla_pct
FROM bi.fact_customer_tickets
GROUP BY ticket_priority;























