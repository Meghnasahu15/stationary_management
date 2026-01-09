Here is a step-by-step guide with SQL queries to create the tables, define the relationships, and implement the structure of the stationery shop project in MySQL.

### 1. **Create Database**
First, create the database for your project.
```sql
CREATE DATABASE stationery_shop;
USE stationery_shop;
```

### 2. **Create Customers Table**
This table stores the details of customers.
```sql
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    address TEXT
);
```

### 3. **Create Suppliers Table**
This table stores the details of the suppliers.
```sql
CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    contact_name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    address TEXT
);
```

### 4. **Create Products Table**
This table stores the products in the shop's inventory. It has a foreign key (`supplier_id`) that references the `Suppliers` table.
```sql
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
```

### 5. **Create Sales Table**
This table stores details of sales made to customers. It has a foreign key (`customer_id`) that references the `Customers` table.
```sql
CREATE TABLE Sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    sale_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
```

### 6. **Create Sale_Items Table**
This table handles the many-to-many relationship between `Sales` and `Products`. Each sale can involve multiple products.
```sql
CREATE TABLE Sale_Items (
    sale_id INT,
    product_id INT,
    quantity INT,
    price_at_sale DECIMAL(10, 2),
    PRIMARY KEY (sale_id, product_id),
    FOREIGN KEY (sale_id) REFERENCES Sales(sale_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
```

### 7. **Create Purchases Table**
This table stores details of purchases made from suppliers. It has a foreign key (`supplier_id`) that references the `Suppliers` table.
```sql
CREATE TABLE Purchases (
    purchase_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT,
    purchase_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);
```

### 8. **Create Purchase_Items Table**
This table handles the many-to-many relationship between `Purchases` and `Products`. Each purchase can involve multiple products.
```sql
CREATE TABLE Purchase_Items (
    purchase_id INT,
    product_id INT,
    quantity INT,
    price_at_purchase DECIMAL(10, 2),
    PRIMARY KEY (purchase_id, product_id),
    FOREIGN KEY (purchase_id) REFERENCES Purchases(purchase_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
```

### 9. **Create Invoices Table**
This table stores invoice details for sales. It has a foreign key (`sale_id`) that references the `Sales` table.
```sql
CREATE TABLE Invoices (
    invoice_id INT AUTO_INCREMENT PRIMARY KEY,
    sale_id INT,
    invoice_date DATE,
    amount_due DECIMAL(10, 2),
    FOREIGN KEY (sale_id) REFERENCES Sales(sale_id)
);
```

### 10. **Create Payments Table**
This table stores payment details for the invoices. It has a foreign key (`invoice_id`) that references the `Invoices` table.
```sql
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_id INT,
    payment_date DATE,
    amount_paid DECIMAL(10, 2),
    FOREIGN KEY (invoice_id) REFERENCES Invoices(invoice_id)
);
```

---

### Sample Insert Queries for Testing

Now, let's add some sample data into the tables.

#### 1. Inserting Data into `Customers`
```sql
INSERT INTO Customers (name, email, phone, address) 
VALUES ('John Doe', 'john@example.com', '9876543210', '123 Maple St');
```

#### 2. Inserting Data into `Suppliers`
```sql
INSERT INTO Suppliers (name, contact_name, phone, email, address) 
VALUES ('ABC Suppliers', 'Jane Smith', '1234567890', 'jane@abc.com', '456 Oak St');
```

#### 3. Inserting Data into `Products`
```sql
INSERT INTO Products (name, description, category, price, stock_quantity, supplier_id) 
VALUES ('Blue Pen', 'Smooth writing pen', 'Stationery', 10.50, 100, 1);
```

#### 4. Inserting Data into `Sales`
```sql
INSERT INTO Sales (customer_id, sale_date, total_amount) 
VALUES (1, '2024-09-19', 1050.50);
```

#### 5. Inserting Data into `Sale_Items`
```sql
INSERT INTO Sale_Items (sale_id, product_id, quantity, price_at_sale) 
VALUES (1, 1, 10, 10.50);
```

#### 6. Inserting Data into `Purchases`
```sql
INSERT INTO Purchases (supplier_id, purchase_date, total_amount) 
VALUES (1, '2024-09-18', 525.00);
```

#### 7. Inserting Data into `Purchase_Items`
```sql
INSERT INTO Purchase_Items (purchase_id, product_id, quantity, price_at_purchase) 
VALUES (1, 1, 50, 10.50);
```

#### 8. Inserting Data into `Invoices`
```sql
INSERT INTO Invoices (sale_id, invoice_date, amount_due) 
VALUES (1, '2024-09-19', 1050.50);
```

#### 9. Inserting Data into `Payments`
```sql
INSERT INTO Payments (invoice_id, payment_date, amount_paid) 
VALUES (1, '2024-09-19', 1050.50);
```

---

