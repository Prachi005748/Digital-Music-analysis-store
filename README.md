<div align="center">

# 🎵 Digital Music Store Analysis
### *Unleashing Business Insights through SQL*

![SQL](https://img.shields.io/badge/SQL-Database-blue?style=for-the-badge&logo=mysql)
![Status](https://img.shields.io/badge/Status-Complete-success?style=for-the-badge)
![License](https://img.shields.io/badge/License-Educational-orange?style=for-the-badge)

[About](#-about) • [Features](#-key-features) • [Database](#-database-schema) • [Installation](#-installation) • [Insights](#-business-insights) • [Author](#-connect-with-me)

---

</div>

## 🌟 About

Welcome to the **Digital Music Store Analysis** project! This comprehensive SQL-based analysis dives deep into a music store's database to uncover valuable business intelligence. From identifying top-selling artists to understanding customer purchase patterns, this project showcases the power of SQL in transforming raw data into actionable insights.

> **Perfect for:** SQL learners, data analysts, and anyone looking to master database querying with real-world applications!

---

## ✨ Key Features

<table>
<tr>
<td width="50%">

### 📊 Advanced Analytics
- Revenue trend analysis
- Customer segmentation
- Sales performance metrics
- Genre popularity tracking

</td>
<td width="50%">

### 🎯 SQL Mastery
- Complex JOIN operations
- Subqueries & CTEs
- Aggregate functions
- Window functions

</td>
</tr>
</table>

---

## 🗄️ Database Schema

Our digital music store database comprises **8 interconnected tables**:
```
┌─────────────┐     ┌──────────┐     ┌────────┐
│  Employee   │     │ Customer │────▶│ Invoice│
└─────────────┘     └──────────┘     └────┬───┘
                                          │
┌─────────┐     ┌─────────┐     ┌────────▼──────┐
│ Artist  │────▶│  Album  │     │ InvoiceLine   │
└─────────┘     └────┬────┘     └────────┬──────┘
                     │                   │
               ┌─────▼────┐     ┌────────▼──────┐
               │  Track   │◀────│     Genre     │
               └──────────┘     └───────────────┘
```

<details>
<summary><b>📋 Click to view detailed table descriptions</b></summary>

| Table | Description |
|-------|-------------|
| 🧑‍💼 **Employee** | Store staff information and hierarchy |
| 👥 **Customer** | Customer profiles and contact details |
| 🧾 **Invoice** | Purchase transaction records |
| 📝 **InvoiceLine** | Individual line items per transaction |
| 🎵 **Track** | Music track details and pricing |
| 💿 **Album** | Album collections and metadata |
| 🎤 **Artist** | Artist information and profiles |
| 🎸 **Genre** | Music genre classifications |

</details>

---

## 🔍 Business Insights

### What You'll Discover:

<div align="center">

| 🎯 Category | 📈 Insights |
|------------|------------|
| **Customer Analytics** | • Best customers by spending<br>• Purchase frequency patterns<br>• Geographic distribution |
| **Sales Performance** | • Revenue by country<br>• Top-selling tracks & albums<br>• Invoice trends over time |
| **Music Trends** | • Most popular genres<br>• Top-performing artists<br>• Track popularity metrics |
| **Business Intelligence** | • Average order value<br>• Customer lifetime value<br>• Sales seasonality |

</div>

---

## 🚀 Installation

### Prerequisites
- MySQL 8.0+ or PostgreSQL 12+
- SQL client (MySQL Workbench, pgAdmin, DBeaver, etc.)
- Git

### Quick Start
```bash
# 1️⃣ Clone the repository
git clone https://github.com/Prachi005748/Digital-Music-analysis-store.git

# 2️⃣ Navigate to the project directory
cd Digital-Music-analysis-store
```
```sql
-- 3️⃣ Create a new database
CREATE DATABASE music_store_analysis;

-- 4️⃣ Use the database
USE music_store_analysis;

-- 5️⃣ Import and run the SQL file
SOURCE projects.sql;

-- 6️⃣ Start exploring! Try your first query:
SELECT * FROM Artist LIMIT 5;
```

---

## 📂 Project Structure
```
Digital-Music-analysis-store/
│
├── 📄 projects.sql          # Complete SQL schema & analysis queries
├── 📖 README.md             # You are here!
├── 📊 sample_queries/       # Example queries for reference
│   ├── customer_analysis.sql
│   ├── revenue_reports.sql
│   └── trend_analysis.sql
└── 📸 screenshots/          # Visual results (optional)
```

---

## 🎓 Learning Outcomes

By exploring this project, you'll master:

<div align="center">

| 💡 Skills You'll Gain |
|:---|
| ✅ Complex SQL Joins (INNER, LEFT, RIGHT, FULL) |
| ✅ Aggregate Functions (SUM, AVG, COUNT, MIN, MAX) |
| ✅ GROUP BY & HAVING Clauses |
| ✅ Subqueries & Common Table Expressions (CTEs) |
| ✅ Window Functions & Rankings |
| ✅ Data Filtering & Conditional Logic |
| ✅ Real-world Database Design Principles |
| ✅ Business Intelligence Reporting |

</div>

---

## 💡 Sample Queries

<details>
<summary><b>🎤 Find Top 5 Artists by Revenue</b></summary>
```sql
SELECT 
    ar.Name AS Artist,
    SUM(il.UnitPrice * il.Quantity) AS TotalRevenue
FROM Artist ar
JOIN Album al ON ar.ArtistId = al.ArtistId
JOIN Track t ON al.AlbumId = t.AlbumId
JOIN InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY ar.ArtistId, ar.Name
ORDER BY TotalRevenue DESC
LIMIT 5;
```

</details>

<details>
<summary><b>🌍 Revenue by Country</b></summary>
```sql
SELECT 
    BillingCountry,
    COUNT(InvoiceId) AS TotalInvoices,
    ROUND(SUM(Total), 2) AS TotalRevenue
FROM Invoice
GROUP BY BillingCountry
ORDER BY TotalRevenue DESC;
```

</details>

---

## 🛠️ Tech Stack

<div align="center">

![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)

</div>

---

## 🤝 Contributing

Contributions are welcome! Feel free to:

- 🐛 Report bugs
- 💡 Suggest new analysis queries
- 📝 Improve documentation
- ⭐ Star this repository if you find it helpful!

---

## 📜 License

This project is created for **educational purposes only**.  
Feel free to use it for learning and reference.

---

## 👩‍💻 Connect With Me

<div align="center">

**Prachi Paliwal**

[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Prachi005748)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/prachi-paliwal-799126268/)
[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:prachipaliwal745@gmail.com)

### ⭐ If you found this project helpful, consider giving it a star!

</div>

---

<div align="center">

**Made with ❤️ and SQL**

*Last Updated: December 2025*

</div>
