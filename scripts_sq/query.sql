--1. Топ-10 пользователей по рейтингу
SELECT id, handle, rating, country
FROM users
WHERE is_active = TRUE
ORDER BY rating DESC
LIMIT 10;

--2. Количество задач по тегам (только популярные теги)
SELECT tags.name, COUNT(problem_tags.problem_id) AS problem_count
FROM tags
JOIN problem_tags ON tags.id = problem_tags.tag_id
GROUP BY tags.name
HAVING COUNT(problem_tags.problem_id) > 5
ORDER BY problem_count DESC;

--3. Пользователи с максимальным количеством успешных посылок
SELECT users.handle, COUNT(submissions.id) AS successful_submissions
FROM users
JOIN submissions ON users.id = submissions.user_id AND submissions.verdict = 'OK'
GROUP BY users.id
ORDER BY successful_submissions DESC
LIMIT 5;

--4. Задачи, которые никто не смог решить
SELECT problems.title, problems.difficulty, tags.name AS tag
FROM problems
LEFT JOIN submissions ON problems.id = submissions.problem_id AND submissions.verdict = 'OK'
JOIN problem_tags ON problems.id = problem_tags.problem_id
JOIN tags ON problem_tags.tag_id = tags.id
WHERE submissions.id IS NULL AND problems.version = 1
GROUP BY problems.id, tags.name;

--5. Количество активных пользователей по странам
SELECT 
    country,
    COUNT(*) AS active_users
FROM users
WHERE is_active = TRUE
GROUP BY country
ORDER BY active_users DESC;

--6.Самые популярные языки программирования
SELECT 
    language,
    COUNT(*) AS submissions_count
FROM submissions
GROUP BY language
ORDER BY submissions_count DESC
LIMIT 5;

--7. Контесты с наибольшим количеством задач
SELECT 
    contests.title,
    COUNT(problems.id) AS problems_count
FROM contests
JOIN problems ON contests.id = problems.contest_id
GROUP BY contests.id
ORDER BY problems_count DESC
LIMIT 5;

--8. Самые популярные языки программирования
SELECT 
    language,
    COUNT(*) AS submissions_count,
    COUNT(DISTINCT user_id) AS unique_users,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM submissions
GROUP BY language
ORDER BY submissions_count DESC;

--9. Подзапрос с EXISTS (пользователи, решившие хотя бы одну >=1500 задачу)
SELECT users.handle
FROM users
WHERE EXISTS (
    SELECT 1
    FROM submissions
    JOIN problems ON submissions.problem_id = problems.id
    WHERE submissions.user_id = users.id 
    AND submissions.verdict = 'OK'
    AND problems.difficulty >= 1600
)
ORDER BY users.rating DESC;

--10. Подзапрос с ANY и агрегацией (пользователи с рейтингом выше среднего в своей стране)
SELECT users.handle, users.rating, users.country
FROM users
WHERE users.rating > ANY (
    SELECT AVG(rating)
    FROM users
    WHERE country = users.country
    AND is_active = TRUE
    GROUP BY country
)
AND users.is_active = TRUE
ORDER BY users.country, users.rating DESC;