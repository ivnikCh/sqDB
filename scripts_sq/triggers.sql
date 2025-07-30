CREATE OR REPLACE FUNCTION log_rating_change()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.rating <> NEW.rating THEN
        INSERT INTO user_rating_history(user_id, old_rating, new_rating)
        VALUES (OLD.id, OLD.rating, NEW.rating);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER user_rating_history_trigger
AFTER UPDATE OF rating ON users
FOR EACH ROW
EXECUTE FUNCTION log_rating_change();

CREATE OR REPLACE FUNCTION track_tag_name_change()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.name <> NEW.name THEN
        NEW.prev_name = OLD.name;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tag_name_history_trigger
BEFORE UPDATE ON tags
FOR EACH ROW
EXECUTE FUNCTION track_tag_name_change();

CREATE OR REPLACE FUNCTION check_rating_value()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.rating < 0 THEN
        RAISE EXCEPTION 'Рейтинг не может быть отрицательным';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER validate_rating
BEFORE INSERT OR UPDATE ON users
FOR EACH ROW
EXECUTE FUNCTION check_rating_value();