📊 Customer Service KPI Dashboard
PostgreSQL · ETL · Power BI
A production-ready business intelligence dashboard that replaced a 12-hour weekly manual Excel reporting process with a fully automated, end-to-end pipeline — delivering real-time customer service insights to senior management.

🧩 Business Problem
The customer service team was spending ~12 hours every week manually compiling data from multiple sources into Excel reports. The process was error-prone, time-consuming, and delivered insights that were already days old by the time anyone read them.
Goal: Build a reliable, automated pipeline that surfaces KPIs in real time — so management spends time acting on data, not preparing it.

📈 Dashboard Overview
The dashboard is split into two core sections:
Executive Overview
MetricDescriptionTotal TicketsVolume of customer service tickets in the selected periodFirst Response SLA %Percentage of tickets receiving a first response within the SLA windowResolution SLA %Percentage of tickets resolved within the defined SLA timeframeTickets by PriorityBreakdown of ticket volume by priority level (Critical, High, Medium, Low)Tickets by ChannelDistribution of incoming tickets by source (Email, Chat, Phone, Portal, Social)Ticket Type MixProportion of Technical Issues, Billing Requests, and General Enquiries
SLA & Performance
MetricDescriptionAvg Resolution TimeAverage time (in hours) to resolve a ticket across all prioritiesAvg Resolution Time by PriorityResolution time segmented by ticket priority — identifies where SLAs are at riskAvg TSATAverage customer satisfaction scoreAvg TSAT by PrioritySatisfaction scores by priority level — surfaces correlation between urgency and experience

🛠️ Tech Stack
LayerToolData StoragePostgreSQLData PipelineETL (Extract, Transform, Load)TransformationSQL (CTEs, Views, Stored Procedures)VisualisationMicrosoft Power BIVersion ControlGit & GitHub

🔄 Pipeline Architecture
Raw Source Data
      │
      ▼
PostgreSQL Database
      │
      ▼
ETL Pipeline (SQL Views + Stored Procedures)
      │
      ▼
Transformed Data Layer
      │
      ▼
Power BI Dashboard (auto-refresh)
      │
      ▼
Senior Management Reports

💡 Key Outcomes

⏱️ Eliminated ~12 hours/week of manual Excel preparation
📉 Reduced reporting errors by 90% through automated data validation
📊 6 KPI views now opened by senior management every week for resource and budget decisions
🔁 Pipeline runs automatically — zero manual intervention after deployment


📁 Project Structure
customer-service-kpi-dashboard/
│
├── sql/
│   ├── schema.sql           # Database schema and table definitions
│   ├── etl_pipeline.sql     # ETL transformations and stored procedures
│   └── views.sql            # KPI views used by Power BI
│
├── powerbi/
│   └── dashboard.pbix       # Power BI report file
│
├── screenshots/
│   └── dashboard_preview.png
│
└── README.md

🚀 How to Run

Set up PostgreSQL — Create the database using sql/schema.sql
Load your data — Insert or connect your customer service data source
Run the ETL — Execute sql/etl_pipeline.sql to transform and load data
Open Power BI — Open powerbi/dashboard.pbix and update the data source connection to your PostgreSQL instance
Refresh — Click Refresh in Power BI to pull the latest data


Requirements: PostgreSQL 13+, Power BI Desktop (free)

👤 Author
Muhammad Hassan
Data Analytics | SQL | Power BI | Business Intelligence
🔗 LinkedIn : www.linkedin.com/in/muhammad-hassan-saeed541
📧 Email: muhammad2297hassan@gmail.com 

📄 License
MIT License — feel free to use this project as a reference or template.
