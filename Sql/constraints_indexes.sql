
-- Link Orders to Customers
ALTER TABLE olist_orders_dataset
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (customer_id) REFERENCES olist_customers_dataset(customer_id);

-- Link Order Items to Orders, Products, and Sellers
ALTER TABLE olist_order_items_dataset
ADD CONSTRAINT fk_items_orders
FOREIGN KEY (order_id) REFERENCES olist_orders_dataset(order_id),
ADD CONSTRAINT fk_items_products
FOREIGN KEY (product_id) REFERENCES olist_products_dataset(product_id),
ADD CONSTRAINT fk_items_sellers
FOREIGN KEY (seller_id) REFERENCES olist_sellers_dataset(seller_id);

-- Link Order Payments to Orders
ALTER TABLE olist_order_payments_dataset
ADD CONSTRAINT fk_payments_orders
FOREIGN KEY (order_id) REFERENCES olist_orders_dataset(order_id);

-- Link Order Reviews to Orders
ALTER TABLE olist_order_reviews_dataset
ADD CONSTRAINT fk_reviews_orders
FOREIGN KEY (order_id) REFERENCES olist_orders_dataset(order_id);


select * from olist_customers_dataset limit 5;
select * from olist_geolocation_dataset limit 5;
select count(geolocation_zip_code_prefix) from olist_geolocation_dataset;


-- Orders
CREATE INDEX IF NOT EXISTS ix_orders_order_id ON olist_orders_dataset(order_id);
CREATE INDEX IF NOT EXISTS ix_orders_customer_id ON olist_orders_dataset(customer_id);
CREATE INDEX IF NOT EXISTS ix_orders_purchase_date ON olist_orders_dataset(order_purchase_timestamp);

-- Order Items
CREATE INDEX IF NOT EXISTS ix_items_order_id ON olist_order_items_dataset(order_id);
CREATE INDEX IF NOT EXISTS ix_items_product_id ON olist_order_items_dataset(product_id);
CREATE INDEX IF NOT EXISTS ix_items_seller_id ON olist_order_items_dataset(seller_id);

-- Customers
CREATE INDEX IF NOT EXISTS ix_customers_customer_id ON olist_customers_dataset(customer_id);
CREATE INDEX IF NOT EXISTS ix_customers_state ON olist_customers_dataset(customer_state);

-- Payments
CREATE INDEX IF NOT EXISTS ix_payments_order_id ON olist_order_payments_dataset(order_id);

-- Reviews
CREATE INDEX IF NOT EXISTS ix_reviews_order_id ON olist_order_reviews_dataset(order_id);

