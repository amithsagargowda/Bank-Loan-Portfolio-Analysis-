# Project Overview
This project analyzes a bank’s loan portfolio to assess lending performance, repayment behavior, and credit risk indicators.
The objective is to provide a clear portfolio health view for business and management stakeholders using structured SQL analysis and interactive Power BI dashboards.

# Business Objectives
-Evaluate overall loan portfolio performance
-Understand Good vs Bad loan distribution
-Identify high-risk segments using early warning indicators
-Enable data-driven monitoring and decision-making

# Tools Used
SQL (MySQL) – Data aggregation, KPI calculation, segmentation
Power BI – Interactive dashboards and visual reporting

# Dataset Description
~38,000 loan records
One row per loan

# Key fields:
-Loan amount, funded amount, amount received
-Loan status (Fully Paid, Current, Charged Off)
-Interest rate, DTI
-Purpose, employment length, state

# SQL Analysis
SQL was used to calculate and prepare core lending metrics, including:
Total loan applications
Total funded amount
Total amount received
Average interest rate and DTI
Month-over-month and month-to-date trends
Loan segmentation by:
Status (Good vs Bad loans)
Purpose
Employment length
Geography (state)

# Early Warning Risk Band (Enhancement)
A rule-based risk banding layer was added using SQL to classify loans into:
Low Risk
Medium Risk
High Risk
The logic uses interest rate, DTI, and loan status and is stored as a permanent column to ensure consistent analysis across dashboards.

# Power BI Dashboard
The Power BI report includes three main sections:
-Summary
Portfolio KPIs
Good vs Bad loan split
Portfolio health snapshot

-Overview
Monthly lending trends
Loan purpose and term distribution
State-wise funded amount

# Details
Loan-level table
Interactive slicers for deeper analysis
The dashboard is designed for clarity, simplicity, and stakeholder usability.

# Key Insights
Good loans account for the majority of applications, while bad loans contribute disproportionately to losses
Certain loan purposes dominate total funded amount
Higher interest rate and DTI loans show weaker repayment behavior
Risk banding highlights segments requiring closer monitoring

Dashboard Preview
[Dashboard Preview](https://github.com/amithsagargowda/Bank-Loan-Portfolio-Analysis-/blob/main/snapshot%20summary.png)
