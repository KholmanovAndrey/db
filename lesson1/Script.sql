create database geekbrains_db;
use geekbrains_db;
/*
Ctrl+Space - ���������
Alt+X - ��������� ��� ��� ����������
Ctrl+Enter - ��������� ��������� ��� ��������
Ctrl+PgUp / Ctrl+PgDn - ��������� ����� ���������
*/

--- ������� DDL
create table courses (
	id INT auto_increment not null primary key,
	name VARCHAR(150) unique
);

create table students (
	id INT auto_increment not null primary key,
	firstname VARCHAR(150) not null,
	lastname VARCHAR(150) not null,
	email VARCHAR(150) unique,
	course_id INT
);

-- ���������� ����� � �������
alter table students
add column birthday date;

-- ��������� ����� � �������
ALTER TABLE geekbrains_db.students 
CHANGE birthday birthday1 date NULL;

-- �������� ����� � �������
alter table students
drop column birthday;

-- �������� �������
drop table students;

-- �������� ���� ������
drop database geekbrains_db;


--- ������� DML data maniputation language
-- CRUD
insert into courses (name) values
("databases"),
("linux"),
("bigdata");

select * from courses;

update courses
set name = 'jkk'
where id = 1;

delete from courses
where id = 1;

delete from courses;