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
  