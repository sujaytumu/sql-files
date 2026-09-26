use product_db;

select * from student;

-- A) INSERT.............

-- stu-i1
insert into student
(admission_number, first_name, last_name, email, phone, date_of_birth,
 program_name, admission_date, cgpa, student_status)
values
('STU26C001', 'Ananya', 'Rao', 'ananya.rao@example.test', '9876501001',
 '2007-04-18', 'BSc Computer Science', '2026-07-01', 8.40, 'ACTIVE');
select * from student;


-- stu-i2
insert into student
(admission_number, first_name, last_name, email, phone, date_of_birth,
 program_name, admission_date, cgpa, student_status)
values
('STU26C002', 'Vivaan', 'Sharma', 'vivaan.sharma@example.test', NULL,
 '2006-12-09', 'BCom', '2026-07-01', 7.75, 'ACTIVE');

select * from student;


-- stu-i3

insert into student
(admission_number, first_name, last_name, email, phone, date_of_birth,
 program_name, admission_date, cgpa, student_status)
values
('STU26C003', 'Diya', 'Nair', 'diya.nair@example.test', '9876501003',
 '2007-02-25', 'BA Economics', '2026-07-02', 9.10, 'ACTIVE'),

('STU25C004', 'Kabir', 'Singh', 'kabir.singh@example.test', '9876501004',
 '2006-08-14', 'BSc Mathematics', '2025-07-01', 6.85, 'SUSPENDED'),

('STU24C005', 'Tara', 'Bose', 'tara.bose@example.test', '9876501005',
 '2005-09-30', 'BA History', '2024-07-01', 5.90, 'DROPPED');

select * from student;

-- stu-i4

insert into student
(admission_number, first_name, last_name, email, phone, date_of_birth,
 program_name, admission_date, cgpa, student_status)
values
('STU26C006', 'Test', 'User', 'ananya.rao@example.test', '9876501006',
 '2007-01-01', 'BSc Computer Science', '2026-07-01', 8.00, 'ACTIVE');

select * from student;

-- stu-i5

-- a) cgpa
insert into student
(admission_number, first_name, last_name, email, phone, date_of_birth,
 program_name, admission_date, cgpa, student_status)
values
('STU26C007', 'Test', 'CGPA', 'test.cgpa@example.test', '9876501007',
 '2007-01-01', 'BSc Computer Science', '2026-07-01', 10.50, 'ACTIVE');

select * from student;

-- b) invalid status

insert into student
(admission_number, first_name, last_name, email, phone, date_of_birth,
 program_name, admission_date, cgpa, student_status)
values
('STU26C008', 'Test', 'Status', 'test.status@example.test', '9876501008',
 '2007-01-01', 'BSc Computer Science', '2026-07-01', 8.00, 'TRANSFERRED');

select * from student;




-- B) UPDATE.............

-- STU-U1
select * from student
where admission_number = 'STU26C001';

update student
set cgpa = 8.65
where admission_number = 'STU26C001';

select * from student
where admission_number = 'STU26C001';

-- STU-U2
select * from student
where program_name = 'BSc Computer Science'
and student_status = 'ACTIVE';

update student
set cgpa = least(cgpa + 0.20, 10.00)
where program_name = 'BSc Computer Science'
and student_status = 'ACTIVE';

select * from student
where program_name = 'BSc Computer Science'
and student_status = 'ACTIVE';

-- STU-U3
select * from student
where admission_number = 'STU25C004';

update student
set student_status = 'ACTIVE'
where admission_number = 'STU25C004';

select * from student
where admission_number = 'STU25C004';

-- STU-U4

select * from student
where program_name = 'BCom';

update student
set program_name = 'BCom Finance'
where program_name = 'BCom';

select * from student;

-- STU-U5

update student
set email = 'ananya.rao@example.test'
where admission_number = 'STU26C003';

select * from student
where admission_number = 'STU26C003';


--  C) DELETE

-- STU-D1
select * from student
where student_status = 'DROPPED';

delete from student
where student_status = 'DROPPED';

select * from student;


-- STU-D2

insert into student
(admission_number, first_name, last_name, email, phone, date_of_birth,
 program_name, admission_date, cgpa, student_status)
values
('STU-TEMP-001', 'Temporary', 'Student', 'temp.student@example.test', NULL,
 '2007-01-01', 'BSc Computer Science', '2026-07-01', 7.00, 'ACTIVE');

select * from student
where admission_number = 'STU-TEMP-001';

delete from student
where admission_number = 'STU-TEMP-001';

select * from student;





