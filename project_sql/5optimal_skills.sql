/*- What are the optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles.
- Concentrate on remote positions with specified salaries.
- Target skills that offer job security (high demand) and financial benefits (high salaries).
- Provide strategic insights for career development.*/
SELECT
skills_dim.skill_id,
skills_dim.skills,
COUNT(skills_job_dim.job_id) AS demanded_skills_for_jobs,
ROUND(AVG(salary_year_avg), 2) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND job_work_from_home= True AND salary_year_avg IS NOT NULL
GROUP BY skills_dim.skill_id, skills_dim.skills
HAVING COUNT(skills_job_dim.job_id) > 10
ORDER BY 
  average_salary DESC,
  demanded_skills_for_jobs DESC

LIMIT 25;



















/*WITH demanded_skills AS (
  SELECT
  skills_dim.skill_id, 
  skills_dim.skills,
  COUNT(skills_job_dim.job_id) AS demanded_skills_for_jobs
  FROM job_postings_fact
  INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
  INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
  WHERE job_title_short = 'Data Analyst' AND
   job_work_from_home= True AND 
   salary_year_avg IS NOT NULL
  GROUP BY skills_dim.skill_id
)

 ,salary_average AS (
  SELECT
  skills_dim.skill_id,
  ROUND(AVG(salary_year_avg), 2) AS average_salary
  FROM job_postings_fact
  INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
  INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
  WHERE job_title_short = 'Data Analyst' AND
   job_work_from_home= True AND 
   salary_year_avg IS NOT NULL
  GROUP BY skills_dim.skill_id
)
SELECT
demanded_skills.skill_id,
demanded_skills.skills,
demanded_skills.demanded_skills_for_jobs,
salary_average.average_salary
FROM demanded_skills
INNER JOIN salary_average ON demanded_skills.skill_id = salary_average.skill_id
WHERE demanded_skills.demanded_skills_for_jobs > 10
ORDER BY salary_average.average_salary DESC*/







/*


This report analyzes job posting data based on skills, their demand (number of job postings), and corresponding average salaries. The goal is to identify key market trends, high-demand skills, high-paying technologies, and strategic career insights.

---

## **2. Most In-Demand Skills**

The dataset shows that the following skills dominate job postings:

* SQL (398 job postings)
* Excel (256 job postings)
* Python (236 job postings)
* Tableau (230 job postings)
* Power BI (110 job postings)

### **Insight:**

* These skills form the **foundation of data-related roles**.
* They are essential for **entry-level and mid-level positions**.
* High demand indicates strong industry reliance on **data analysis and reporting tools**.

---

## **3. High-Paying Skills (Low Demand but High Salary)**

Several skills offer very high salaries but appear in fewer job postings:

* PySpark (~208K average salary, very low demand)
* Bitbucket (~189K, low demand)
* Couchbase / Watson (~160K, minimal demand)
* Swift (~153K)
* Jupyter (~152K)

### **Insight:**

* These are **niche or specialized skills**.
* High salaries are driven by:

  * Limited talent availability
  * Specialized use cases
* These are not ideal for beginners but valuable for **career advancement**.

---

## **4. Balanced Skills (High Demand + Good Salary)**

Some skills provide a strong balance between demand and salary:

* Python (~101K, high demand)
* SQL (~97K, very high demand)
* R (~100K, moderate demand)
* AWS (~108K, moderate demand)
* Azure (~111K, moderate demand)
* Snowflake (~112K, moderate demand)

### **Insight:**

* These are **high ROI (Return on Investment) skills**.
* They provide both **job security and salary growth**.
* Combining programming with cloud technologies significantly improves career prospects.

---

## **5. Growth of Cloud and Data Engineering Technologies**

Emerging tools in cloud and big data show strong salary trends:

* Databricks (~141K)
* BigQuery (~109K)
* Snowflake (~112K)
* Hadoop (~113K)
* Airflow (~126K)

### **Insight:**

* There is a clear shift from **data analysis to data engineering**.
* Organizations are investing in:

  * Data pipelines
  * Cloud infrastructure
* These skills represent the **future of data careers**.

---

## **6. Business Intelligence (BI) Tools Trend**

Popular BI tools include:

* Tableau (~99K)
* Power BI (~97K)
* Looker (~103K)

### **Insight:**

* BI tools have **high demand but moderate salaries**.
* They are widely used across industries for **dashboarding and reporting**.
* Alone, they are not sufficient for high salary growth but are essential for employability.

---

## **7. Programming Language Trends**

### **High-Value Languages:**

* Scala (~124K)
* Go (~115K)
* Java (~106K)

### **Core Data Languages:**

* Python
* R

### **Lower-Value / Declining Languages:**

* PHP
* Ruby
* Visual Basic
* VBA

### **Insight:**

* Modern and scalable languages are more valuable.
* Legacy technologies are either declining or limited in growth.

---

## **8. Visualization Libraries (Low Impact on Salary)**

* Matplotlib (~76K)
* Seaborn (~77K)
* Plotly (~78K)

### **Insight:**

* These are **supporting tools**, not primary skills.
* They enhance analysis but do not significantly increase salary on their own.

---

## **9. DevOps and Collaboration Tools (Emerging Value)**

* Kubernetes (~132K)
* Jenkins (~125K)
* GitLab (~154K)
* Atlassian (~131K)

### **Insight:**

* Data roles are increasingly integrating with **DevOps practices**.
* Knowledge of deployment and collaboration tools can significantly boost salary.

---

## **10. Low Demand Skills**

Skills with very few job postings include:

* CSS
* Rust
* Erlang
* Pascal
* Ruby on Rails

### **Insight:**

* These skills are either:

  * Highly niche
  * Less relevant in data-focused roles
* They should not be prioritized for general data career paths.

---

## **11. Tools vs Technology Gap**

* Tools (Excel, Tableau): High demand, lower salary
* Technologies (Cloud, Big Data): Lower demand, higher salary

### **Insight:**

* The market rewards:

  * **Basic tools → employability**
  * **Advanced technologies → higher earnings**

---

## **12. Overall Market Trend**

* Strong demand for **data analysis skills**
* Increasing importance of **cloud and big data technologies**
* Clear distinction between **entry-level and high-paying skill sets**
* Gradual shift toward **data engineering and infrastructure roles**

---

## **13. Recommended Career Path**

Based on the dataset:

### **Step 1: Foundation Skills**

* SQL
* Excel
* Python

### **Step 2: Visualization Skills**

* Tableau or Power BI

### **Step 3: Advanced Skills**

* Cloud platforms (AWS / Azure)
* Data warehousing (Snowflake, BigQuery)

### **Step 4: Specialization**

* Big Data (Spark, Hadoop, Airflow)
* DevOps tools (Kubernetes, CI/CD)

---

## **14. Conclusion**

The dataset clearly indicates that while foundational data skills are critical for entering the job market, higher salaries are associated with specialization in cloud, big data, and engineering tools. A strategic combination of both foundational and advanced skills is essential for long-term career growth.

---
*/
/*
[
  {
    "skill_id": 0,
    "skills": "sql",
    "demanded_skills_for_jobs": "398",
    "average_salary": "97237.16"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demanded_skills_for_jobs": "236",
    "average_salary": "101397.22"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demanded_skills_for_jobs": "13",
    "average_salary": "101413.73"
  },
  {
    "skill_id": 3,
    "skills": "scala",
    "demanded_skills_for_jobs": "5",
    "average_salary": "124903.00"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demanded_skills_for_jobs": "17",
    "average_salary": "106906.44"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demanded_skills_for_jobs": "148",
    "average_salary": "100498.77"
  },
  {
    "skill_id": 6,
    "skills": "shell",
    "demanded_skills_for_jobs": "3",
    "average_salary": "108200.00"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demanded_skills_for_jobs": "63",
    "average_salary": "98902.37"
  },
  {
    "skill_id": 8,
    "skills": "go",
    "demanded_skills_for_jobs": "27",
    "average_salary": "115319.89"
  },
  {
    "skill_id": 9,
    "skills": "javascript",
    "demanded_skills_for_jobs": "20",
    "average_salary": "97587.00"
  },
  {
    "skill_id": 10,
    "skills": "html",
    "demanded_skills_for_jobs": "8",
    "average_salary": "86437.50"
  },
  {
    "skill_id": 11,
    "skills": "css",
    "demanded_skills_for_jobs": "1",
    "average_salary": "52500.00"
  },
  {
    "skill_id": 12,
    "skills": "bash",
    "demanded_skills_for_jobs": "6",
    "average_salary": "96558.33"
  },
  {
    "skill_id": 13,
    "skills": "c++",
    "demanded_skills_for_jobs": "11",
    "average_salary": "98958.23"
  },
  {
    "skill_id": 14,
    "skills": "c#",
    "demanded_skills_for_jobs": "10",
    "average_salary": "86540.05"
  },
  {
    "skill_id": 15,
    "skills": "matlab",
    "demanded_skills_for_jobs": "5",
    "average_salary": "94200.00"
  },
  {
    "skill_id": 16,
    "skills": "t-sql",
    "demanded_skills_for_jobs": "9",
    "average_salary": "96365.00"
  },
  {
    "skill_id": 18,
    "skills": "mongodb",
    "demanded_skills_for_jobs": "3",
    "average_salary": "66019.67"
  },
  {
    "skill_id": 20,
    "skills": "powershell",
    "demanded_skills_for_jobs": "4",
    "average_salary": "95275.00"
  },
  {
    "skill_id": 21,
    "skills": "visual basic",
    "demanded_skills_for_jobs": "2",
    "average_salary": "62500.00"
  },
  {
    "skill_id": 22,
    "skills": "vba",
    "demanded_skills_for_jobs": "24",
    "average_salary": "88783.29"
  },
  {
    "skill_id": 23,
    "skills": "crystal",
    "demanded_skills_for_jobs": "5",
    "average_salary": "120100.00"
  },
  {
    "skill_id": 25,
    "skills": "php",
    "demanded_skills_for_jobs": "1",
    "average_salary": "95000.00"
  },
  {
    "skill_id": 26,
    "skills": "c",
    "demanded_skills_for_jobs": "9",
    "average_salary": "98937.72"
  },
  {
    "skill_id": 27,
    "skills": "golang",
    "demanded_skills_for_jobs": "1",
    "average_salary": "145000.00"
  },
  {
    "skill_id": 29,
    "skills": "julia",
    "demanded_skills_for_jobs": "2",
    "average_salary": "71148.00"
  },
  {
    "skill_id": 30,
    "skills": "ruby",
    "demanded_skills_for_jobs": "2",
    "average_salary": "61779.50"
  },
  {
    "skill_id": 35,
    "skills": "swift",
    "demanded_skills_for_jobs": "2",
    "average_salary": "153750.00"
  },
  {
    "skill_id": 39,
    "skills": "rust",
    "demanded_skills_for_jobs": "1",
    "average_salary": "97500.00"
  },
  {
    "skill_id": 42,
    "skills": "vb.net",
    "demanded_skills_for_jobs": "1",
    "average_salary": "90000.00"
  },
  {
    "skill_id": 45,
    "skills": "pascal",
    "demanded_skills_for_jobs": "1",
    "average_salary": "92000.00"
  },
  {
    "skill_id": 47,
    "skills": "sass",
    "demanded_skills_for_jobs": "1",
    "average_salary": "67500.00"
  },
  {
    "skill_id": 51,
    "skills": "erlang",
    "demanded_skills_for_jobs": "1",
    "average_salary": "72500.00"
  },
  {
    "skill_id": 56,
    "skills": "mysql",
    "demanded_skills_for_jobs": "9",
    "average_salary": "95223.89"
  },
  {
    "skill_id": 57,
    "skills": "postgresql",
    "demanded_skills_for_jobs": "4",
    "average_salary": "123878.75"
  },
  {
    "skill_id": 59,
    "skills": "elasticsearch",
    "demanded_skills_for_jobs": "1",
    "average_salary": "145000.00"
  },
  {
    "skill_id": 60,
    "skills": "mariadb",
    "demanded_skills_for_jobs": "1",
    "average_salary": "95000.00"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demanded_skills_for_jobs": "35",
    "average_salary": "97785.73"
  },
  {
    "skill_id": 62,
    "skills": "mongodb",
    "demanded_skills_for_jobs": "3",
    "average_salary": "66019.67"
  },
  {
    "skill_id": 65,
    "skills": "couchbase",
    "demanded_skills_for_jobs": "1",
    "average_salary": "160515.00"
  },
  {
    "skill_id": 67,
    "skills": "db2",
    "demanded_skills_for_jobs": "4",
    "average_salary": "114072.13"
  },
  {
    "skill_id": 70,
    "skills": "sqlite",
    "demanded_skills_for_jobs": "3",
    "average_salary": "89166.67"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demanded_skills_for_jobs": "34",
    "average_salary": "111225.10"
  },
  {
    "skill_id": 75,
    "skills": "databricks",
    "demanded_skills_for_jobs": "10",
    "average_salary": "141906.60"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demanded_skills_for_jobs": "32",
    "average_salary": "108317.30"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "demanded_skills_for_jobs": "13",
    "average_salary": "109653.85"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demanded_skills_for_jobs": "16",
    "average_salary": "99936.44"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demanded_skills_for_jobs": "37",
    "average_salary": "104533.70"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demanded_skills_for_jobs": "37",
    "average_salary": "112947.97"
  },
  {
    "skill_id": 81,
    "skills": "gcp",
    "demanded_skills_for_jobs": "3",
    "average_salary": "122500.00"
  },
  {
    "skill_id": 84,
    "skills": "ibm cloud",
    "demanded_skills_for_jobs": "1",
    "average_salary": "111500.00"
  },
  {
    "skill_id": 85,
    "skills": "watson",
    "demanded_skills_for_jobs": "1",
    "average_salary": "160515.00"
  },
  {
    "skill_id": 88,
    "skills": "colocation",
    "demanded_skills_for_jobs": "1",
    "average_salary": "67500.00"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demanded_skills_for_jobs": "13",
    "average_salary": "99076.92"
  },
  {
    "skill_id": 93,
    "skills": "pandas",
    "demanded_skills_for_jobs": "9",
    "average_salary": "151821.33"
  },
  {
    "skill_id": 94,
    "skills": "numpy",
    "demanded_skills_for_jobs": "5",
    "average_salary": "143512.50"
  },
  {
    "skill_id": 95,
    "skills": "pyspark",
    "demanded_skills_for_jobs": "2",
    "average_salary": "208172.25"
  },
  {
    "skill_id": 96,
    "skills": "airflow",
    "demanded_skills_for_jobs": "5",
    "average_salary": "126103.00"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demanded_skills_for_jobs": "22",
    "average_salary": "113192.57"
  },
  {
    "skill_id": 102,
    "skills": "jupyter",
    "demanded_skills_for_jobs": "3",
    "average_salary": "152776.50"
  },
  {
    "skill_id": 104,
    "skills": "spring",
    "demanded_skills_for_jobs": "2",
    "average_salary": "82000.00"
  },
  {
    "skill_id": 106,
    "skills": "scikit-learn",
    "demanded_skills_for_jobs": "2",
    "average_salary": "125781.25"
  },
  {
    "skill_id": 108,
    "skills": "matplotlib",
    "demanded_skills_for_jobs": "5",
    "average_salary": "76301.40"
  },
  {
    "skill_id": 112,
    "skills": "plotly",
    "demanded_skills_for_jobs": "4",
    "average_salary": "78750.00"
  },
  {
    "skill_id": 115,
    "skills": "ggplot2",
    "demanded_skills_for_jobs": "1",
    "average_salary": "75000.00"
  },
  {
    "skill_id": 120,
    "skills": "seaborn",
    "demanded_skills_for_jobs": "3",
    "average_salary": "77500.00"
  },
  {
    "skill_id": 137,
    "skills": "phoenix",
    "demanded_skills_for_jobs": "4",
    "average_salary": "97230.00"
  },
  {
    "skill_id": 141,
    "skills": "express",
    "demanded_skills_for_jobs": "4",
    "average_salary": "80000.00"
  },
  {
    "skill_id": 144,
    "skills": "ruby",
    "demanded_skills_for_jobs": "2",
    "average_salary": "61779.50"
  },
  {
    "skill_id": 145,
    "skills": "node.js",
    "demanded_skills_for_jobs": "1",
    "average_salary": "83500.00"
  },
  {
    "skill_id": 153,
    "skills": "ruby on rails",
    "demanded_skills_for_jobs": "1",
    "average_salary": "51059.00"
  },
  {
    "skill_id": 168,
    "skills": "unix",
    "demanded_skills_for_jobs": "3",
    "average_salary": "107666.67"
  },
  {
    "skill_id": 169,
    "skills": "linux",
    "demanded_skills_for_jobs": "2",
    "average_salary": "136507.50"
  },
  {
    "skill_id": 170,
    "skills": "windows",
    "demanded_skills_for_jobs": "6",
    "average_salary": "74124.48"
  },
  {
    "skill_id": 177,
    "skills": "arch",
    "demanded_skills_for_jobs": "2",
    "average_salary": "82750.00"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demanded_skills_for_jobs": "256",
    "average_salary": "87288.21"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demanded_skills_for_jobs": "230",
    "average_salary": "99287.65"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demanded_skills_for_jobs": "110",
    "average_salary": "97431.30"
  },
  {
    "skill_id": 184,
    "skills": "dax",
    "demanded_skills_for_jobs": "10",
    "average_salary": "104500.00"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demanded_skills_for_jobs": "49",
    "average_salary": "103795.30"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demanded_skills_for_jobs": "63",
    "average_salary": "98902.37"
  },
  {
    "skill_id": 187,
    "skills": "qlik",
    "demanded_skills_for_jobs": "13",
    "average_salary": "99630.81"
  },
  {
    "skill_id": 188,
    "skills": "word",
    "demanded_skills_for_jobs": "48",
    "average_salary": "82576.04"
  },
  {
    "skill_id": 189,
    "skills": "sap",
    "demanded_skills_for_jobs": "8",
    "average_salary": "102919.88"
  },
  {
    "skill_id": 190,
    "skills": "spreadsheet",
    "demanded_skills_for_jobs": "6",
    "average_salary": "81892.23"
  },
  {
    "skill_id": 191,
    "skills": "microstrategy",
    "demanded_skills_for_jobs": "2",
    "average_salary": "121619.25"
  },
  {
    "skill_id": 192,
    "skills": "sheets",
    "demanded_skills_for_jobs": "32",
    "average_salary": "86087.79"
  },
  {
    "skill_id": 194,
    "skills": "ssis",
    "demanded_skills_for_jobs": "12",
    "average_salary": "106683.33"
  },
  {
    "skill_id": 195,
    "skills": "sharepoint",
    "demanded_skills_for_jobs": "18",
    "average_salary": "81633.58"
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "demanded_skills_for_jobs": "58",
    "average_salary": "88701.09"
  },
  {
    "skill_id": 197,
    "skills": "ssrs",
    "demanded_skills_for_jobs": "14",
    "average_salary": "99171.43"
  },
  {
    "skill_id": 198,
    "skills": "outlook",
    "demanded_skills_for_jobs": "13",
    "average_salary": "90077.42"
  },
  {
    "skill_id": 199,
    "skills": "spss",
    "demanded_skills_for_jobs": "24",
    "average_salary": "92169.68"
  },
  {
    "skill_id": 200,
    "skills": "cognos",
    "demanded_skills_for_jobs": "4",
    "average_salary": "93263.75"
  },
  {
    "skill_id": 201,
    "skills": "alteryx",
    "demanded_skills_for_jobs": "17",
    "average_salary": "94144.53"
  },
  {
    "skill_id": 202,
    "skills": "ms access",
    "demanded_skills_for_jobs": "6",
    "average_salary": "85518.83"
  },
  {
    "skill_id": 204,
    "skills": "visio",
    "demanded_skills_for_jobs": "10",
    "average_salary": "95841.55"
  },
  {
    "skill_id": 206,
    "skills": "datarobot",
    "demanded_skills_for_jobs": "1",
    "average_salary": "155485.50"
  },
  {
    "skill_id": 210,
    "skills": "git",
    "demanded_skills_for_jobs": "5",
    "average_salary": "112000.00"
  },
  {
    "skill_id": 211,
    "skills": "jenkins",
    "demanded_skills_for_jobs": "3",
    "average_salary": "125436.33"
  },
  {
    "skill_id": 213,
    "skills": "kubernetes",
    "demanded_skills_for_jobs": "2",
    "average_salary": "132500.00"
  },
  {
    "skill_id": 215,
    "skills": "flow",
    "demanded_skills_for_jobs": "28",
    "average_salary": "97200.00"
  },
  {
    "skill_id": 216,
    "skills": "github",
    "demanded_skills_for_jobs": "5",
    "average_salary": "91580.00"
  },
  {
    "skill_id": 218,
    "skills": "bitbucket",
    "demanded_skills_for_jobs": "2",
    "average_salary": "189154.50"
  },
  {
    "skill_id": 219,
    "skills": "atlassian",
    "demanded_skills_for_jobs": "5",
    "average_salary": "131161.80"
  },
  {
    "skill_id": 220,
    "skills": "gitlab",
    "demanded_skills_for_jobs": "3",
    "average_salary": "154500.00"
  },
  {
    "skill_id": 221,
    "skills": "chef",
    "demanded_skills_for_jobs": "1",
    "average_salary": "85000.00"
  },
  {
    "skill_id": 225,
    "skills": "unity",
    "demanded_skills_for_jobs": "1",
    "average_salary": "95500.00"
  },
  {
    "skill_id": 226,
    "skills": "terminal",
    "demanded_skills_for_jobs": "4",
    "average_salary": "80625.00"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demanded_skills_for_jobs": "20",
    "average_salary": "104917.90"
  },
  {
    "skill_id": 234,
    "skills": "confluence",
    "demanded_skills_for_jobs": "11",
    "average_salary": "114209.91"
  },
  {
    "skill_id": 235,
    "skills": "planner",
    "demanded_skills_for_jobs": "5",
    "average_salary": "76800.00"
  },
  {
    "skill_id": 236,
    "skills": "smartsheet",
    "demanded_skills_for_jobs": "5",
    "average_salary": "63000.00"
  },
  {
    "skill_id": 238,
    "skills": "notion",
    "demanded_skills_for_jobs": "1",
    "average_salary": "125000.00"
  },
  {
    "skill_id": 242,
    "skills": "clickup",
    "demanded_skills_for_jobs": "1",
    "average_salary": "90000.00"
  },
  {
    "skill_id": 248,
    "skills": "zoom",
    "demanded_skills_for_jobs": "1",
    "average_salary": "80740.00"
  },
  {
    "skill_id": 249,
    "skills": "microsoft teams",
    "demanded_skills_for_jobs": "4",
    "average_salary": "87853.88"
  },
  {
    "skill_id": 250,
    "skills": "twilio",
    "demanded_skills_for_jobs": "1",
    "average_salary": "127000.00"
  },
  {
    "skill_id": 253,
    "skills": "wire",
    "demanded_skills_for_jobs": "1",
    "average_salary": "42500.00"
  },
  {
    "skill_id": 255,
    "skills": "webex",
    "demanded_skills_for_jobs": "2",
    "average_salary": "81250.00"
  }
]
*/