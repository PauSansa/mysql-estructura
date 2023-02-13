-- Create table for provinces
CREATE TABLE provinces (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

-- Create table for cities
CREATE TABLE cities (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  province_id INT NOT NULL,
  FOREIGN KEY (province_id) REFERENCES provinces(id)
);

-- Create table for customers
CREATE TABLE customers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  address VARCHAR(200) NOT NULL,
  zip_code VARCHAR(10) NOT NULL,
  city_id INT NOT NULL,
  phone_number VARCHAR(20) NOT NULL,
  FOREIGN KEY (city_id) REFERENCES cities(id)
);

-- Create table for stores
CREATE TABLE stores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  address VARCHAR(200) NOT NULL,
  zip_code VARCHAR(10) NOT NULL,
  city_id INT NOT NULL,
  FOREIGN KEY (city_id) REFERENCES cities(id)
);

-- Create table for employees
CREATE TABLE employees (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  NIF VARCHAR(20) NOT NULL,
  phone_number VARCHAR(20) NOT NULL,
  role ENUM('cook', 'delivery') NOT NULL,
  store_id INT NOT NULL,
  FOREIGN KEY (store_id) REFERENCES stores(id)
);

-- Create table for product categories
CREATE TABLE product_categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

-- Create table for products
CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  image VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  category_id INT,
  FOREIGN KEY (category_id) REFERENCES product_categories(id)
);

-- Create table for orders
CREATE TABLE orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_time DATETIME NOT NULL,
  delivery_type ENUM('delivery', 'pickup') NOT NULL,
  total_price DECIMAL(10,2) NOT NULL,
  customer_id INT NOT NULL,
  store_id INT NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(id),
  FOREIGN KEY (store_id) REFERENCES stores(id)
);

-- Create table for order items
CREATE TABLE order_items (
id INT AUTO_INCREMENT PRIMARY KEY,
quantity INT NOT NULL,
product_id INT NOT NULL,
order_id INT NOT NULL,
FOREIGN KEY (product_id) REFERENCES products(id),
FOREIGN KEY (order_id) REFERENCES orders(id)
);