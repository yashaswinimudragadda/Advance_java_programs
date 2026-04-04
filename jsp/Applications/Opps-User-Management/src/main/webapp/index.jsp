<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to MyProject</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .hero-section { height: 100vh; display: flex; align-items: center; justify-content: center; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; }
    </style>
</head>
<body>
    <div class="hero-section text-center">
        <div class="container">
            <h1 class="display-3 fw-bold">Welcome to Our Platform</h1>
            <p class="lead mb-4">The most secure way to manage your profile and data.</p>
            <div class="d-grid gap-3 d-sm-flex justify-content-sm-center">
                <a href="signin.jsp" class="btn btn-light btn-lg px-4 gap-3">Sign In</a>
                <a href="signup.jsp" class="btn btn-outline-light btn-lg px-4">Create Account</a>
            </div>
        </div>
    </div>
</body>
</html>