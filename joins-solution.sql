-- Get all customers and their addresses
SELECT * FROM "customers"
JOIN "addresses" ON "addresses"."customer_id" = "customers"."id";

-- Get all orders and their line items (orders, quantity and product).
SELECT * FROM "orders"
JOIN "line_items" ON "line_items"."order_id" = "orders"."id";

-- Which warehouses have cheetos?
SELECT "warehouse"."warehouse" FROM "warehouse"
JOIN "warehouse_product" ON "warehouse_product"."warehouse_id" = "warehouse"."id"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" = 'cheetos';

-- Which warehouses have diet pepsi?
SELECT "warehouse"."warehouse" FROM "warehouse"
JOIN "warehouse_product" ON "warehouse_product"."warehouse_id" = "warehouse"."id"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" = 'diet pepsi';

-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers", count("orders"."id") AS "order count" FROM "customers"
JOIN "addresses" ON "addresses"."customer_id" = "customers"."id"
JOIN "orders" ON "orders"."address_id" = "addresses"."id"
GROUP BY "customers";

-- How many customers do we have?
SELECT count(*) FROM "customers";

--How many products do we carry?
SELECT count(*) FROM "products";


