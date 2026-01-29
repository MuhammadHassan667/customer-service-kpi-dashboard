# 📊 Customer Service KPI Dashboard (SQL + Power BI)

This project demonstrates an **end-to-end customer service analytics solution** using **PostgreSQL (SQL)** and **Power BI**.  
It focuses on **ticket performance, SLA compliance, resolution efficiency, and customer satisfaction**.

---

## 🚀 Project Overview

Customer support teams need clear KPIs to monitor performance and improve service quality.  
This dashboard provides insights into:

- Ticket volume and distribution
- SLA compliance
- First response and resolution time
- Performance by channel and priority
- Customer satisfaction (CSAT)

The project follows a **BI-style architecture**:
- Raw data → Fact table → KPI views → Power BI dashboard

---

## 🛠️ Tech Stack

- **Database:** PostgreSQL  
- **Data Modeling:** SQL (Views, Aggregations)
- **Visualization:** Power BI
- **Version Control:** GitHub

---

## 🗂️ Project Structure


---

## 🧱 Data Model

- **raw_tickets** – raw customer service ticket data  
- **fact_customer_tickets** – cleaned & transformed fact table  

Key dimensions:
- Ticket Priority
- Ticket Channel
- Ticket Type
- Ticket Status

---

## 📈 Key KPI Views (SQL)

- `v_kpi_ticket_summary` – total, closed, open tickets, closure rate
- `v_kpi_sla_compliance` – SLA compliance metrics
- `v_tickets_by_channel` – ticket distribution by channel
- `v_tickets_by_priority` – ticket distribution by priority
- `v_tickets_by_type` – ticket distribution by type
- `v_daily_ticket_volume` – daily ticket trend
- `v_hourly_ticket_volume` – hourly ticket trend
- `v_perf_by_channel` – avg response & resolution time by channel
- `v_perf_by_priority` – avg response & resolution time by priority

---

## 📊 Power BI Dashboard Pages

### 1️⃣ Executive Overview
- Total tickets
- Closure rate
- Tickets by channel, priority, and type
- Ticket volume trends

### 2️⃣ SLA & Performance
- Average first response time
- Average resolution time
- Performance by priority
- Customer satisfaction (CSAT)

---

## 🧠 Key Insights

- High-priority tickets are resolved faster than low-priority tickets
- Certain channels have higher resolution times
- SLA compliance highlights operational bottlenecks
- CSAT correlates with faster resolution times

---

## 📸 Dashboard Preview

> Screenshots available in the `screenshots/` folder

---

## 🎯 What This Project Demonstrates

- Real-world KPI design
- SQL-based BI modeling (views, aggregations)
- Power BI best practices
- Business-focused analytics thinking

---

## 👤 Author

**Muhammad Hassan**  
Data Analytics | SQL | Power BI | Business Intelligence  

