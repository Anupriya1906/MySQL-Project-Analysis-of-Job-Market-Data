-- DATA INSERTION 
CREATE DATABASE company;

USE company;

CREATE TABLE jobs(
  id INTEGER
  ,work_year INTEGER
  ,experience_level VARCHAR(20)
  ,employment_type VARCHAR(20)
  ,job_title VARCHAR(255)
  ,salary INTEGER
  ,salary_currency VARCHAR(20)
  ,salary_in_usd INTEGER
  ,employee_residence VARCHAR(20)
  ,remote_ratio INTEGER
  ,company_location VARCHAR(20)
  ,company_size VARCHAR(20)
);
CREATE TABLE companies(
id INT,
company_name VARCHAR(20));
-- Import data to the created tables

-- EDA

-- 1.	What is the average salary for all the jobs in the dataset?

SELECT 
	AVG(salary) AS Avg_salary
FROM jobs;

-- 2.	What is the highest salary in the dataset and which job role does it correspond to?

SELECT
	job_title,
    MAX(salary) AS Highest_sal
FROM jobs
GROUP BY job_title
ORDER BY Highest_sal DESC
LIMIT 1;

-- 3.	What is the average salary for data scientists in US?

SELECT
	AVG(salary) AS Avg_salary
FROM jobs
WHERE job_title = 'Data Scientist' AND company_location = 'US';

-- 4.	What is the number of jobs available for each job title?

SELECT 
	job_title,
    COUNT(*) AS No_of_jobs
FROM jobs
GROUP BY job_title
ORDER BY No_of_jobs DESC;

-- 5.	What is the total salary paid for all data analyst jobs in DE?

SELECT
    SUM(salary) AS Total_sal
FROM jobs
WHERE job_title = 'Data Analyst' AND company_location = 'DE';

-- 6.	What are the top 5 highest paying job titles and their corresponding average salaries?

SELECT
	job_title,
    ROUND(AVG(salary)) AS Avg_sal
FROM jobs
GROUP BY job_title
ORDER BY Avg_sal DESC
LIMIT 5;

-- 7.	What is the number of jobs available in each location?

SELECT
	company_location,
    COUNT(*) AS Total_jobs
FROM jobs
GROUP BY company_location
ORDER BY Total_jobs DESC;

-- 8.	What are the top 3 job titles that have the most jobs available in the dataset?

SELECT 
	job_title,
    COUNT(*) AS No_of_jobs
FROM jobs
GROUP BY job_title
ORDER BY No_of_jobs DESC
LIMIT 3;

-- 9.	What is the average salary for data engineers in US?

SELECT
	AVG(salary) AS Avg_sal
FROM jobs
WHERE job_title = "Data Engineer" AND company_location = 'US';

-- 10.	What are the top 5 cities with the highest average salaries?

SELECT
	company_location,
    ROUND(AVG(salary)) AS Avg_sal
FROM jobs
GROUP BY company_location
ORDER BY Avg_sal DESC
LIMIT 5;

-- 11.	What is the average salary for each job title, and what is the total number of jobs available for each job title?

SELECT 
	job_title,
    ROUND(AVG(salary)) AS Avg_sal,
    COUNT(*) AS No_of_jobs
FROM jobs
GROUP BY job_title
ORDER BY No_of_jobs DESC;

-- 12.	What are the top 5 job titles with the highest total salaries, and what is the total number of jobs available for each job title?

SELECT 
	job_title,
    SUM(salary) AS Total_sal,
    COUNT(*) AS No_of_jobs
FROM jobs
GROUP BY job_title
ORDER BY Total_sal DESC
LIMIT 5;

-- 13.	What are the top 5 locations with the highest total salaries, and what is the total number of jobs available for each location?

SELECT 
	company_location,
    SUM(salary) AS Total_sal,
    COUNT(*) AS No_of_jobs
FROM jobs
GROUP BY company_location
ORDER BY Total_sal DESC
LIMIT 5;

-- 14.	What is the average salary for each job title in each location, and what is the total number of jobs available for each job title in each location?

SELECT 
	company_location,
    job_title,
    ROUND(AVG(salary)) AS Avg_sal,
    COUNT(*) AS No_of_jobs
FROM jobs
GROUP BY company_location, job_title
ORDER BY No_of_jobs DESC;

-- 15.	What is the average salary for each job title in each location, and what is the percentage of jobs for each job title in each location?

SELECT 
	company_location,
    job_title,
    ROUND(AVG(salary)) AS Avg_sal,
    COUNT(*)/(SELECT COUNT(*) FROM jobs )*100 AS Percentage_of_jobs
FROM jobs
GROUP BY company_location, job_title
ORDER BY Percentage_of_jobs DESC;

-- 16.	What are the top 5 job titles with the highest average salaries, and what is the total number of jobs available for each job title?

SELECT 
	job_title,
    ROUND(AVG(salary)) AS Avg_sal,
    COUNT(*) AS No_of_jobs
FROM jobs
GROUP BY job_title
ORDER BY Avg_sal DESC
LIMIT 5;

-- 17.	What is the average salary for each job title, and what is the percentage of jobs for each job title in the dataset?

SELECT 
	job_title,
    ROUND(AVG(salary)) AS Avg_sal,
    COUNT(*)/(SELECT COUNT(*) FROM jobs)*100 AS Percentage_of_jobs
FROM jobs
GROUP BY job_title;

-- 18.	What is the total number of jobs available for each year of experience, and what is the average salary for each year of experience?

SELECT 
	experience_level,
    COUNT(*) AS Total_jobs,
    AVG(salary) AS Avg_sal
FROM jobs
GROUP BY experience_level;

-- 19.	What is the average salary for each experience level, and what is the total number of jobs available for each degree level?

SELECT 
	experience_level,
    AVG(salary) AS Avg_sal,
    COUNT(*) AS Total_jobs
FROM jobs
GROUP BY experience_level;

-- 20.	What are the top 5 job titles with the highest salaries, and what is the name of the company that offers the highest salary for each job title?

SELECT
    j.job_title,
    c.company_name,
    MAX(j.salary) AS Highest_salary
FROM jobs j
INNER JOIN companies c ON j.id = c.id
GROUP BY j.job_title, c.company_name
ORDER BY Highest_salary DESC
LIMIT 5;

-- 21.	What are the distinct job titles and the corresponding companies where each job title has the highest salary?

WITH ranked_data AS (
    SELECT 
        j.job_title,
        c.company_name AS Company_with_highest_salary,
        j.salary,
        ROW_NUMBER() OVER (PARTITION BY j.job_title ORDER BY j.salary DESC) AS salary_rank
    FROM jobs j
    INNER JOIN companies c ON j.id = c.id
)
SELECT DISTINCT
    job_title,
    Company_with_highest_salary,
    salary
FROM ranked_data
WHERE salary_rank = 1;