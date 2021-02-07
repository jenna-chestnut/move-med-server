CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  user_name TEXT NOT NULL UNIQUE,
  full_name TEXT NOT NULL,
  password TEXT NOT NULL,
  date_created TIMESTAMPTZ NOT NULL DEFAULT now(),
  date_modified TIMESTAMPTZ,
  is_admin BOOLEAN default FALSE,
  is_provider BOOLEAN default FALSE
);