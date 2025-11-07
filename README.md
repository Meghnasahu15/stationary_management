# Stationery Shop SQL project

For a stationery shop SQL project, you will need to design tables that capture various aspects of the business: inventory, customers, suppliers, sales, purchases, and invoices. Below is a list of potential tables and their relationships, ensuring all the typical operations of a stationery shop are covered.

### 1. **Customers Table**
This table will store information about the customers of the shop.









| Column Name   | Data Type    | Description                        |
|---------------|--------------|------------------------------------|
| `customer_id` | INT (PK)     | Unique identifier for the customer |
| `name`        | VARCHAR(100) | Customer's full name               |
| `email`       | VARCHAR(100) | Customer's email address           |
| `phone`       | VARCHAR(15)  | Customer's phone number            |
| `address`     | TEXT         | Customer's shipping address        |

### 2. **Suppliers Table**
This table will store details of suppliers who provide stock to the shop.

| Column Name    | Data Type    | Description                        |
|----------------|--------------|------------------------------------|
| `supplier_id`  | INT (PK)     | Unique identifier for the supplier |
| `name`         | VARCHAR(100) | Supplier's full name               |
| `contact_name` | VARCHAR(100) | Contact person at the supplier     |
| `phone`        | VARCHAR(15)  | Supplier's phone number            |
| `email`        | VARCHAR(100) | Supplier's email address           |
| `address`      | TEXT         | Supplier's address                 |

### 3. **Products Table**
This table will store details about all products available for sale.

| Column Name    | Data Type    | Description                            |
|----------------|--------------|----------------------------------------|
| `product_id`   | INT (PK)     | Unique identifier for the product      |
| `name`         | VARCHAR(100) | Name of the product                    |
| `description`  | TEXT         | Description of the product             |
| `category`     | VARCHAR(50)  | Category of the product (e.g., pen, notebook) |
| `price`        | DECIMAL(10, 2) | Price of the product                 |
| `stock_quantity` | INT        | Quantity of the product in stock       |
| `supplier_id`  | INT (FK)     | Reference to the supplier (relationship with `Suppliers` table) |

### 4. **Sales Table**
This table will store details of sales made to customers.

| Column Name   | Data Type     | Description                                |
|---------------|---------------|--------------------------------------------|
| `sale_id`     | INT (PK)      | Unique identifier for the sale             |
| `customer_id` | INT (FK)      | Reference to the customer (relationship with `Customers` table) |
| `sale_date`   | DATE          | Date of the sale                          |
| `total_amount`| DECIMAL(10, 2)| Total amount of the sale                  |

### 5. **Sale_Items Table**
This table will store details of each product sold in a sale, as a many-to-many relationship between `Sales` and `Products`.

| Column Name   | Data Type     | Description                            |
|---------------|---------------|----------------------------------------|
| `sale_id`     | INT (FK)      | Reference to the sale                  |
| `product_id`  | INT (FK)      | Reference to the product               |
| `quantity`    | INT           | Quantity of the product sold           |
| `price_at_sale`| DECIMAL(10, 2)| Price of the product at the time of sale |

### 6. **Purchases Table**
This table will store details of purchases made from suppliers to restock inventory.

| Column Name    | Data Type    | Description                             |
|----------------|--------------|-----------------------------------------|
| `purchase_id`  | INT (PK)     | Unique identifier for the purchase      |
| `supplier_id`  | INT (FK)     | Reference to the supplier               |
| `purchase_date`| DATE         | Date of the purchase                    |
| `total_amount` | DECIMAL(10, 2)| Total cost of the purchase              |

### 7. **Purchase_Items Table**
This table will store details of each product purchased, as a many-to-many relationship between `Purchases` and `Products`.

| Column Name    | Data Type    | Description                             |
|----------------|--------------|-----------------------------------------|
| `purchase_id`  | INT (FK)     | Reference to the purchase               |
| `product_id`   | INT (FK)     | Reference to the product                |
| `quantity`     | INT          | Quantity of the product purchased       |
| `price_at_purchase` | DECIMAL(10, 2) | Price of the product at purchase |

### 8. **Invoices Table**
This table will store invoice details for customer purchases.

| Column Name    | Data Type    | Description                             |
|----------------|--------------|-----------------------------------------|
| `invoice_id`   | INT (PK)     | Unique identifier for the invoice       |
| `sale_id`      | INT (FK)     | Reference to the sale                   |
| `invoice_date` | DATE         | Date of the invoice                     |
| `amount_due`   | DECIMAL(10, 2)| Total amount due                       |

### 9. **Payments Table**
This table will store payment details from customers.

| Column Name    | Data Type    | Description                             |
|----------------|--------------|-----------------------------------------|
| `payment_id`   | INT (PK)     | Unique identifier for the payment       |
| `invoice_id`   | INT (FK)     | Reference to the invoice                |
| `payment_date` | DATE         | Date of the payment                     |
| `amount_paid`  | DECIMAL(10, 2)| Amount paid                            |

---

### Relationships Between Tables:
1. **Customers** and **Sales**: One-to-Many relationship. A customer can have multiple sales.
2. **Suppliers** and **Products**: One-to-Many relationship. A supplier can supply multiple products.
3. **Sales** and **Sale_Items**: One-to-Many relationship. A sale can include multiple products.
4. **Products** and **Sale_Items**: One-to-Many relationship. A product can be part of multiple sales.
5. **Suppliers** and **Purchases**: One-to-Many relationship. A supplier can have multiple purchases.
6. **Purchases** and **Purchase_Items**: One-to-Many relationship. A purchase can include multiple products.
7. **Products** and **Purchase_Items**: One-to-Many relationship. A product can be part of multiple purchases.
8. **Sales** and **Invoices**: One-to-One relationship. Each sale has one invoice.
9. **Invoices** and **Payments**: One-to-One relationship. Each invoice can have one payment.



This schema will allow you to track customers, products, suppliers, sales, purchases, invoices, and payments efficiently.
