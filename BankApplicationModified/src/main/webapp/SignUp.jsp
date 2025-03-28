<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User Registration</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-lg">
                    <div class="card-body">
                        <h2 class="text-center mb-4">User Registration</h2>

                        <%-- Display Error Messages --%>
                        <% 
                            List<String> errors = (List<String>) request.getAttribute("errors"); 
                            if (errors != null) { 
                        %>
                            <div class="alert alert-danger">
                                <ul class="mb-0">
                                    <% for (String error : errors) { %>
                                        <li><%= error %></li>
                                    <% } %>
                                </ul>
                            </div>
                        <% } %>

                        <form action="RegisterController" method="post">
                            <div class="mb-3">
                                <label class="form-label">First Name:</label>
                                <input type="text" name="fname" class="form-control" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Middle Name:</label>
                                <input type="text" name="mname" class="form-control">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Last Name:</label>
                                <input type="text" name="lname" class="form-control" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Account Number:</label>
                                <input type="text" name="accno" class="form-control" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Password:</label>
                                <input type="password" name="password" class="form-control" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Balance:</label>
                                <input type="text" name="balance" class="form-control" required>
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-primary w-100">Register</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
