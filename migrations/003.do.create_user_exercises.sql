CREATE TABLE user_exercises (
    id SERIAL PRIMARY KEY,
    exercise_id INTEGER
        REFERENCES exercises(id) ON DELETE CASCADE NOT NULL,
    user_id INTEGER
        REFERENCES users(id) ON DELETE CASCADE NOT NULL,
    provider_id INTEGER
        REFERENCES users(id) ON DELETE CASCADE NOT NULL,
    frequency TEXT default 'As prescribed',
    duration TEXT default 'As prescribed',
    add_note TEXT default 'Give us a call if you have any questions!'
);