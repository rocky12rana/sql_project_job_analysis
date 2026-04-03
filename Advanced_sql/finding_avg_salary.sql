SELECT
    
    EXTRACT(MONTH FROM job_posted_date) AS month,
    AVG(salary_year_avg) AS avg_salary,
    AVG(salary_hour_avg) AS avg_hourly_salary,
    job_schedule_type
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) > 6
GROUP BY  MONTH,job_schedule_type
LIMIT 10;