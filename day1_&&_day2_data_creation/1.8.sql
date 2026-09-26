create table hotel_rooms (
    room_id int primary key auto_increment,
    room_number varchar(10) not null,
    room_type varchar(20) not null,
    floor_number smallint not null,
    bed_count tinyint not null,
    max_occupancy tinyint not null,
    price_per_night decimal(10,2) not null,
    availability_status varchar(20) not null default 'AVAILABLE',
    has_air_conditioning boolean not null default true,
    smoking_allowed boolean not null default false,
    notes varchar(255),
    created_at timestamp not null default current_timestamp,
    updated_at timestamp not null default current_timestamp on update current_timestamp,

    constraint `uq_room_number`
        unique (room_number),

    constraint `chk_room_type`
        check(room_type in ('SINGLE', 'DOUBLE', 'DELUXE', 'SUITE')),

    constraint `chk_bed_count`
        check(bed_count >= 1),

    constraint `chk_max_occupancy`
        check(max_occupancy >= 1),

    constraint `chk_price_per_night`
        check(price_per_night > 0),

    constraint `chk_availability_status`
        check(availability_status in ('AVAILABLE', 'RESERVED', 'OCCUPIED', 'MAINTENANCE'))
);


insert into hotel_rooms
(room_number, room_type, floor_number, bed_count,
 max_occupancy, price_per_night, availability_status,
 has_air_conditioning, smoking_allowed, notes)
values
('101', 'DELUXE', 1, 2,
 3, 3500.00, 'AVAILABLE',
 true, false, 'Sea view room');