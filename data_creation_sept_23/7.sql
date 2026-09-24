create table vehicles (
    vehicle_id int primary key auto_increment,
    registration_number varchar(20) not null,
    owner_name varchar(120) not null,
    manufacturer varchar(80) not null,
    model varchar(80) not null,
    vehicle_type varchar(20) not null,
    fuel_type varchar(20) not null,
    manufacture_year year not null,
    purchase_date date,
    color varchar(40) not null,
    odometer_km int not null default 0,
    insurance_expiry date,
    vehicle_status varchar(20) not null default 'ACTIVE',
    created_at timestamp not null default current_timestamp,

    constraint `uq_registration_number`
        unique (registration_number),

    constraint `chk_vehicle_type`
        check(vehicle_type in ('CAR', 'MOTORCYCLE', 'TRUCK', 'VAN', 'BUS')),

    constraint `chk_fuel_type`
        check(fuel_type in ('PETROL', 'DIESEL', 'ELECTRIC', 'HYBRID', 'CNG')),

    constraint `chk_odometer_km`
        check(odometer_km >= 0),

    constraint `chk_vehicle_status`
        check(vehicle_status in ('ACTIVE', 'IN_SERVICE', 'SOLD', 'SCRAPPED'))
);



insert into vehicles
(registration_number, owner_name, manufacturer, model,
 vehicle_type, fuel_type, manufacture_year, purchase_date,
 color, odometer_km, insurance_expiry, vehicle_status)
values
('AP39AB1234', 'Sujay Babu', 'Toyota', 'Fortuner',
 'CAR', 'DIESEL', 2024, null,
 'White', 15000, null, 'ACTIVE');