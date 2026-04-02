# 📚 Book Management System (JSP CRUD)

A lightweight web application built using **JSP, Servlets, and MySQL** to manage a digital library. This project demonstrates full **CRUD** (Create, Read, Update, Delete) functionality with a modern UI.

---

## 🚀 Features

* **Create**: Add new books with titles and author names.
* **Read**: View a real-time list of all books stored in the database.
* **Update**: Edit existing book details via a pre-filled dynamic form.
* **Delete**: Remove records with a single click (includes confirmation prompts).
* **Responsive UI**: A clean, CSS-styled interface that works on different screen sizes.

---

## 🎥 Project Demo

If you'd like to see the application in action, check out the video below:

<div align="center">
  <video src="https://github.com/user-attachments/assets/f4735388-8f0d-4f3f-a907-74546661a4c9" width="100%" controls title="Project Demo">
    Your browser does not support the video tag.
  </video>
</div>

> **Note:** If you are hosting this on GitHub, ensure the video file is uploaded to the repository or provide a direct link to the file.

---

## 🛠️ Tech Stack

* **Frontend:** HTML5, CSS3
* **Backend:** Java Server Pages (JSP)
* **Database:** MySQL 8.0
* **Driver:** Connector/J (JDBC)

---

## 📋 Database Setup

To run this project locally, create a database named `projects` and execute the following SQL:

```sql
CREATE TABLE books_details_jsp (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_name VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL
);
