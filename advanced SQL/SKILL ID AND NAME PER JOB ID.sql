SELECT skills_job_dim.skill_id,
    jpf.job_id,
    skills_dim.skills,
    skills_dim.type
FROM job_postings_fact AS jpf
    LEFT JOIN skills_job_dim ON skills_job_dim.job_id = jpf.job_id
    LEFT JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE jpf.salary_year_avg > 70000
    AND EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 1
UNION ALL
SELECT skills_job_dim.skill_id,
    jpf.job_id,
    skills_dim.skills,
    skills_dim.type
FROM job_postings_fact AS jpf
    LEFT JOIN skills_job_dim ON skills_job_dim.job_id = jpf.job_id
    LEFT JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE jpf.salary_year_avg > 70000
    AND EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 2
UNION All
SELECT skills_job_dim.skill_id,
    jpf.job_id,
    skills_dim.skills,
    skills_dim.type
FROM job_postings_fact AS jpf
    LEFT JOIN skills_job_dim ON skills_job_dim.job_id = jpf.job_id
    LEFT JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE jpf.salary_year_avg > 70000
    AND EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 3;