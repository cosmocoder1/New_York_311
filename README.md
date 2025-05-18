# 📊 New York 311: Data Analytics Case Study

This case study explores the **New York 311 Call Dataset** (available via GCP BigQuery), which logs complaint types and timestamps of public service calls from 2010 to the present. The goal was to identify seasonal trends and consider how cities might use such insights to optimize services and reduce waste.

---

## ❓ Key Questions

- Do 311 call types exhibit seasonal trends?
- How could these trends inform smarter city planning?
- What timeline is required to establish reliable predictability?
- Could budget allocation for city services be optimized using seasonal insights?

---

## 🔧 Data Processing

The dataset was impressively clean. After verifying data types and checking for nulls via SQL (none found), analysis moved into **RStudio** for time-based aggregation.

A method was developed to calculate the **daily mode** of 311 complaint types (from hourly data). This was narrowed to a one-year slice — **May 2020 to April 2021** — and grouped by month for trend observation.

---

## 📈 Visualization

Data was visualized in **Google Sheets**, using pie charts and stacked bar charts. Ultimately, **stacked bar charts** provided the clearest representation of monthly complaint variation.

Color schemes were carefully selected for visual clarity and accessibility.

---

## ⚠️ Limitations

- The analysis spans only **one year**, during the height of the **COVID-19 pandemic**, which may skew representativeness.
- Despite this, trends emerged:
  - **Heat/hot water complaints** rise in winter
  - **Residential noise** peaks in fall
  - **Illegal parking** spikes in spring

---

## 🔁 Next Steps

- Extend the analysis across the **full 11-year dataset**
- Use trend modeling to evaluate **seasonal behavioral shifts**
- Explore the impact of large-scale events (e.g., the pandemic) on urban infrastructure demand
- Apply insights to improve **city service budgeting and resource allocation**

   
   


   
   
  
