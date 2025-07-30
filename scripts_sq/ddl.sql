CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    handle VARCHAR(50) UNIQUE NOT NULL,
    rating INTEGER DEFAULT 0,
    country VARCHAR(50),
    joined_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE users IS 'Таблица пользователей системы';
COMMENT ON COLUMN users.handle IS 'Уникальный никнейм пользователя';
COMMENT ON COLUMN users.rating IS 'Текущий рейтинг пользователя';
COMMENT ON COLUMN users.is_active IS 'Флаг активности пользователя (SCD Type 4)';

CREATE TABLE contests (
    id SERIAL PRIMARY KEY,
    codeforces_id VARCHAR(20) UNIQUE NOT NULL,
    title VARCHAR(200) NOT NULL,
    start_time TIMESTAMP NOT NULL,
    duration INTEGER NOT NULL,
    link VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE contests IS 'Таблица соревнований';
COMMENT ON COLUMN contests.duration IS 'Длительность соревнования в минутах';

CREATE TABLE problems (
    id SERIAL PRIMARY KEY,
    version INTEGER NOT NULL DEFAULT 1,
    codeforces_id VARCHAR(20) NOT NULL,
    contest_id INTEGER NOT NULL REFERENCES contests(id),
    title VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    difficulty INTEGER,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE problems IS 'Таблица задач';
COMMENT ON COLUMN problems.version IS 'Версия задачи (SCD Type 2)';
COMMENT ON COLUMN problems.contest_id IS 'Ссылка на соревнование';

CREATE TABLE tags (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    prev_name VARCHAR(50),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE tags IS 'Таблица тегов задач';
COMMENT ON COLUMN tags.prev_name IS 'Предыдущее название тега (SCD Type 3)';

CREATE TABLE problem_tags (
    problem_id INTEGER NOT NULL REFERENCES problems(id),
    tag_id INTEGER NOT NULL REFERENCES tags(id),
    PRIMARY KEY (problem_id, tag_id)
);
COMMENT ON TABLE problem_tags IS 'Связь многие-ко-многим между задачами и тегами';
CREATE TABLE submissions (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    problem_id INTEGER NOT NULL REFERENCES problems(id),
    language VARCHAR(50) NOT NULL,
    verdict VARCHAR(50) NOT NULL,
    submission_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE submissions IS 'Таблица посылок решений';
COMMENT ON COLUMN submissions.verdict IS 'Результат проверки решения';

CREATE TABLE solutions (
    id SERIAL PRIMARY KEY,
    submission_id INTEGER UNIQUE NOT NULL REFERENCES submissions(id),
    code TEXT NOT NULL,
    length INTEGER NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE solutions IS 'Таблица решений задач';

CREATE TABLE user_rating_history (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    old_rating INTEGER NOT NULL,
    new_rating INTEGER NOT NULL,
    change_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    contest_id INTEGER REFERENCES contests(id)
);
COMMENT ON TABLE user_rating_history IS 'История изменений рейтинга пользователей';

CREATE INDEX idx_problems_contest_id ON problems(contest_id);
CREATE INDEX idx_problems_codeforces_id ON problems(codeforces_id);
CREATE INDEX idx_submissions_user_id ON submissions(user_id);
CREATE INDEX idx_submissions_problem_id ON submissions(problem_id);
CREATE INDEX idx_submissions_verdict ON submissions(verdict);
CREATE INDEX idx_problem_tags_tag_id ON problem_tags(tag_id);
CREATE INDEX idx_user_rating_history_user_id ON user_rating_history(user_id);