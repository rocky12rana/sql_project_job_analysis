SELECT
    job_title,
    CASE
        WHEN salary_year_avg > 50000 THEN 'High'
        WHEN salary_year_avg BETWEEN 30000 AND 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM job_postings_fact
WHERE job_title_short LIKE '%Data Analyst%'
ORDER BY salary_category DESC;