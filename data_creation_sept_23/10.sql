create table support_tickets (
    ticket_id int primary key auto_increment,
    ticket_number varchar(20) not null,
    requester_name varchar(120) not null,
    requester_email varchar(120) not null,
    subject varchar(200) not null,
    description text not null,
    category varchar(20) not null,
    priority varchar(20) not null default 'MEDIUM',
    ticket_status varchar(20) not null default 'OPEN',
    assigned_agent varchar(120),
    created_at timestamp not null default current_timestamp,
    resolved_at timestamp,
    last_updated_at timestamp not null default current_timestamp on update current_timestamp,

    constraint `uq_ticket_number`
        unique (ticket_number),

    constraint `chk_category`
        check(category in ('BILLING', 'TECHNICAL', 'ACCOUNT', 'GENERAL')),

    constraint `chk_priority`
        check(priority in ('LOW', 'MEDIUM', 'HIGH', 'CRITICAL')),

    constraint `chk_ticket_status`
        check(ticket_status in ('OPEN', 'IN_PROGRESS', 'RESOLVED', 'CLOSED')),

    constraint `chk_resolved_at`
        check(resolved_at is null or resolved_at >= created_at)
);



insert into support_tickets
(ticket_number, requester_name, requester_email,
 subject, description, category)
values
('TKT1001', 'Sujay Babu', 'sujay@example.com',
 'Login problem', 'Unable to login to the application.',
 'TECHNICAL');