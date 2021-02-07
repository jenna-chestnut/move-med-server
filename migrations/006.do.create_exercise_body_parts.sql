CREATE TABLE exercise_body_parts (
    id SERIAL PRIMARY KEY,
    exercise_id INTEGER
        REFERENCES exercises(id) ON DELETE CASCADE NOT NULL,
    body_category_id INTEGER
        REFERENCES body_categories(id) ON DELETE CASCADE NOT NULL
);
