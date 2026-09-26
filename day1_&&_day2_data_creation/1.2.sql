create database product_db;
use product_db;

-- query

CREATE TABLE products (
    product_id INT AUTO_INCREMENT,
    sku VARCHAR(20) NOT NULL,
    product_name VARCHAR(150) NOT NULL,
    category VARCHAR(80) NOT NULL,
    brand VARCHAR(80),
    unit_price DECIMAL(12,2) NOT NULL,
    quantity_in_stock INT UNSIGNED NOT NULL DEFAULT 0,
    reorder_level INT UNSIGNED NOT NULL DEFAULT 5,
    manufacture_date DATE,
    expiry_date DATE,
    product_status VARCHAR(15) NOT NULL DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT pk_products
        PRIMARY KEY (product_id),

    CONSTRAINT uq_products_sku
        UNIQUE (sku),

    CONSTRAINT chk_products_unit_price
        CHECK (unit_price > 0),

    CONSTRAINT chk_products_dates
        CHECK (
            manufacture_date IS NULL
            OR expiry_date IS NULL
            OR expiry_date >= manufacture_date
        ),

    CONSTRAINT chk_products_status
        CHECK (
            product_status IN (
                'ACTIVE',
                'OUT_OF_STOCK',
                'DISCONTINUED'
            )
        )
);

-- insert

INSERT INTO products (sku, product_name, category, brand, unit_price, quantity_in_stock, reorder_level, manufacture_date, expiry_date, product_status)
VALUES ('SKU-001', 'Wireless Mouse', 'Electronics', 'Logitech', 799.00, 50, 5, '2026-01-10', '2028-01-10', 'ACTIVE');

INSERT INTO products (sku, product_name, category, brand, unit_price, quantity_in_stock, reorder_level, manufacture_date, expiry_date, product_status)
VALUES ('SKU-002', 'Office Chair', 'Furniture', 'GreenSoul', 5999.00, 20, 5, '2026-02-15', NULL, 'ACTIVE');

INSERT INTO products (sku, product_name, category, brand, unit_price, quantity_in_stock, reorder_level, product_status)
VALUES ('SKU-003', 'Keyboard', 'Electronics', 'HP', -500.00, 10, 5, 'ACTIVE');
      
      
      
      
      
      
      