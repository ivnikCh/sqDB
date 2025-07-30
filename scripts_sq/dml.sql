-- Очистка таблиц (для повторного запуска)
TRUNCATE TABLE user_rating_history RESTART IDENTITY CASCADE;
TRUNCATE TABLE problem_tags RESTART IDENTITY CASCADE;
TRUNCATE TABLE solutions RESTART IDENTITY CASCADE;
TRUNCATE TABLE submissions RESTART IDENTITY CASCADE;
TRUNCATE TABLE problems RESTART IDENTITY CASCADE;
TRUNCATE TABLE tags RESTART IDENTITY CASCADE;
TRUNCATE TABLE contests RESTART IDENTITY CASCADE;
TRUNCATE TABLE users RESTART IDENTITY CASCADE;

-- Заполнение таблицы users (30+ пользователей)
INSERT INTO users (handle, rating, country, is_active) VALUES
('tourist', 3500, 'Belarus', TRUE),
('Petr', 3200, 'Russia', TRUE),
('Egor', 3100, 'Russia', TRUE),
('scott_wu', 3000, 'USA', TRUE),
('neal', 2900, 'USA', TRUE),
('DmitriyH', 2800, 'Ukraine', TRUE),
('Errichto', 2700, 'Poland', TRUE),
('RAD', 2600, 'Belarus', TRUE),
('niyaznigmatul', 2500, 'Russia', TRUE),
('VArtem', 2400, 'Russia', TRUE),
('pashka', 2300, 'Russia', TRUE),
('Burunduk1', 2200, 'Russia', TRUE),
('qwerty787788', 2100, 'Belarus', TRUE),
('vepifanov', 2000, 'Russia', TRUE),
('Fdg', 1900, 'Russia', TRUE),
('Endagorion', 1800, 'Russia', TRUE),
('KAN', 1700, 'Russia', TRUE),
('Um_nik', 1600, 'Russia', TRUE),
('Yan_an', 1500, 'China', TRUE),
('ko_osaga', 1400, 'South Korea', TRUE),
('maroonrk', 1300, 'Japan', TRUE),
('hos.lyric', 1200, 'Japan', TRUE),
('yosupo', 1100, 'Japan', TRUE),
('sigma425', 1000, 'Japan', TRUE),
('ainta', 900, 'South Korea', TRUE),
('jtnydv25', 800, 'India', TRUE),
('rajat1603', 700, 'India', TRUE),
('chemthan', 600, 'Vietnam', TRUE),
('I_love_Hoang_Yen', 500, 'Vietnam', TRUE),
('bmerry', 400, 'South Africa', TRUE),
('krijgertje', 300, 'Netherlands', TRUE),
('xllend3', 200, 'USA', FALSE),
('old_user', 100, 'Russia', FALSE);

-- Заполнение таблицы contests (30+ соревнований)
INSERT INTO contests (codeforces_id, title, start_time, duration) VALUES
('1', 'Codeforces Round #1', '2010-01-01 12:00:00', 120),
('2', 'Codeforces Round #2', '2010-02-01 12:00:00', 120),
('3', 'Codeforces Round #3', '2010-03-01 12:00:00', 120),
('4', 'Codeforces Round #4', '2010-04-01 12:00:00', 120),
('5', 'Codeforces Round #5', '2010-05-01 12:00:00', 120),
('6', 'Codeforces Round #6', '2010-06-01 12:00:00', 120),
('7', 'Codeforces Round #7', '2010-07-01 12:00:00', 120),
('8', 'Codeforces Round #8', '2010-08-01 12:00:00', 120),
('9', 'Codeforces Round #9', '2010-09-01 12:00:00', 120),
('10', 'Codeforces Round #10', '2010-10-01 12:00:00', 120),
('11', 'Codeforces Round #11', '2010-11-01 12:00:00', 120),
('12', 'Codeforces Round #12', '2010-12-01 12:00:00', 120),
('13', 'Codeforces Round #13', '2011-01-01 12:00:00', 120),
('14', 'Codeforces Round #14', '2011-02-01 12:00:00', 120),
('15', 'Codeforces Round #15', '2011-03-01 12:00:00', 120),
('16', 'Codeforces Round #16', '2011-04-01 12:00:00', 120),
('17', 'Codeforces Round #17', '2011-05-01 12:00:00', 120),
('18', 'Codeforces Round #18', '2011-06-01 12:00:00', 120),
('19', 'Codeforces Round #19', '2011-07-01 12:00:00', 120),
('20', 'Codeforces Round #20', '2011-08-01 12:00:00', 120),
('21', 'Codeforces Round #21', '2011-09-01 12:00:00', 120),
('22', 'Codeforces Round #22', '2011-10-01 12:00:00', 120),
('23', 'Codeforces Round #23', '2011-11-01 12:00:00', 120),
('24', 'Codeforces Round #24', '2011-12-01 12:00:00', 120),
('25', 'Codeforces Round #25', '2012-01-01 12:00:00', 120),
('26', 'Codeforces Round #26', '2012-02-01 12:00:00', 120),
('27', 'Codeforces Round #27', '2012-03-01 12:00:00', 120),
('28', 'Codeforces Round #28', '2012-04-01 12:00:00', 120),
('29', 'Codeforces Round #29', '2012-05-01 12:00:00', 120),
('30', 'Codeforces Round #30', '2012-06-01 12:00:00', 120),
('31', 'Codeforces Round #31', '2012-07-01 12:00:00', 120),
('32', 'Codeforces Round #32', '2012-08-01 12:00:00', 120);


-- Заполнение таблицы tags (30+ тегов)
INSERT INTO tags (name, prev_name) VALUES
('greedy', NULL),
('math', NULL),
('dp', 'dynamic programming'),
('graphs', NULL),
('trees', NULL),
('data structures', NULL),
('binary search', NULL),
('brute force', NULL),
('implementation', NULL),
('sortings', NULL),
('strings', NULL),
('number theory', NULL),
('geometry', NULL),
('combinatorics', NULL),
('bitmasks', NULL),
('dfs and similar', 'dfs'),
('two pointers', NULL),
('divide and conquer', NULL),
('shortest paths', NULL),
('hashing', NULL),
('games', NULL),
('flows', 'network flows'),
('interactive', NULL),
('matrices', NULL),
('string suffix structures', NULL),
('fft', 'fast fourier transform'),
('dsu', 'disjoint set union'),
('probabilities', NULL),
('schedules', NULL),
('2-sat', '2-satisfiability'),
('meet-in-the-middle', NULL),
('chinese remainder theorem', NULL),
('constructive algorithms', 'constructive');

-- Заполнение таблицы problems (30+ задач)
DO $$
DECLARE
    contest_id INT;
BEGIN
    FOR contest_id IN SELECT id FROM contests LOOP
        INSERT INTO problems (codeforces_id, contest_id, title, description, difficulty, version) VALUES
        (contest_id || 'A', contest_id, 'Problem A', 'Description for problem A', 800, 1),
        (contest_id || 'B', contest_id, 'Problem B', 'Description for problem B', 1200, 1),
        (contest_id || 'C', contest_id, 'Problem C', 'Description for problem C', 1600, 1);
    END LOOP;
END $$;

-- Добавление дополнительных версий задач (SCD Type 2)
INSERT INTO problems (codeforces_id, contest_id, title, description, difficulty, version)
SELECT codeforces_id || '_v2', contest_id, title || ' (updated)', description || ' Updated description', difficulty + 100, 2
FROM problems WHERE version = 1 AND random() < 0.3;

-- Связывание задач с тегами (problem_tags)
INSERT INTO problem_tags (problem_id, tag_id)
SELECT p.id, t.id 
FROM problems p
CROSS JOIN (SELECT id FROM tags ORDER BY random() LIMIT (2 + random()::int % 3)) t
WHERE p.version = 1;

-- Заполнение таблицы submissions (30+ посылок)
DO $$
DECLARE
    user_id INT;
    problem_id INT;
BEGIN
    FOR user_id IN SELECT id FROM users WHERE is_active = TRUE LOOP
        FOR problem_id IN SELECT id FROM problems WHERE version = 1 AND random() < 0.5 LIMIT 5 LOOP
            INSERT INTO submissions (user_id, problem_id, language, verdict) VALUES
            (user_id, problem_id, 
             CASE (random() * 4)::int % 5 
                 WHEN 0 THEN 'C++' WHEN 1 THEN 'Java' WHEN 2 THEN 'Python' WHEN 3 THEN 'Rust' ELSE 'Go' 
             END,
             CASE (random() * 10)::int % 10
                 WHEN 0 THEN 'OK' WHEN 1 THEN 'WRONG_ANSWER' WHEN 2 THEN 'TIME_LIMIT_EXCEEDED' 
                 WHEN 3 THEN 'RUNTIME_ERROR' WHEN 4 THEN 'COMPILATION_ERROR' ELSE 'OK' 
             END);
        END LOOP;
    END LOOP;
END $$;

-- Заполнение таблицы solutions (для каждой посылки)
INSERT INTO solutions (submission_id, code, length)
SELECT s.id, 
       '// Solution code for submission ' || s.id || E'\n#include <iostream>\n\nint main() {\n  std::cout << "Hello, world!" << std::endl;\n  return 0;\n}',
       (100 + random() * 900)::int
FROM submissions s;


-- Заполнение таблицы user_rating_history (история рейтингов)
DO $$
DECLARE
    user_id INT;
    current_rating INT;
    change_date TIMESTAMP;
    contest_id INT;
BEGIN
    FOR user_id IN SELECT id FROM users WHERE is_active = TRUE LOOP
        current_rating := 1500;
        change_date := '2010-01-01 00:00:00'::TIMESTAMP;
        
        FOR contest_id IN SELECT id FROM contests ORDER BY start_time LOOP
            IF random() < 0.7 THEN
                current_rating := current_rating + (random() * 200 - 100)::int;
                change_date := change_date + (random() * 30)::int * '1 day'::interval;
                
                INSERT INTO user_rating_history (user_id, old_rating, new_rating, change_date, contest_id)
                VALUES (user_id, current_rating - (random() * 100)::int, current_rating, change_date, contest_id);
            END IF;
        END LOOP;
    END LOOP;
END $$;

-- Обновление текущих рейтингов пользователей на основе истории
UPDATE users u
SET rating = (
    SELECT new_rating 
    FROM user_rating_history urh 
    WHERE urh.user_id = u.id 
    ORDER BY change_date DESC 
    LIMIT 1
)
WHERE is_active = TRUE;
