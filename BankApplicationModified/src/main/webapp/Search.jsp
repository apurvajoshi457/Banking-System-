<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="Model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Search Account</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            max-width: 600px;
            margin-top: 50px;
        }
        .card {
            border-radius: 10px;
        }
        .table {
            margin-top: 20px;
        }
    </style>
</head>
<body class="bg-light">

    <div class="container">
        <div class="card shadow-lg p-4">
            <h2 class="text-center text-primary">Search Account</h2>
            <form action="SearchController" method="get" class="mt-3">
                <div class="mb-3">
                    <label for="accountNo" class="form-label">Enter Account Number:</label>
                    <input type="text" name="accountNo" id="accountNo" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Search</button>
            </form>
        </div>

        <%
            List<User> users = (List<User>) request.getAttribute("users");
            if (users != null && !users.isEmpty()) { 
        %>
        <div class="card shadow-lg p-4 mt-4">
            <h3 class="text-center text-success">Account Details</h3>
            <div class="table-responsive">
                <table class="table table-bordered table-striped text-center">
                    <thead class="table-dark">
                        <tr>
                            <th>First Name</th>
                            <th>Middle Name</th>
                            <th>Last Name</th>
                            <th>Account No</th>
                            <th>Balance</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (User user : users) {  
                        %>
                        <tr>
                            <td><%= user.getFirstName() %></td>
                            <td><%= user.getMiddleName() %></td>
                            <td><%= user.getLastName() %></td>
                            <td><%= user.getAccountNo() %></td>
                            <td>₹<%= user.getBalance() %></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        <%
            }
        %>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
