-- TODO: Put script to create database

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
DROP TABLE IF EXISTS course_by_dates;
DROP TABLE IF EXISTS attendance_by_course;
DROP TABLE IF EXISTS courses_by_students;
DROP TABLE IF EXISTS courses;
DROP FUNCTION IF EXISTS check_user_role(UUID, roles_enum);
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS attendance_types;
DROP TYPE IF EXISTS attendance_types_enum;
DROP TABLE IF EXISTS roles;
DROP TYPE IF EXISTS roles_enum;

CREATE TYPE attendance_types_enum AS ENUM ('puntual', 'tardanza', 'grabación vista', 'no asistencia');

CREATE TABLE attendance_types (
    id SERIAL PRIMARY KEY,
    name attendance_types_enum NOT NULL UNIQUE
);

INSERT INTO attendance_types (name) VALUES
    ('puntual'),
    ('tardanza'),
    ('grabación vista'),
    ('no asistencia');

CREATE TYPE roles_enum AS ENUM ('student', 'teacher');
CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    name roles_enum UNIQUE NOT NULL
);

INSERT INTO roles (name) VALUES
    ('student'),
    ('teacher');


CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE users (
	id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
	name VARCHAR(255) CHECK (name ~ '^[^0-9]+$') NOT NULL,
	last_name VARCHAR(255) CHECK (last_name ~ '^[^0-9]+$') NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20) NOT NULL,
	active BOOLEAN NOT NULL,
	role_id INTEGER REFERENCES roles(id) ON DELETE RESTRICT NOT NULL
);

INSERT INTO users (name, last_name, email, phone, role_id, active) VALUES
    ('luis', 'sanchez', 'luis@mail.com', '3111111111', (SELECT id FROM roles WHERE name = 'student'), TRUE),
    ('maria', 'sanchez', 'maria@mail.com', '3111234567', (SELECT id FROM roles WHERE name = 'student'), TRUE),
    ('daniel', 'paramo', 'daniel@mail.com', '3134946344', (SELECT id FROM roles WHERE name = 'teacher'), TRUE),
    ('alex', 'umbarila', 'alex@mail.com', '3147895623', (SELECT id FROM roles WHERE name = 'teacher'), TRUE);


CREATE OR REPLACE FUNCTION check_user_role(user_id UUID, role_name roles_enum)
RETURNS BOOLEAN AS $$
BEGIN
  RETURN (
    SELECT EXISTS (
      SELECT 1
      FROM users
      WHERE id = user_id AND role_id = (SELECT id FROM roles WHERE name = role_name)
    )
  );
END;
$$ LANGUAGE plpgsql;


CREATE TABLE courses (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description VARCHAR(255) NOT NULL,
    url VARCHAR(255) UNIQUE,
    qr VARCHAR(255) UNIQUE,
	teacher_id UUID REFERENCES users(id) ON DELETE RESTRICT NOT NULL,
    active BOOLEAN NOT NULL,
    CONSTRAINT chk_url_or_qr CHECK (
        (url IS NOT NULL AND qr IS NULL) OR 
        (url IS NULL AND qr IS NOT NULL) OR 
        (url IS NOT NULL AND qr IS NOT NULL)
    ),
	CONSTRAINT chk_teacher_role CHECK (check_user_role(teacher_id, 'teacher'))
);


INSERT INTO courses (name, description, url, qr, teacher_id, active) VALUES
    ('math', 'awesome math', 'www.math-class.com', 'codigo-qr-math', (SELECT id FROM users WHERE email = 'daniel@mail.com'), TRUE),
    ('biology', 'bad biology', NULL, 'codigo-qr-biology', (SELECT id FROM users WHERE email = 'daniel@mail.com'), TRUE),
   	('tech', 'awesome tech', 'www.tech-class.com', NULL, (SELECT id FROM users WHERE email = 'alex@mail.com'), TRUE),
    ('english', 'good english', NULL, 'codigo-qr-english', (SELECT id FROM users WHERE email = 'alex@mail.com'), TRUE);


CREATE TABLE courses_by_students (
    id_user UUID REFERENCES users(id) CHECK (check_user_role(id_user, 'student')),
    id_course UUID REFERENCES courses(id) ON DELETE RESTRICT NOT NULL,
    PRIMARY KEY (id_user, id_course)
);


INSERT INTO courses_by_students (id_user, id_course) VALUES ((SELECT id FROM users WHERE email = 'luis@mail.com'), (SELECT id FROM courses WHERE qr = 'codigo-qr-math'));
INSERT INTO courses_by_students (id_user, id_course) VALUES ((SELECT id FROM users WHERE email = 'luis@mail.com'), (SELECT id FROM courses WHERE qr = 'codigo-qr-biology'));
INSERT INTO courses_by_students (id_user, id_course) VALUES ((SELECT id FROM users WHERE email = 'maria@mail.com'), (SELECT id FROM courses WHERE qr = 'codigo-qr-math'));

CREATE TABLE attendance_by_course (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    id_student UUID REFERENCES users(id) CHECK (check_user_role(id_student, 'student')) NOT NULL,
    id_course UUID REFERENCES courses(id) ON DELETE CASCADE NOT NULL,
    dateTimeMs TIMESTAMP NOT NULL,
    id_attendance_type INTEGER REFERENCES attendance_types(id) NOT NULL,
    CONSTRAINT fk_user_no_delete FOREIGN KEY (id_student) REFERENCES users(id) ON DELETE RESTRICT
);


INSERT INTO attendance_by_course (id_student, id_course, dateTimeMs, id_attendance_type)
VALUES
    ((SELECT id FROM users WHERE email = 'luis@mail.com'), (SELECT id FROM courses WHERE qr = 'codigo-qr-math'), now(), (SELECT id FROM attendance_types WHERE name = 'puntual')),
    ((SELECT id FROM users WHERE email = 'maria@mail.com'), (SELECT id FROM courses WHERE qr = 'codigo-qr-math'), now(), (SELECT id FROM attendance_types WHERE name = 'tardanza')),
    ((SELECT id FROM users WHERE email = 'luis@mail.com'), (SELECT id FROM courses WHERE qr = 'codigo-qr-biology'), now(), (SELECT id FROM attendance_types WHERE name = 'no asistencia')),
    ((SELECT id FROM users WHERE email = 'maria@mail.com'), (SELECT id FROM courses WHERE qr = 'codigo-qr-biology'), now(), (SELECT id FROM attendance_types WHERE name = 'no asistencia'));

CREATE TABLE course_by_dates (
    id SERIAL PRIMARY KEY,
    id_course UUID REFERENCES courses(id) ON DELETE CASCADE NOT NULL,
    startDateTimeMs TIMESTAMP NOT NULL,
    endDateTimeMs TIMESTAMP,
    active BOOLEAN NOT NULL
);


INSERT INTO course_by_dates (id_course, startDateTimeMs, active)
VALUES
    ((SELECT id FROM courses WHERE qr = 'codigo-qr-math'), now(), TRUE),
    ((SELECT id FROM courses WHERE qr = 'codigo-qr-biology'), now(), TRUE),
    ((SELECT id FROM courses WHERE qr = 'codigo-qr-english'), now(), TRUE);
