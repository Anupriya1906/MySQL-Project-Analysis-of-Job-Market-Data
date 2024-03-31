# MySQL Project: Analysis of Job Market Data

## Overview
This project involves the analysis of job market data using MySQL. The dataset contains information about various job listings, including job titles, salaries, company details, and more. The primary objective is to perform exploratory data analysis (EDA) and answer specific questions about the job market using SQL queries.

## Contents
### Data Insertion
### Exploratory Data Analysis (EDA)
### SQL Queries and Analysis
     1. Average Salary for All Jobs
     2. Highest Salary and Corresponding Job Role
     3. Average Salary for Data Scientists in the US
     4. Number of Jobs Available for Each Job Title
     5. Total Salary Paid for Data Analyst Jobs in DE
     6. Top 5 Highest Paying Job Titles
     7. Number of Jobs Available in Each Location
     8. Top 3 Job Titles with the Most Jobs Available
     9. Average Salary for Data Engineers in the US
     10. Top 5 Cities with the Highest Average Salaries
     11. Average Salary and Total Jobs for Each Job Title
     12. Top 5 Job Titles with the Highest Total Salaries
     13. Top 5 Locations with the Highest Total Salaries
     14. Average Salary for Each Job Title in Each Location
     15. Average Salary and Percentage of Jobs for Each Job Title in Each Location
     16. Top 5 Job Titles with the Highest Average Salaries
     17. Average Salary and Percentage of Jobs for Each Job Title in the Dataset
     18. Total Number of Jobs Available for Each Year of Experience
     19. Average Salary for Each Experience Level
     20. Top 5 Job Titles with the Highest Salaries and Corresponding Companies
     21. Distinct Job Titles and Corresponding Companies with the Highest Salaries

## Data Insertion
- Created a MySQL database named `company`.
- Defined two tables:
  - `jobs`: Contains details about job listings, such as job title, salary, location, etc.
  - `companies`: Stores information about companies, including company ID and name.
- Imported data into the created tables.

## Exploratory Data Analysis (EDA)
- Conducted exploratory data analysis to understand the structure and characteristics of the dataset.
- Explored key statistics, distributions, and relationships between variables to gain insights into the job market trends.

## SQL Queries and Analysis
Performed various SQL queries to analyze the job market data and answer specific questions:
     1. Average Salary for All Jobs
     2. Highest Salary and Corresponding Job Role
     3. Average Salary for Data Scientists in the US
     4. Number of Jobs Available for Each Job Title
     5. Total Salary Paid for Data Analyst Jobs in DE
     6. Top 5 Highest Paying Job Titles
     7. Number of Jobs Available in Each Location
     8. Top 3 Job Titles with the Most Jobs Available
     9. Average Salary for Data Engineers in the US
     10. Top 5 Cities with the Highest Average Salaries
     11. Average Salary and Total Jobs for Each Job Title
     12. Top 5 Job Titles with the Highest Total Salaries
     13. Top 5 Locations with the Highest Total Salaries
     14. Average Salary for Each Job Title in Each Location
     15. Average Salary and Percentage of Jobs for Each Job Title in Each Location
     16. Top 5 Job Titles with the Highest Average Salaries
     17. Average Salary and Percentage of Jobs for Each Job Title in the Dataset
     18. Total Number of Jobs Available for Each Year of Experience
     19. Average Salary for Each Experience Level
     20. Top 5 Job Titles with the Highest Salaries and Corresponding Companies
     21. Distinct Job Titles and Corresponding Companies with the Highest Salaries

### 1. Average Salary for All Jobs
```sql
SELECT AVG(salary) AS Avg_salary FROM jobs;
```

## Conclusion
This MySQL project provides valuable insights into the job market data, including salary trends, job availability, and geographical distribution. The SQL queries and analysis performed shed light on various aspects of the job market, enabling informed decision-making for job seekers, employers, and policymakers.

Feel free to customize and expand this README file as needed to provide more context or additional information about your project. Good luck with uploading your project to GitHub!
