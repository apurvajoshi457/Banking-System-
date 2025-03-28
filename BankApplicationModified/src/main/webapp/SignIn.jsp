<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-lg">
                    <div class="card-body">
                        <h2 class="text-center mb-4">Login</h2>

                        <!-- Display error message if login fails -->
                        <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
                        <% if (errorMessage != null) { %>
                            <div class="alert alert-danger text-center">
                                <%= errorMessage %>
                            </div>
                        <% } %>

                        <form action="LoginController" method="post">
                            <div class="mb-3">
                                <label class="form-label">First Name:</label>
                                <input type="text" name="fname" class="form-control" 
                                    value="<%= request.getParameter("fname") != null ? request.getParameter("fname") : "" %>" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Middle Name:</label>
                                <input type="text" name="mname" class="form-control" 
                                    value="<%= request.getParameter("mname") != null ? request.getParameter("mname") : "" %>">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Last Name:</label>
                                <input type="text" name="lname" class="form-control" 
                                    value="<%= request.getParameter("lname") != null ? request.getParameter("lname") : "" %>" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Account Number:</label>
                                <input type="text" name="accno" class="form-control" 
                                    value="<%= request.getParameter("accno") != null ? request.getParameter("accno") : "" %>" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Password:</label>
                                <input type="password" name="password" class="form-control" required>
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-primary w-100">Login</button>
                            </div>
                        </form>

                        <div class="text-center mt-3">
                            <p>Don't have an account? <a href="SignUp.jsp">Sign Up</a></p>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
