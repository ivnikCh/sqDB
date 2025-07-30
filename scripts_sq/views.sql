-- Представление для анализа активных пользователей с их максимальным рейтингом
CREATE VIEW active_users_summary AS
SELECT 
    id,
    handle,
    rating,
    country,
    joined_at
FROM users
WHERE is_active = TRUE
WITH CASCADED CHECK OPTION;
COMMENT ON VIEW active_users_summary IS 'Активные пользователи с их текущим рейтингом (SCD Type 4)';
COMMENT ON COLUMN active_users_summary.rating IS 'Последний зафиксированный рейтинг активного пользователя';

-- Представление для задач с расширенной информацией (теги + контест)
CREATE VIEW problem_details AS
SELECT
    p.id,
    p.codeforces_id,
    p.title AS problem_title,
    c.title AS contest_title,
    p.difficulty,
    c.start_time,
    c.duration,
    STRING_AGG(t.name, ', ' ORDER BY t.name) AS tags
FROM problems p
JOIN contests c ON p.contest_id = c.id
LEFT JOIN problem_tags pt ON p.id = pt.problem_id
LEFT JOIN tags t ON pt.tag_id = t.id
GROUP BY p.id, c.id;
COMMENT ON VIEW problem_details IS 'Полная информация о задачах с тегами и контестами';
COMMENT ON COLUMN problem_details.tags IS 'Агрегированный список тегов задачи';