WITH company_jobs AS(
    SELECT
    company_id,
    COUNT(*) AS total_jobs
    FROM
    job_postings_fact
    GROUP BY company_id

)
SELECT
company_dim.name AS company_name,
company_jobs.total_jobs
FROM company_dim
LEFT JOIN company_jobs
 ON company_dim.company_id=company_jobs.company_id
 ORDER BY total_jobs DESC
/* In this SQL query, we are using a Common Table Expression (CTE) named "company_jobs" */