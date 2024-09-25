WITH skill_count AS(
    SELECT skill_id,
        COUNT(skill_id) AS total_skills
    FROM skills_job_dim
    GROUP BY skill_id
)
SELECT skills_dim.skills,
    skill_count.total_skills
FROM skills_dim
    LEFT JOIN skill_count ON skill_count.skill_id = skills_dim.skill_id
ORDER BY total_skills DESC
LIMIT 5;