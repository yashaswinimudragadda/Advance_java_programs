# 🚀 User Management System (CRUD)

A full-stack Java Web Application utilizing the **MVC (Model-View-Controller)** architecture. This project handles user authentication, profile management, and database persistence using Java EE technologies.

---

## 📂 Folder Structure & Architecture

The project is organized into logical packages to separate data, logic, and presentation:

```text
src/main/java/
├── com.project.model/
│   └── User.java           # Model: Encapsulates User data (POJO)
├── com.project.dao/
│   └── UserDAO.java        # Controller/Logic: Handles all SQL operations
└── com.project.util/
    └── DBUtils.java        # Utility: Manages MySQL Database connections

src/main/webapp/
├── signup.jsp              # Create: User registration form
├── signin.jsp              # Read: User authentication/Login
├── display_profile.jsp     # Read: Shows logged-in user details
├── edit_profile.jsp        # Update: Form to modify account details
└── logout.jsp              # Session: Clears server-side memory
