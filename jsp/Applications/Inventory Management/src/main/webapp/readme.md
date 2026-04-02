# 📦 Smart Inventory Manager

A lightweight, web-based **Inventory Management System** built using **Java Server Pages (JSP)** and **JDBC**. This application allows users to track stock levels, manage product categories, and monitor pricing in real-time with a clean, responsive interface.

---

## 🚀 Features
* **Real-time CRUD:** Add, View, and Delete products instantly.
* **Inventory Alerts:** Visual badges for "Low Stock" (Red) vs "In Stock" (Green).
* **Responsive Design:** Fully compatible with mobile and desktop via **Bootstrap 5**.
* **Secure Queries:** Uses `PreparedStatement` to prevent SQL Injection.
* **Persistent Storage:** Powered by a **MySQL** relational database.

---

## 🛠️ Tech Stack
* **Frontend:** HTML5, CSS3, Bootstrap 5, Bootstrap Icons.
* **Backend:** Java Server Pages (JSP).
* **Database:** MySQL 8.0+.
* **Server:** Apache Tomcat 9.0+.
* **Connector:** MySQL Connector/J.

---

## ⚙️ Setup & Installation

### 1. Database Setup
First, create the database and table in your MySQL instance:

```sql
CREATE DATABASE projects;
USE projects;

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    quantity INT DEFAULT 0,
    price DECIMAL(10, 2) DEFAULT 0.00
);
