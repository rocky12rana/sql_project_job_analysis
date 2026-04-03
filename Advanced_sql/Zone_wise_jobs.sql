SELECT
    COUNT(job_id)AS total_jobs,
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'AMERICA/NEW_YORK' ) AS month,
    EXTRACT(YEAR FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'AMERICA/NEW_YORK' ) AS year
    FROM job_postings_fact
    WHERE EXTRACT(YEAR FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'AMERICA/NEW_YORK' ) = 2023
    GROUP BY month,job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'AMERICA/NEW_YORK' 
    ORDER BY month;