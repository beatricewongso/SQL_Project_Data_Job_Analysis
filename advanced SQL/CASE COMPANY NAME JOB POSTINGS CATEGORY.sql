WITH number_of_job_postings AS(
    SELECT company_id,
        COUNT(job_id) AS number
    FROM job_postings_fact
    GROUP BY company_id
)
SELECT cd.name,
    CASE
        WHEN number_of_job_postings.number > 50 THEN 'Large'
        WHEN number_of_job_postings.number < 10 THEN 'Small'
        ELSE 'Medium'
    END AS category
FROM company_dim AS cd
    LEFT JOIN number_of_job_postings ON number_of_job_postings.company_id = cd.company_id
GROUP BY cd.name,
    number_of_job_postings.number
ORDER BY number_of_job_postings.number DESC;