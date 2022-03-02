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

-- What is the total available on-hand quantity of diet pepsi?
SELECT "products"."description", SUM("warehouse_product"."on_hand") FROM "products"
JOIN "warehouse_product" ON "warehouse_product"."product_id" = "products"."id"
WHERE "products"."description" = 'diet pepsi'
GROUP BY "products"."description";

-- How much was the total cost for each order?
SELECT "orders"."id", SUM("line_items"."quantity" * "products"."unit_price") AS "Order Total" FROM "orders"
JOIN "line_items" ON "line_items"."order_id" = "orders"."id"
JOIN "products" ON "products"."id" = "line_items"."product_id"
GROUP BY "orders"."id";

-- How much has each customer spent in total?
SELECT "customers", SUM("line_items"."quantity" * "products"."unit_price") FROM "orders"
JOIN "line_items" ON "line_items"."order_id" = "orders"."id"
JOIN "products" ON "products"."id" = "line_items"."product_id"
JOIN "addresses" ON "addresses"."id" = "orders"."address_id"
JOIN "customers" ON "customers"."id" = "addresses"."customer_id"
GROUP BY "customers";







