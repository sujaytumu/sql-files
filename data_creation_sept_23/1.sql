create database student_db;
use student_db; -- select this db.... " -- " mentions comments

create table student (
    student_id int primary key auto_increment,
    admission_number varchar(15) not null, -- admission_number varchar(15) unique,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(120) not null,  -- email varchar(120) unique,
    phone varchar(15),  -- can be null
    date_of_birth date not null,
    program_name varchar(100) not null,
    admission_date date not null,
    cgpa DECIMAL(4,2) not null,    -- cgpa DECIMAL(4,2) CHECK (cgpa >= 0.00 AND cgpa <= 10.00)
    student_status varchar(15) not null default 'Active',
    created_at TIMESTAMP not null default current_timestamp,
    updated_at TIMESTAMP not null default current_timestamp,
    
    constraint `uq_admission_number` unique (admission_number),
    constraint `uq_email` unique (email),
    constraint `chk_cgpa` check(cgpa between 0.00 and 10.00)
    
);

drop table student; -- drop emans tabel dleeted...so do new table stduent( but stdnet_db exists)


SELECT * FROM  STUDENT;

insert into student (student_id, admission_number, first_name, last_name, email, phone, date_of_birth, 
                    program_name, admission_date, cgpa, student_status)
values(1, 'cgh4011', 'sujay', 'babu', 'sujaybabutumu', 7396359103, '2004-12-14', 'jfs', '2026-07-24', 7.50, 'Active');

    

