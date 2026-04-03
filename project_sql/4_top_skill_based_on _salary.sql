/*
What are the top skills based on salary?
Answer Strategy:
- look at the average salary associated with each skill for Data Analyst positions.
-  Focus on roles with specified salaries, regardless of location.
-  Why? It reveals how different skills impact salary levels for Data Analysts and helps identify the most financially rewarding skills to acquire or improve.

*/
SELECT 
skills_dim.skills,
ROUND(AVG(salary_year_avg), 2) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
--job_work_from_home= True
GROUP BY skills
ORDER BY average_salary DESC
LIMIT 25;

/*
Hybrid roles dominate high salaries → Top-paying data analyst jobs now combine data analysis + data engineering + AI/ML + cloud, not just dashboards and SQL.
Specialized & technical skills drive pay → Skills like AI/ML (PyTorch, TensorFlow), data pipelines (Airflow, Kafka), and cloud/DevOps tools significantly increase salary compared to basic tools.
General skills are saturated → Most salaries cluster in a narrow range, so to earn more you need niche expertise or multi-skill combinations, not just traditional analyst tools.
*/