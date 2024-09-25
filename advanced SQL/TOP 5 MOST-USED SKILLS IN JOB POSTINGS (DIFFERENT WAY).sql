SELECT COUNT(sjd.skill_id),
    sd.skills
FROM skills_job_dim AS sjd
    INNER JOIN skills_dim AS sd ON sd.skill_id = sjd.skill_id
GROUP BY sd.skills
ORDER BY COUNT(sjd.skill_id) DESC
LIMIT 5;