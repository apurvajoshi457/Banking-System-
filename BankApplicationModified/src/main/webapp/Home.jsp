<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Banking System - Home</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body class="bg-light d-flex align-items-center vh-100">

    <div class="container text-center">
        <h2 class="mb-4 fw-bold text-primary">Welcome to the Banking System</h2>

        <div class="row justify-content-center">
            <!-- Sign Up Card -->
            <div class="col-md-4">
                <div class="card shadow-lg mb-4">
                    <div class="card-body">
                        <h5 class="card-title text-primary fw-bold">New User?</h5>
                        <p class="card-text">Create an account to get started.</p>
                        <a href="SignUp.jsp" class="btn btn-primary w-100">Sign Up</a>
                    </div>
                </div>
            </div>

            <!-- Login Card -->
            <div class="col-md-4">
                <div class="card shadow-lg mb-4">
                    <div class="card-body">
                        <h5 class="card-title text-success fw-bold">Existing User?</h5>
                        <p class="card-text">Login to access your account.</p>
                        <a href="SignIn.jsp" class="btn btn-success w-100">Login</a>
                    </div>
                </div>
            </div>

            <!-- Admin Login Card -->
            <div class="col-md-4">
                <div class="card shadow-lg mb-4">
                    <div class="card-body">
                        <h5 class="card-title text-danger fw-bold">Admin Portal</h5>
                        <p class="card-text">Access the admin panel for management.</p>
                        <a href="AdminLogin.jsp" class="btn btn-danger w-100">Admin Login</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
