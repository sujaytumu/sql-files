create table bank_accounts (
    account_id int primary key auto_increment,
    account_number char(12) not null,
    account_holder_name varchar(120) not null,
    account_type varchar(20) not null,
    balance decimal(15,2) not null default 0.00,
    currency_code char(3) not null default 'INR',
    branch_name varchar(100) not null,
    opened_date date not null,
    interest_rate decimal(5,2) not null default 0.00,
    overdraft_limit decimal(12,2) not null default 0.00,
    account_status varchar(20) not null default 'ACTIVE',
    created_at timestamp not null default current_timestamp,
    updated_at timestamp not null default current_timestamp on update current_timestamp,

    constraint `uq_account_number`
        unique (account_number),

    constraint `chk_account_type`
        check(account_type in ('SAVINGS', 'CURRENT', 'FIXED_DEPOSIT')),

    constraint `chk_balance`
        check(balance >= 0),

    constraint `chk_interest_rate`
        check(interest_rate between 0.00 and 100.00),

    constraint `chk_overdraft_limit`
        check(overdraft_limit >= 0),

    constraint `chk_account_status`
        check(account_status in ('ACTIVE', 'FROZEN', 'DORMANT', 'CLOSED'))
);


insert into bank_accounts
(account_number, account_holder_name, account_type, balance,
 currency_code, branch_name, opened_date, interest_rate,
 overdraft_limit, account_status)
values
('123456789012', 'Sujay Babu', 'SAVINGS', 25000.00,
 'INR', 'Hyderabad', '2026-09-24', 6.50,
 0.00, 'ACTIVE');


