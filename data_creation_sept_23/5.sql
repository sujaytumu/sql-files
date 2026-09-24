create table patients (
    patient_id int primary key auto_increment,
    patient_number varchar(15) not null,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    date_of_birth date not null,

    biological_sex enum(
        'FEMALE',
        'MALE',
        'INTERSEX',
        'NOT_DISCLOSED'
    ) not null,

    blood_group enum(
        'A+',
        'A-',
        'B+',
        'B-',
        'AB+',
        'AB-',
        'O+',
        'O-'
    ),

    phone varchar(15) not null,
    email varchar(120),
    emergency_contact_name varchar(100) not null,
    emergency_contact_phone varchar(15) not null,
    allergies text,
    patient_status varchar(20) not null default 'ACTIVE',
    registered_at timestamp not null default current_timestamp,

    constraint `uq_patient_number`
        unique (patient_number),

    constraint `chk_patient_status`
        check(patient_status in ('ACTIVE', 'INACTIVE', 'DECEASED'))
);


insert into patients
(patient_number, first_name, last_name, date_of_birth,
 biological_sex, blood_group, phone, email,
 emergency_contact_name, emergency_contact_phone,
 allergies, patient_status)
values
('PAT1001', 'Sujay', 'Babu', '2004-12-14',
 'MALE', 'O+', '9876543210', 'sujay@example.com',
 'Ravi Babu', '9876500000',
 'None', 'ACTIVE');