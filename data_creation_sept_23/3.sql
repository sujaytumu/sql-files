create table customers (
    customer_id int primary key auto_increment,
    customer_code varchar(12) not null,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(120) not null,
    phone varchar(15),
    date_of_birth date,
    city varchar(80) not null,
    state varchar(80) not null,
    postal_code varchar(12) not null,
    customer_type varchar(15) not null default 'REGULAR',
    credit_limit decimal(12,2) not null default 0.00,
    is_active boolean not null default true,
    registered_at timestamp not null default current_timestamp,

    constraint `uq_customer_code` unique (customer_code),
    constraint `uq_email` unique (email),
    constraint `uq_phone` unique (phone),

    constraint `chk_customer_type`
        check(customer_type in ('REGULAR', 'PREMIUM', 'CORPORATE')),

    constraint `chk_credit_limit`
        check(credit_limit >= 0)
);



insert into customers
(customer_code, first_name, last_name, email, phone,
 date_of_birth, city, state, postal_code)
values
('CUS001', 'Sujay', 'Babu', 'sujay@gmail.com', null,
 '2004-12-14', 'Hyderabad', 'Andhra', '500001');