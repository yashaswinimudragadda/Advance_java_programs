<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width,initial-scale=1">
<title>Welcome to our protal</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
 body{
     display:flex;
     flex-direction:column;
     min-height:100vh;
 }
 
 .main-content{
     flex:1;
 }
</style>
</head>
<body>
<header>
 <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
   <div class="container">
     <a class="navbar-brand" href="#">Brand logo</a>
     <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar">
       <span class="navbar-toggler-icon"></span>
     </button>
     
     <div class="collapse navbar-collapse" id="navbarNav">
       <ul class="navbar-nav ms-auto">
         <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
         <li class="nav-item"><a class="nav-link" href="#">Features</a></li>
         <li class="nav-item"><a class="nav-link" href="#">About</a></li>
       </ul>
     </div>
   </div>
 </nav>
</header>


<main class="main-content d-flex align-items-center">

<div class="container">
 <div class="row align-items-center">
   <div class="col-lg-7 text-center text-lg-center mb-5">
     <h1 class="display-4 fw-bold">Welcome Back!</h1>
     <p class="lead">Connect with our community and manage your projects with ease. sign in to access your personalized dashboard.</p>
   </div>
   <a href="Signin.jsp" class="w-100 btn btn-lg btn-primary">Sign In</a>
</main>

<footer class="py-3 bg-dark text-white mt-auto">
  <div class="container text-center">
    <p class="mb-0">&coppy; 2026 userManagement,inc,all rights reserved.</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="#" class="text-white-50 text-decoration-none">Privacy</a></li>
      <li class="list-inline-item"><a href="#" class="text-white-50 text-decoration-none">Terms</a></li>
      <li class="list-inline-item"><a href="#" class="text-white-50 text-decoration-none">Support</a></li>
    </ul>
  </div>
  
  
</footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>