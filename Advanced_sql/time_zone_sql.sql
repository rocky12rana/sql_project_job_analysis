SELECT
    job_title_short AS job_title,
    job_location AS location, 
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'IST' AS date_time

FROM
    job_postings_fact
    
LIMIT 5;
/* The above  querry is used to convert the job posted time to a cetain time zone. In this case, we are converting the job posted time from UTC to IST (Indian Standard Time). The AT TIME ZONE function is used to perform the conversion. The first AT TIME ZONE 'UTC' converts the job_posted_date from UTC to a timestamp without time zone, and the second AT TIME ZONE 'IST' converts it to IST. This allows us to see the job posted date and time in the IST time zone. */

