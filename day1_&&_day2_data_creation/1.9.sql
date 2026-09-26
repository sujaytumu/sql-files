create table movies (
    movie_id int primary key auto_increment,
    movie_code varchar(12) not null,
    title varchar(200) not null,
    genre varchar(60) not null,
    original_language varchar(40) not null,
    release_date date,
    duration_minutes int not null,
    director_name varchar(120) not null,
    age_certificate varchar(20) not null default 'UNRATED',
    audience_rating decimal(3,1),
    production_budget decimal(15,2),
    catalog_status varchar(20) not null default 'UPCOMING',
    created_at timestamp not null default current_timestamp,
    updated_at timestamp not null default current_timestamp on update current_timestamp,

    constraint `uq_movie_code`
        unique (movie_code),

    constraint `chk_duration_minutes`
        check(duration_minutes > 0),

    constraint `chk_audience_rating`
        check(audience_rating is null or audience_rating between 0.0 and 10.0),

    constraint `chk_production_budget`
        check(production_budget is null or production_budget >= 0),

    constraint `chk_age_certificate`
        check(age_certificate in ('ALL_AGES', 'PARENTAL_GUIDANCE', 'ADULT', 'UNRATED')),

    constraint `chk_catalog_status`
        check(catalog_status in ('UPCOMING', 'RELEASED', 'ARCHIVED'))
);


insert into movies
(movie_code, title, genre, original_language,
 release_date, duration_minutes, director_name,
 audience_rating, production_budget, catalog_status)
values
('MOV1001', 'Future World', 'SCI-FI', 'English',
 null, 140, 'John Smith',
 null, null, 'UPCOMING');