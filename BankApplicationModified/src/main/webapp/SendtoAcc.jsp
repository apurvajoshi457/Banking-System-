<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession userSession = request.getSession(false);
    String senderAccNo = (userSession != null) ? (String) userSession.getAttribute("accountNo") : null;

    if (senderAccNo == null) {
        response.sendRedirect("SignIn.jsp"); // Redirect to login if session expired 
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Transfer Money</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
</head>
<body class="bg-light">

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow">
        <div class="container">
            <a class="navbar-brand fw-bold" href="#">Banking App</a>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-lg border-0">
                    <div class="card-body">
                        <h3 class="text-center text-primary">
                            <i class="bi bi-cash-coin"></i> Transfer Money
                        </h3>
                        <p class="text-muted text-center">Securely transfer funds to another account</p>

                        <form action="SendtoAccController" method="post">
                            <div class="mb-3">
                                <label class="form-label">Your Account Number:</label>
                                <input type="text" class="form-control" name="senderAccNo" value="<%= senderAccNo %>" readonly>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Recipient's Account Number:</label>
                                <input type="text" class="form-control" name="receiverAccNo" placeholder="Enter recipient's account no." required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Amount to Transfer:</label>
                                <input type="number" class="form-control" name="amount" placeholder="Enter amount" required min="1">
                            </div>

                            <button type="submit" class="btn btn-success w-100">
                                <i class="bi bi-send"></i> Send Money
                            </button>
                        </form>

                        <% if (request.getAttribute("message") != null) { %>
                            <div class="alert alert-info mt-3 text-center">
                                <%= request.getAttribute("message") %>
                            </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
