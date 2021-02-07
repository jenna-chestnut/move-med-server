CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    comment_text TEXT NOT NULL,
    date_created TIMESTAMPTZ DEFAULT now() NOT NULL,
    user_exercise_id INTEGER
        REFERENCES user_exercises(id) ON DELETE CASCADE NOT NULL,
    user_id INTEGER
        REFERENCES users(id) ON DELETE CASCADE NOT NULL
);