BEGIN; 

TRUNCATE 
  exercises,
  users,
  user_exercises,
  comments,
  body_categories,
  exercise_body_parts,
  user_goal
  RESTART IDENTITY CASCADE;

INSERT INTO exercises (exercise_name, imgURL, videoURL)
VALUES
  ('Back Extension', 'https://tinyurl.com/y4qwu5kf', '3UTHsuDl4vw'),
  ('Cervical Spine Retraction/Extension', 'https://tinyurl.com/y249qrbl', 'ZY3s2Y1dTck'),
  ('Hip Extension', 'https://tinyurl.com/yymh2drz', '5ZdkDtwmgWs'),
  ('Thoracic Extension Sitting', 'https://tinyurl.com/y4fwrt4l', 'U-b_36Uc-9E'),
  ('Knee Flexion', 'https://tinyurl.com/y2jmtb3e', 'lMpP4ngZKw4'),
  ('Elbow Extension', 'https://tinyurl.com/y3lqkavl', 'ry8lUjavfr8'),
  ('Inner Thigh Stretch', 'https://tinyurl.com/yxnav4jd', 'S37HKFbpx4U'),
  ('Wrist Extension', 'https://tinyurl.com/y3havjyj', 'dyCAYuT77iQ'),
  ('Shoulder Internal Rotation', 'https://tinyurl.com/y37oj8lz', 'Ab6jLeQfHvg');

INSERT INTO users (user_name, full_name, password, is_admin, is_provider)
VALUES
  ('Jennabot5000', 'Jenna Chestnut', '$2a$04$JXMVL1PAaJlaHv7apR23Yesmsoj5wyH3FjRUR6BFzg7F4Eq3ocgc.', TRUE, TRUE),
  ('SalemtheDog', 'Salem Chestnut',
  '$2a$04$Wi4F0gsLW10vGRdZNbUVL.YIiNxZGJvNclpozolW/8xdR9Wsp.YFW', FALSE, FALSE),
  ('Odykins', 'Otis Jackson',
  '$2a$04$GRXA/pyDfSuXUdiSZ9rQduL/Q7DAsEB2OpWb1xUgfVGFfTEfv4Wqu', FALSE, FALSE),
  ('TheFizzicyst', 'Doctor Thunder', 
  '$2a$04$jILw8c06cs4VmFAVPLcCp.xn8Cki7gTKJtvbkE/EeqVOx2vPXhz0e', FALSE, TRUE),
  ('nSpireMe', 'Anita Inspo', 
  '$2a$04$3qRBLtY7BxjIJiKaIzufDOANSz6mqcDwnYW4XfdDk6PKK7v2ZEERG', FALSE, FALSE);

INSERT INTO user_exercises (exercise_id, user_id, provider_id, frequency, duration, add_note)
VALUES
  (1, 2, 4, 3, 'day', 'Gradually increase pressure if it feels right!'),
  (2, 2, 4, 1, 'hour', 'Take this one slowly, hold off if it hurts.'),
  (4, 2, 4, 3, 'day', 'Be sure to do before bed'),
  (3, 3, 4, 1, '2 hours', 'Be sure to do before & after runnning'),
  (5, 3, 4, 2, 'day', 'Post swim exercise.'),
  (7, 3, 4, 1, 'hour', '10 reps per day maximum!'),
  (6, 5, 4, 4, 'day', 'Let us know if you have any questions!'),
  (8, 5, 4, 1, '4 hours', 'Very important - set an alarm if you need a reminder!'),
  (9, 5, 4, 2, 'hour', 'Before softball games'),
  (2, 5, 4, 1, 'hour', 'During work in the office'),
  (1, 5, 4, 3, 'day', 'Can do sitting or standing version');

INSERT INTO comments (comment_text, user_exercise_id, user_id)
VALUES
  ('Started to ache after nth rep', 2, 2),
  ('Feeling AMAZING after this exercise!', 3, 2),
  ('Started to ache after nth rep', 1, 2),
  ('You can hold off for now if it''s bothering you', 2, 4),
  ('Feeling AMAZING after this exercise!', 4, 3),
  ('You can hold off for now if it''s bothering you', 4, 4),
  ('I don''t feel anything when I do this exercise..', 5, 3),
  ('Started to ache after nth rep', 6, 3),
  ('I don''t feel anything when I do this exercise..', 7, 5),
  ('Feeling AMAZING after this exercise!', 8, 5),
  ('We''ll be sure to discuss at your next appointment!', 8, 4),
  ('You can hold off for now if it''s bothering you', 3, 4),
  ('Started to ache after nth rep', 9, 5),
  ('I don''t feel anything when I do this exercise..', 10, 5),
  ('We''ll be sure to discuss at your next appointment!', 10, 4);

INSERT INTO body_categories (body_part)
VALUES
  ('Back'),
  ('Neck'),
  ('Shoulder'),
  ('Knee'),
  ('Hip'),
  ('Leg'),
  ('Elbow'),
  ('Wrist');

INSERT INTO exercise_body_parts (exercise_id, body_category_id)
VALUES
  (1, 1),
  (2, 2),
  (3, 5),
  (4, 1),
  (4, 2),
  (4, 3),
  (5, 4),
  (6, 7),
  (6, 8),
  (7, 5),
  (7, 6),
  (8, 8),
  (8, 7),
  (9, 2),
  (9, 3);

INSERT INTO user_goal (goal_text, user_id)
VALUES
  ('Get back into your swim team without achy knees!', 3),
  ('Fix your posture so you can sit and stand taller & without pain', 2),
  ('Feel more comfortable overall, without being afraid of falling or getting injured.', 5);

COMMIT;