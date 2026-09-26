create database product_db;
use product_db;

create table product (
      product_id int primary key auto_increment,
      sku varchar(50) unique,
      product_name varchar(50),
      category varchar(50),
      brand varchar(50),
      unit_price varchar(50),
      quantity_in_stock varchar(50) default 0,
      reorder_level varchar(50) default 5,
      manufacture_date date,
      expiry_date date,
      product_status varchar(15) default 'Active',
      
      -- business rules
      
      constraint `chk_unit_price` check(unit_price > 0),
      constraint `chk_quantity_in_stock` check(quantity_in_stock >= 0),
      constraint `chk_reorder_level` check(reorder_level >= 0)

);


      
      
      
      
      
      
      
      