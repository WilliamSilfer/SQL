#------------------CREATING DATABASE AND INSERT ROWS---------------------#
CREATE DATABASE dannys_diner;
USE dannys_diner;

CREATE TABLE sales (
customer_id VARCHAR(1),
order_date DATE,
product_id INTEGER);

INSERT INTO sales(customer_id, order_date, product_id)
VALUES
  ('A', '2021-01-01', '1'),
  ('A', '2021-01-01', '2'),
  ('A', '2021-01-07', '2'),
  ('A', '2021-01-10', '3'),
  ('A', '2021-01-11', '3'),
  ('A', '2021-01-11', '3'),
  ('B', '2021-01-01', '2'),
  ('B', '2021-01-02', '2'),
  ('B', '2021-01-04', '1'),
  ('B', '2021-01-11', '1'),
  ('B', '2021-01-16', '3'),
  ('B', '2021-02-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-07', '3');

CREATE TABLE menu (product_id INTEGER,
product_name VARCHAR(5),
price INTEGER);

INSERT INTO menu
  (product_id, product_name, price)
VALUES
  ('1', 'sushi', '10'),
  ('2', 'curry', '15'),
  ('3', 'ramen', '12');
  
CREATE TABLE members(customer_id VARCHAR(1),
 join_date DATE);

INSERT INTO members
  (customer_id, join_date)
VALUES
  ('A', '2021-01-07'),
  ('B', '2021-01-09');
  
#-------------------------------------Consultas-------------------------------------#
# 1 - What is the total amount each customer spent at the restaurant?
SELECT SALES.customer_id, sum(MENU.price)
FROM SALES
JOIN MENU
ON SALES.product_id = MENU.product_id
group by sales.customer_id;

# 2 - How many days has each customer visited the restaurant?
SELECT DISTINCT(order_date), count(customer_id) from sales;

# 3 - What was the first item from the menu purchased by each customer?
SELECT distinct(customer_id), product_id, order_date from sales
GROUP BY customer_id;  

# 4 - What is the most purchased item on the menu and how many times was it purchased by all customers?
SELECT DISTINCT product_id AS Most_Purchased, count(product_id) as Many_purchased from sales 
GROUP BY product_id 
ORDER BY product_id desc LIMIT 1;

-- A Consulta a seguir lista o total de repeticoes de cada item do {product_id}
SELECT customer_id, product_id, COUNT(*) AS TOTAL_REPETICOES from sales
    GROUP BY customer_id, product_id;
    
# 5 - Which item was the most popular for each customer?
SELECT   customer_id,product_id,  COUNT(*) as TOTAL_REPETICOES from sales 
GROUP BY customer_id, product_id
HAVING COUNT(*) = (
SELECT MAX(repeticoes_por_cliente)
FROM (
SELECT customer_id, product_id, COUNT(*) AS repeticoes_por_cliente
FROM sales
GROUP BY customer_id, product_id
) AS subquery
WHERE subquery.customer_id  = sales.customer_id);

# 6 - Which item was purchased first by the customer after they became a member?
SELECT customer_id, product_id, order_date
FROM (
	SELECT customer_id, product_id, order_date,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS row_num 
    FROM sales
) subquery
WHERE row_num = 1;

-- Esta consulta contém de forma tabular: {customer_id, order_date,product_name, membro} --
SELECT s.customer_id, s.order_date, menu.product_name,
	CASE WHEN (s.order_date  >= '2021-01-07') AND (s.customer_id = m.customer_id) THEN 'Y' 
		ELSE 'N'
	END AS Membro
FROM members m
RIGHT  JOIN SALES s ON s.customer_id = m.customer_id
JOIN menu ON s.product_id = menu.product_id
;



-- Complemento da questão 7 --
SELECT s.customer_id, s.order_date, menu.product_name,
	CASE WHEN (s.order_date  >= '2021-01-07') AND (s.customer_id = m.customer_id) THEN 'Y' 
		ELSE 'N'
	END AS Membro
FROM members m
RIGHT  JOIN SALES s ON s.customer_id = m.customer_id
JOIN menu ON s.product_id = menu.product_id
;



# 7 - Which item was purchased just before the customer became a member?
SELECT customer_id, product_id, order_date
FROM ( SELECT customer_id, product_id, order_date, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date desc) AS row_num
	FROM sales
    ) subquery
    WHERE row_num = 1;


