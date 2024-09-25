SELECT cd.NAME
FROM company_dim AS cd
    INNER JOIN job_postings_fact AS jpf ON jpf.company_id = cd.company_id
WHERE EXTRACT(
        QUARTER
        FROM job_posted_date
    ) >= 2
    AND jpf.job_health_insurance IS NOT NULL;