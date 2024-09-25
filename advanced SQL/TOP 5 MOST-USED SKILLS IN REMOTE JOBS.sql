WITH remote_job_skills AS(
    SELECT sjd.skill_id AS skill,
        COUNT(sjd.job_id) AS skill_count
    FROM skills_job_dim AS sjd
        INNER JOIN job_postings_fact AS jpf ON sjd.job_id = jpf.job_id
    WHERE job_work_from_home = TRUE
    GROUP BY sjd.skill_id
)
SELECT skill,
    sd.skills,
    skill_count
FROM remote_job_skills
    INNER JOIN skills_dim AS sd ON sd.skill_id = remote_job_skills.skill
ORDER BY skill_count DESC
LIMIT 5;