create table books (
    book_id int primary key auto_increment,
    isbn char(13) not null,
    title varchar(200) not null,
    author_name varchar(120) not null,
    genre varchar(60) not null,
    publisher varchar(120),
    publication_year smallint not null,
    page_count int not null,
    book_format varchar(20) not null,
    price decimal(10,2) not null,
    copies_available int not null,
    language varchar(40) not null default 'English',
    added_at timestamp not null default current_timestamp,

    constraint `uq_isbn` unique (isbn),

    constraint `chk_publication_year`
        check(publication_year between 1000 and 2100),

    constraint `chk_page_count`
        check(page_count > 0),

    constraint `chk_price`
        check(price >= 0),

    constraint `chk_copies_available`
        check(copies_available >= 0),

    constraint `chk_book_format`
        check(book_format in ('HARDCOVER', 'PAPERBACK', 'EBOOK'))
);


insert into books
(isbn, title, author_name, genre, publisher, publication_year,
 page_count, book_format, price, copies_available, language)
values
('9781234567890', 'Java Basics', 'James Smith', 'Programming',
 'Tech Books', 2024, 350, 'PAPERBACK', 599.00, 20, 'English');


