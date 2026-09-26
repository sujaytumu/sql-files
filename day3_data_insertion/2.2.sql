use product_db;

select * from products;


-- A) INSERT.............

-- PRD-I1
-- Insert the cable using a single-row statement

insert into products
(sku, product_name, category, brand, unit_price, quantity_in_stock,
 reorder_level, manufacture_date, expiry_date, product_status)
values
('SKU-CBL-001', 'USB-C Cable', 'Accessories', 'TechLine', 399.00, 50,
 10, NULL, NULL, 'ACTIVE');

select * from products;


-- PRD-I2
-- Insert keyboard and juice using one multi-row statement

insert into products
(sku, product_name, category, brand, unit_price, quantity_in_stock,
 reorder_level, manufacture_date, expiry_date, product_status)
values
('SKU-KBD-002', 'Wireless Keyboard', 'Accessories', 'KeyPro', 1499.00, 8,
 5, '2026-01-15', NULL, 'ACTIVE'),

('SKU-JCE-003', 'Orange Juice', 'Beverages', 'FreshDrop', 120.00, 0,
 20, '2026-09-01', '2026-12-01', 'OUT_OF_STOCK');

select * from products;


-- PRD-I3
-- Insert notebook and discontinued adapter using one multi-row statement

insert into products
(sku, product_name, category, brand, unit_price, quantity_in_stock,
 reorder_level, manufacture_date, expiry_date, product_status)
values
('SKU-NTB-004', 'A5 Notebook', 'Stationery', 'PaperNest', 75.00, 120,
 25, NULL, NULL, 'ACTIVE'),

('SKU-OLD-005', 'Legacy Adapter', 'Accessories', 'WireMax', 299.00, 0,
 0, NULL, NULL, 'DISCONTINUED');

select * from products;


-- PRD-I4
-- Attempt to insert a product having a negative price

insert into products
(sku, product_name, category, brand, unit_price, quantity_in_stock,
 reorder_level, manufacture_date, expiry_date, product_status)
values
('SKU-NEG-006', 'Test Product', 'Accessories', 'TechLine', -100.00, 10,
 5, NULL, NULL, 'ACTIVE');

select * from products;


-- PRD-I5
-- Attempt to insert a product whose expiry date is
-- earlier than its manufacture date

insert into products
(sku, product_name, category, brand, unit_price, quantity_in_stock,
 reorder_level, manufacture_date, expiry_date, product_status)
values
('SKU-DATE-007', 'Test Product', 'Beverages', 'FreshDrop', 100.00, 10,
 5, '2026-12-01', '2026-09-01', 'ACTIVE');

select * from products;


-- PRD-I6
-- Attempt to insert another product using SKU-CBL-001

insert into products
(sku, product_name, category, brand, unit_price, quantity_in_stock,
 reorder_level, manufacture_date, expiry_date, product_status)
values
('SKU-CBL-001', 'USB-C Cable New', 'Accessories', 'TechLine', 499.00, 20,
 5, NULL, NULL, 'ACTIVE');

select * from products;


-- B) UPDATE.............


-- PRD-U1
-- Add 60 units to juice stock and change status to ACTIVE

select * from products
where sku = 'SKU-JCE-003';

update products
set quantity_in_stock = quantity_in_stock + 60,
    product_status = 'ACTIVE'
where sku = 'SKU-JCE-003';

select * from products
where sku = 'SKU-JCE-003';


-- PRD-U2
-- Increase price of every Accessories product by 5%

select * from products
where category = 'Accessories';

update products
set unit_price = round(unit_price * 1.05, 2)
where category = 'Accessories';

select * from products
where category = 'Accessories';


-- PRD-U3
-- Set notebook brand to NULL

select * from products
where sku = 'SKU-NTB-004';

update products
set brand = NULL
where sku = 'SKU-NTB-004';

select * from products
where sku = 'SKU-NTB-004';


-- PRD-U4
-- Set reorder level to 15 for active products
-- having fewer than 10 units in stock

select * from products
where product_status = 'ACTIVE'
and quantity_in_stock < 10;

update products
set reorder_level = 15
where product_status = 'ACTIVE'
and quantity_in_stock < 10;

select * from products
where product_status = 'ACTIVE'
and quantity_in_stock < 10;


-- PRD-U5
-- Attempt to set a product's stock quantity to -1

select * from products
where sku = 'SKU-KBD-002';

update products
set quantity_in_stock = -1
where sku = 'SKU-KBD-002';

select * from products
where sku = 'SKU-KBD-002';


-- C) DELETE.............


-- PRD-D1
-- Preview and delete the product identified by SKU-OLD-005

select * from products
where sku = 'SKU-OLD-005';

delete from products
where sku = 'SKU-OLD-005';

select * from products;


-- PRD-D2
-- Insert temporary product

insert into products
(sku, product_name, category, brand, unit_price, quantity_in_stock,
 reorder_level, manufacture_date, expiry_date, product_status)
values
('SKU-TEMP-999', 'Temporary Product', 'Accessories', 'TechLine', 100.00, 10,
 5, NULL, NULL, 'ACTIVE');

select * from products
where sku = 'SKU-TEMP-999';


-- Delete temporary product using SKU

delete from products
where sku = 'SKU-TEMP-999';

select * from products;