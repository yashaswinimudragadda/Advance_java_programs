# 💰 Personal Expense Tracker (Java Web Application)

A simple, dynamic web-based application to track daily expenses. This project uses **Java Servlets/JSP**, **JDBC**, and **MySQL** to manage data efficiently.

---

## 🏗️ Project Architecture
This project follows the **MVC (Model-View-Controller)** design pattern to keep the code organized:

1.  **Storage (MySQL):** Persistent database to store expense records.
2.  **Model (Java POJO):** Defines the structure of an 'Expense' object.
3.  **DAO (Logic):** Handles all Database operations (CRUD).
4.  **View (JSP):** The user interface built with HTML, CSS, and JSTL.

---

## 📂 Folder Structure
Here is how the project is organized in Eclipse:

```text
ExpenseTracker/
├── src/main/java/              # Backend Java Code
│   ├── dao/
│   │   └── ExpenseDAO.java      # Database logic (Select/Insert)
│   ├── model/
│   │   └── Expense.java         # Data Blueprint (Object class)
│   └── util/
│       └── DBConnection.java    # MySQL Connection helper
│
├── src/main/webapp/            # Frontend & Web Config
│   ├── WEB-INF/
│   │   └── lib/
│   │       ├── mysql-connector-j.jar  # Database Driver
│   │       └── jstl-1.2.jar           # JSTL Library
│   ├── index.jsp                # Main Dashboard UI
│   └── addExpenseAction.jsp     # Logic for form submission
│
└── pom.xml (or build path)      # Project dependencies
