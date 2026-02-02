
CREATE DATABASE stationery_shop;
USE stationery_shop;



CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    address TEXT
);

CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    contact_name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    address TEXT
);






CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);


  
CREATE TABLE Sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    sale_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


  
CREATE TABLE Sale_Items (
    sale_id INT,
    product_id INT,
    quantity INT,
    price_at_sale DECIMAL(10, 2),
    PRIMARY KEY (sale_id, product_id),
    FOREIGN KEY (sale_id) REFERENCES Sales(sale_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);



CREATE TABLE Purchases (
    purchase_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT,
    purchase_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);



CREATE TABLE Purchase_Items (
    purchase_id INT,
    product_id INT,
    quantity INT,
    price_at_purchase DECIMAL(10, 2),
    PRIMARY KEY (purchase_id, product_id),
    FOREIGN KEY (purchase_id) REFERENCES Purchases(purchase_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);



CREATE TABLE Invoices (
    invoice_id INT AUTO_INCREMENT PRIMARY KEY,
    sale_id INT,
    invoice_date DATE,
    amount_due DECIMAL(10, 2),
    FOREIGN KEY (sale_id) REFERENCES Sales(sale_id)
);



CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_id INT,
    payment_date DATE,
    amount_paid DECIMAL(10, 2),
    FOREIGN KEY (invoice_id) REFERENCES Invoices(invoice_id)
);
