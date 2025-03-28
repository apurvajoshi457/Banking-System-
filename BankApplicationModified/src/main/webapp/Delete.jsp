<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Delete Account</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
</head>
<body class="bg-light">

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-danger shadow">
        <div class="container">
            <a class="navbar-brand fw-bold" href="#">Banking System</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link text-white" href="dashboard.jsp">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="LogoutController">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Delete Account Form -->
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-lg border-0">
                    <div class="card-body text-center">
                        <h3 class="text-danger"><i class="bi bi-trash3-fill"></i> Delete Account</h3>
                        <p class="text-muted">Enter your account number to permanently delete your account.</p>
                        
                        <form action="DeleteController" method="post" class="mt-3">
                            <div class="mb-3">
                                <label for="accountNo" class="form-label">Account Number</label>
                                <input type="text" id="accountNo" name="accountNo" class="form-control" required>
                            </div>
                            <button type="submit" class="btn btn-danger w-100">Delete Account</button>
                        </form>

                        <%-- Display Message (if any) --%>
                        <%
                            String message = (String) request.getAttribute("message");
                            if (message != null) {
                        %>
                            <div class="alert alert-info mt-3"><%= message %></div>
                        <%
                            }
                        %>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
