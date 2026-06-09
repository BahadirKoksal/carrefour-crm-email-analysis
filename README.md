# 📧 Carrefour CRM Email Campaign Analysis

## 📌 Project Overview
This project analyzes Carrefour's CRM email campaign data using BigQuery SQL. The goal is to measure campaign performance through key marketing KPIs and provide data-driven insights for the marketing team — with a focus on the France newsletter segment.

---

## 🎯 CRM Team Objectives
- Build brand loyalty through targeted communication
- Increase conversion by showcasing offers and promotions
- Prevent churn by re-engaging at-risk customers

---

## 📊 KPIs Tracked
- opening_rate = open_count / send_count
- click_rate = click_count / send_count
- CTR = click_count / open_count
- revenue_per_mille = (revenue / send_count) × 1000

---

## 🗃️ Dataset
- Platform: Google BigQuery
- Dataset: course14
- Table: gwz_mail
- Columns: journey_id, journey_name, sent_nb, opening_nb, click_nb, turnover

### Campaign Naming Convention
YYMMDD_country_campaigntype_segment
- nl = France newsletter
- nlbe = Belgium newsletter
- sto = store segment
- nosto = no store segment

---

## 🔄 Analysis Steps

### Step 1 — Data Exploration
- Explored gwz_mail table structure
- Identified 136 unique campaigns (journey_id)
- Filtered campaigns with opening_nb >= 10,000 → 42 high-volume campaigns
- Segmented by country: France (nl) vs Belgium (nlbe)

### Step 2 — France Newsletter Analysis
- Filtered 130 France newsletter campaigns
- Ranked by sent_nb, opening_nb, click_nb
- Top campaign: 210706_nl_deuxieme with 170,295 sends and 29,561 opens

### Step 3 — KPI Calculations
- opening_rate: calculated using SAFE_DIVIDE to avoid division by zero
- click_rate: clicks per send
- CTR: clicks per open
- revenue_per_mille: revenue per 1000 sends

### Step 4 — Happyhour Campaign Deep Dive
- Compared two versions: happyhour vs happyhour_12h
- Both showed similar performance (~18-22% opening rate, ~57 RPM)

---

## 📈 Key Findings
- Top performer by volume: 210706_nl_deuxieme (170K sends, 29K opens)
- Top revenue campaign: 210727_nl_djsoldes with €13,577 turnover
- Highest RPM: 210630_nl_happy_hour_18h at 76,403 RPM (small batch, highly targeted)
- High volume ≠ high efficiency: 210805_nl_generale had 77K sends but only 123 RPM
- Belgium segment is significantly smaller (~2,800 max sends vs 170,000 for France)
- Low sample size campaigns skew CTR metrics — statistical significance matters

---

## 🛠️ Tech Stack
- Google BigQuery (SQL)
- Techniques: SAFE_DIVIDE, LIKE filtering, ROUND, ORDER BY, segment analysis

---

## 📁 Repository Structure
- README.md
- queries/
  - 1_data_exploration.sql
  - 2_france_newsletter_analysis.sql
  - 3_kpi_calculations.sql
  - 4_happyhour_campaign_analysis.sql

---


