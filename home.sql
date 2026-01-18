-------------------------------- HOME WORK 

CREATE DATABASE uzum_market;

\c uzum_market

--------- CUSTOMERS

DROP TABLE IF EXISTS customers;

CREATE TABLE customers(
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(50) NOT NULL,
    "phone" VARCHAR(50) NOT NULL
);

------------ PRODACTS


DROP TABLE IF EXISTS prodacts;

CREATE TABLE prodacts(
    "id" SERIAL PRIMARY KEY,
    "title" VARCHAR(50) NOT NULL,
    "price" NUMERIC(10,2) NOT NULL
);

------------  ORDERS

DROP TABLE IF EXISTS orders;

CREATE TABLE orders(
    "id" SERIAL PRIMARY KEY,
    "customer_id" INTEGER NOT NULL,
    "prodact_id" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    CONSTRAINT fk_customer_id FOREIGN KEY(customer_id) REFERENCES customers(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_prodact_id FOREIGN KEY(prodact_id) REFERENCES prodacts(id) ON DELETE CASCADE ON UPDATE CASCADE
);

--------------- CUSTOMERS INSERT

INSERT INTO customers("name", "phone")
VALUES
('husanboy', '+998901234567'),
('qudrat', '+998901234568'),
('somsa', '+998901234569'),
('dilshod', '+998901234570'),
('shaxriyor', '+998901234571'),
('sanjar', '+998901234572'),
('bobur', '+998901234573'),
('boltaboy', '+998901234574'),
('robert', '+998901234575'),
('john', '+998901234576');


--------------- PRODACTS INSERT

INSERT INTO prodacts("title", "price")
VALUES
('apple', 1000.99),
('banana', 2000.99),
('orange', 3000.99),
('grape', 4000.99),
('kiwi', 5000.99),
('lemon', 6000.99),
('mango', 7000.99),
('pineapple', 8000.99),
('watermelon', 9000.99),
('peach', 10000.99),
('plum', 11000.99),
('cherry', 12000.99),
('raspberry', 13000.99),
('strawberry', 14000.99),
('blueberry', 15000.99),
('blackberry', 16000.99),
('cranberry', 17000.99),
('raspberry', 18000.99);


------------------------  ORDERS INSERT

INSERT INTO orders("customer_id", "prodact_id", "quantity")
VALUES
(1, 1, 8),
(1, 2, 10),
(1, 9, 12),
(3, 3, 5),
(3, 4, 7),
(5, 10, 9),
(5, 1, 11),
(4, 7, 13),
(6, 6, 15),
(7, 1, 20),
(8, 6, 25),
(10, 2, 3),
(9, 3, 4),
(9, 4, 5),
(10, 7, 6),
(6, 8, 7),
(7, 9, 8),
(8, 10, 9),
(9, 11, 10),
(10, 12, 11);



----------  SELECT

SELECT * FROM customers;

SELECT * FROM prodacts;

SELECT * FROM orders;



-------------- 

SELECT ROW_NUMBER() OVER (ORDER BY c.name) AS row_num,
       c.name AS customer_name,
       p.title AS prodact_title,
       o.quantity,
       p.price,
       (o.quantity * p.price) AS total_sum
FROM orders o
JOIN customers c ON c.id = o.customer_id
JOIN prodacts p ON p.id = o.prodact_id
ORDER BY c.name;

---------------- 

SELECT p.title,
CASE
WHEN o.id IS NULL THEN 'sotib olinmagan'
ELSE 'sotib olingan'
END AS "status"
FROM prodacts p
LEFT JOIN orders o ON o.prodact_id = p.id
ORDER BY "status", p.title;

------------------ 

SELECT 
   ROW_NUMBER() OVER (ORDER BY c.name) AS row_num,
    c.name,
    o.id AS order_id,
    p.title AS prodact_title,
    o.quantity
FROM customers c
FULL JOIN orders o
    ON c.id = o.customer_id
FULL JOIN prodacts p
    ON o.prodact_id = p.id
ORDER BY c.name;


------------------  


CREATE DATABASE nj1;

\c nj1;

DROP TABLE students IF EXISTS;
DROP TABLE courses IF EXISTS;
DROP TABLE enrollments IF EXISTS;

CREATE TABLE students(
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(50) NOT NULL
);

CREATE TABLE courses(
    "id" SERIAL PRIMARY KEY,
    "title" VARCHAR(70) NOT NULL
);

CREATE TABLE enrollments(
    "id" SERIAL PRIMARY KEY,
    "student_id" INTEGER NOT NULL,
    "course_id" INTEGER NOT NULL,
    CONSTRAINT fk_student_id FOREIGN KEY("student_id") REFERENCES students("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_course_id FOREIGN KEY("course_id") REFERENCES courses("id") ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO students(name)
VALUES
('somsa'),
('robert'),
('john'),
('tyson'),
('zidan');


INSERT INTO courses(title)
VALUES
('react.js'),
('node.js'),
('python'),
('java'),
('c++'),
('c#'),
('sql'),
('html'),
('css'),
('js');

INSERT INTO enrollments(student_id, course_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(3, 6),
(3, 7),
(4, 8),
(4, 9),
(5, 10);

SELECT * FROM students;

SELECT * FROM courses;

SELECT * FROM enrollments;

INSERT INTO students(name)
VALUES
('mane'),
('sane');


INSERT INTO courses(title)
VALUES
('csgo'),
('dota2'),
('fortnite'),
('call of duty'),
('minecraft');



-------------------------


SELECT
    ROW_NUMBER() OVER (ORDER BY s.name) AS qator,
    s.name AS student_ismi,
    c.title AS kurs_nomi
FROM students s
JOIN enrollments e ON e.student_id = s.id
JOIN courses c ON c.id = e.course_id
ORDER BY s.name, c.title;


--------------

SELECT DISTINCT
    s.name AS student
FROM students s
LEFT JOIN enrollments e
    ON s.id = e.student_id
WHERE e.id IS NULL;


-------------

SELECT
    c.title AS kurs_nomi
FROM courses c
LEFT JOIN enrollments e 
    ON e.course_id = c.id
WHERE e.id IS NULL
ORDER BY c.title;

----------------

SELECT
    c.title AS kurs_nomi,
    COUNT(e.id) AS student_soni
FROM enrollments e
JOIN courses c ON c.id = e.course_id
GROUP BY c.title
ORDER BY c.title;


----------------------------------------------------------- DARS  


CREATE DATABASE lesson3;

\c lesson3

drop table users if exists;
drop table orders if exists;

create table users (
    "id" integer primary key autoincrement,
    'username' varchar not null unique,
    "email" varchar not null unique,
    'password' varchar not null
);

-- order foreign key

CREATE TABLE orders (
    "id" integer primary key
    "user_id" integer not null,
    "quantity" integer not null,
    CONSTRAINT fk_user_id FOREIGN KEY("user_id") REFERENCES users("id") ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO users (username, email, password) VALUES ('test', 'test', 'test');

INSERT INTO orders (user_id, quantity) VALUES (1, 1);







------------------

CREATE TABLE staffs(
    "id" SERIAL PRIMARY KEY,
    "username" VARCHAR(50) NOT NULL,
    "age" INTEGER NOT NULL
);


INSERT INTO staffs(username, age) VALUES ('aziz', 22), ('shaxriyor', 14), ('sevgila', 15);

-------------------

CREATE TABLE teachers(
    "id" SERIAL PRIMARY KEY,
    "username" VARCHAR(50) NOT NULL,
    "profeesion" VARCHAR(50) NOT NULL,
    "staff_id" INTEGER NOT NULL,
    CONSTRAINT fk_staff_id FOREIGN KEY(staff_id) REFERENCES staffs(id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO teachers(username, profeesion, staff_id)
VALUES
('bobur', 'react.js', 1),
('boltaboy', 'node.js', 1),
('robert', 'python', 2);


CREATE TABLE courses(
    "id" SERIAL PRIMARY KEY,
    "title" VARCHAR(50) NOT NULL,
    "teacher_id" INTEGER NOT NULL,
    "staff_id" INTEGER NOT NULL,
    CONSTRAINT fk_staff_id FOREIGN KEY(staff_id) REFERENCES staffs(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_teacher_id FOREIGN KEY(teacher_id) REFERENCES teachers(id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO courses(title, teacher_id, staff_id)
VALUES
('xn_8', 1, 1),
('xn_9', 2, 1),
('xn_10', 3, 3);


-------------------------

CREATE TABLE students(
    "id" SERIAL PRIMARY KEY,
    "username" VARCHAR(50) NOT NULL,
    "course_id" INTEGER NOT NULL,
    "staff_id" INTEGER NOT NULL,
    CONSTRAINT fk_course_id FOREIGN KEY(course_id) REFERENCES courses(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_staff_id FOREIGN KEY(staff_id) REFERENCES staffs(id) ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO students(username, course_id, staff_id)
VALUES
('husanboy', 1, 1),
('qudrat', 2, 2),
('sin', 2, 3);


SELECT * FROM staffs;

SELECT * FROM teachers;

SELECT * FROM courses;

SELECT * FROM students;



---- INNER JOIN

SELECT
    t.username AS teacher,
    t.profeesion,
    s.username AS staff
FROM teachers t
INNER JOIN staffs s ON s.id = t.staff_id;



-------- LEFT JOIN

SELECT
    s.username AS staff,
    t.username AS teacher
FROM staffs s
LEFT JOIN teachers t ON t.staff_id = s.id;


------------- RIGHT JOIN

SELECT
    s.username AS staff,
    t.username AS teacher
FROM staffs s
RIGHT JOIN teachers t ON t.staff_id = s.id;





---------- FULL  JOIN

SELECT
    s.username AS staff,
    t.username AS teacher
FROM staffs s
FULL JOIN teachers t ON t.staff_id = s.id;



----- JOIN WITH THREE TABLES


SELECT
    st.username AS student,
    c.title AS course,
    t.username AS teacher
FROM students st
JOIN courses c ON c.id = st.course_id
JOIN teachers t ON t.id = c.teacher_id;



--------- LEFT JOIM WHERE 



SELECT
    s.username AS staff
FROM staffs s
LEFT JOIN students st ON st.staff_id = s.id
WHERE st.id IS NULL;




