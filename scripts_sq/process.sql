CREATE OR REPLACE PROCEDURE update_user_rating(
    user_id INTEGER,
    new_rating INTEGER,
    contest_id INTEGER DEFAULT NULL
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Начало транзакции
    BEGIN
        -- Обновление основного рейтинга
        UPDATE users 
        SET rating = new_rating,
            updated_at = CURRENT_TIMESTAMP
        WHERE id = user_id;
        
        -- Сохранение истории изменений
        INSERT INTO user_rating_history(user_id, old_rating, new_rating, contest_id)
        SELECT 
            user_id,
            (SELECT rating FROM users WHERE id = user_id),
            new_rating,
            contest_id;
        
        EXCEPTION 
            WHEN others THEN
                RAISE EXCEPTION 'Error updating rating for user %: %', user_id, SQLERRM;
    END;
END;
$$;

COMMENT ON PROCEDURE update_user_rating IS 'Обновляет рейтинг пользователя и сохраняет историю изменений';


CREATE OR REPLACE FUNCTION count_problems_by_difficulty(
    min_difficulty INTEGER,
    max_difficulty INTEGER
)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE
    problem_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO problem_count
    FROM problems
    WHERE difficulty BETWEEN min_difficulty AND max_difficulty;
    
    RETURN problem_count;
END;
$$;

COMMENT ON FUNCTION count_problems_by_difficulty IS 'Возвращает количество задач в указанном диапазоне сложности';

CREATE OR REPLACE PROCEDURE add_tag_to_problem(
    problem_id INTEGER,
    tag_name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
DECLARE
    tag_id INTEGER;
BEGIN
    -- Поиск существующего тега
    SELECT id INTO tag_id FROM tags WHERE name = tag_name;
    
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Tag % does not exist', tag_name;
    END IF;
    
    -- Добавление связи
    INSERT INTO problem_tags(problem_id, tag_id)
    VALUES (problem_id, tag_id)
    ON CONFLICT DO NOTHING;
END;
$$;

COMMENT ON PROCEDURE add_tag_to_problem IS 'Добавляет существующий тег к задаче (без создания новых тегов)';