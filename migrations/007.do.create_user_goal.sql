CREATE TABLE user_goal (
    id SERIAL PRIMARY KEY,
    goal_text TEXT NOT NULL,
    user_id INTEGER
        REFERENCES users(id) ON DELETE CASCADE NOT NULL
);