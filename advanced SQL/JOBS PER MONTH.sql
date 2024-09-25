SELECT EXTRACT(
        MONTH
        FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EDT'
    ) AS month,
    COUNT(job_id)
FROM job_postings_fact
GROUP BY MONTH
ORDER BY MONTH;