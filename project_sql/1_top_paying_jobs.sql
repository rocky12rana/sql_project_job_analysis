/* what are the top paying data analytics jobs? 
-Identify the top 10 highest paying data analyst  roles that are available remotely
-Focus on job postings with specified salaries ,remove any null values
 -Why?Highlighting the top paying oppertunities in the data analytics field can help job seekers make informed decisions about their career paths and identify lucrative opportunities. By focusing on remote positions, we can also cater to a broader audience who may be seeking flexible work arrangements.
 */
    SELECT job_id,
        job_title,
        salary_year_avg,
        company_dim.name AS company_name
        
    FROM 
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id   
    WHERE  job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
