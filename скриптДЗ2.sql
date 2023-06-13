USE lesson_2_db;

CREATE TABLE sales
(
	id SERIAL PRIMARY KEY,
    order_date DATE,
    count_product INT
);

INSERT INTO sales (id, order_date, count_product) VALUES
	(1, "2022-01-01", "156"),
    (2, "2022-01-02", "180"),
    (3, "2022-01-03", "21"),
    (4, "2022-01-04", "124"),
    (5, "2022-01-05", "341");
    
SELECT * FROM sales;

SELECT id AS 'id заказа',
CASE
	WHEN count_product<50 THEN 'Маленький заказ'
    WHEN count_product BETWEEN 100 AND 300 THEN 'Средний заказ'
    WHEN count_product>300 THEN 'Большой заказ'
    ELSE 'Не определено'
END AS 'Тип заказа'
FROM sales;

CREATE TABLE orders
(
	id SERIAL PRIMARY KEY,
    employee_id VARCHAR(50) NOT NULL,
    amount INT NOT NULL,
    order_status VARCHAR(50) NOT NULL
);

INSERT INTO orders (id, employee_id, amount, order_status) VALUES
	(1, 'e03', '15.00', 'OPEN'),
    (2, 'e01', '25.50', 'OPEN'),
    (3, 'e05', '100.70', 'CLOSED'),
    (4, 'e02', '22.18', 'OPEN'),
    (5, 'e04', '9.50', 'CANCELLED');
    
SELECT * FROM orders;

SELECT id, order_status,
CASE order_status
	WHEN 'OPEN' THEN 'Orders in open state'
    WHEN 'CLOSED' THEN 'Order is closed'
    WHEN 'CANCELLED' THEN 'Order is cancelled'
    ELSE 'Не указано'
END AS full_order_status
FROM orders;



  

