SELECT
    company_id,
CASE
    WHEN job_counts < 10 THEN 'Small'
    WHEN job_counts BETWEEN 10 AND 50 THEN 'Medium'
    ELSE 'Large'
END AS company_size
FROM
    (SELECT
        company_id,
        COUNT(*) AS job_counts  
    FROM
        job_postings_fact
    GROUP BY
        company_id) AS job_counts  
        
        ;