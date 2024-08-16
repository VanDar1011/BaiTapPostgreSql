
CREATE DATABASE database_01_nguyenvandat
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
-- Tạo cơ sở dữ liệu : database_01_nguyenvandat
-- CODE 
CREATE TABLE database_01_nguyenvandat;
-- Tạo bảng course có cấu trúc 
-- id => Kiểu int, NOT NULL
-- name => Kiểu varchar, NOT NULL
-- price => Kiểu float
-- detail => Kiểu text
-- teacher_id => Kiểu int, NOT NULL
-- active => Kiểu int
-- created_at => Kiểu timestamp
-- updated_at => Kiểu timestamp
-- CODE
CREATE TABLE courses (
 id integer PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
 name character varying(50) NOT NULL,
 price double precision,
 detail text,
 teacher_id integer NOT NULL references teachers(id)
 active integer NOT NULL DEFAULT 1,
 created_at timestamp with time zone DEFAULT now(),
 updated_at timestamp with time zone DEFAULT now(),
);
-- Thêm description trước trường detail
CREATE TABLE courses_new (
 id integer PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
 name character varying(50) NOT NULL,
 price double precision,
 description text,
 detail text,
 teacher_id integer NOT NULL references teachers(id)
 active integer NOT NULL DEFAULT 1,
 created_at timestamp with time zone DEFAULT now(),
 updated_at timestamp with time zone DEFAULT now(),
);
-- Copy dữ liệu từ bảng courses sang bảng courses_new
INSERT INTO courses_new(id, name, detail, price, teacher_id, active, created_at, updated_at) SELECT * FROM courses;
-- Xóa bảng course 
DROP TABLE courses;
-- Thay đổi tên bảng 
ALTER TABLE courses_new to courses;
-- Thay đổi tên cột detail thành content 
ALTER TABLE courses 
RENAME COLUMN detail to context; 
-- Tạo bảng teachers có cấu trúc như sau 
-- id => Kiểu int, NOT NULL
-- name => Kiểu varchar, NOT NULL
-- bio => Kiểu text, NULL
-- created_at => Kiểu timestamp
-- updated_at => Kiểu timestamp
CREATE TABLE teacher
(
id integer PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
name character varying(50) NOT NULL,
bio text 
created_at timestamp with time zone DEFAULT now(),
updated_at timestamp with time zone DEFAULT now(),
);
-- Thêm ba giảng viên vào bảng teacher, mỗi giảng viên ba khóa học 
INSERT INTO teachers(name,bio,created_at,updated_at)
VALUES('Nguyen Thi Kieu Trang','Giảng viên fontend, kinh nghiệm 5 năm',now(),now()),
('Nguyen Thi Bich Ngoc ','Giảng viên fullstack, kinh nghiệm 3 năm',now(),now()),
('Tran Van Quan','Giảng viên backend, kinh nghiệm 9 năm',now(),now());
-- Thêm khóa học 
INSERT INTO courses(name,price,content,teacher_id,created_at,updated_at)
VALUES('HTML, CSS basic',1200000,'Khóa học html, css cơ bản', 1 , now(), now()),
('Scss basic',600000,'Khóa học scss cơ bản;, 1 , now(), now()),
('HTML, CSS pro',2200000,'Khóa học html, css pro', 1 , now(), now()),
('Boostrap Library',800000,'Css with boostrap', 2 , now(), now()),
('Javascript basic',1600000,'Khóa học javascript cơ bản', 2 , now(), now()),
('Javascript pro',2000000,'Khóa học javascript nâng cao', 2 , now(), now()),
('Backend Java',1200000,'Khóa học Backend Java', 3 , now(), now()),
('Oop Java',500000,'Khóa học Lập trình hướng đối tượng', 3 , now(), now()),
('PostgreSQL',1100000,'Khóa học cơ sở dữ liệu postgresql',3 , now(), now()),
-- Sửa tên và giá khóa học 
UPDATE courses SET name='Css with boostrap', updated_at=NOW() WHERE name='Boostrap Library'
UPDATE courses SET price=1120000, updated_at=NOW() WHERE name='Backend Java'


-- Hiển thị danh sách giảng viên, danh sách khóa học
SELECT * FROM courses
SELECT * FROM teachers




















)