<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Mobile Recharge</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
</head>
<body class="bg-light">

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow">
        <div class="container">
            <a class="navbar-brand fw-bold" href="#">Mobile Recharge</a>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-lg border-0">
                    <div class="card-body text-center">
                        <h3 class="text-primary"><i class="bi bi-phone"></i> Recharge Now</h3>
                        <p class="text-muted">Select a recharge plan for your account.</p>

                        <%
                            String accountNo = (String) session.getAttribute("accountNo"); // Get account number from session
                            if (accountNo == null) {
                        %>
                            <div class="alert alert-danger">Error: No account found in session.</div>
                        <%
                            } else {
                        %>

                        <p><strong>Account Number:</strong> <span class="text-success"><%= accountNo %></span></p>

                        <form action="RechargeController" method="post">
                            <div class="mb-3">
                                <label for="amount" class="form-label">Select Recharge Pack:</label>
                                <select class="form-select" name="amount" id="amount" required>
                                    <option value="199">1GB/Day - 28 Days - Rs.199</option>
                                    <option value="299">1.5GB/Day - 28 Days - Rs.299</option>
                                    <option value="399">2GB/Day - 56 Days - Rs.399</option>
                                    <option value="599">2.5GB/Day - 84 Days - Rs.599</option>
                                </select>
                            </div>

                            <button type="submit" class="btn btn-success w-100">
                                <i class="bi bi-lightning-fill"></i> Recharge Now
                            </button>
                        </form>

                        <% 
                            String message = (String) request.getAttribute("message");
                            if (message != null) {
                        %>
                            <div class="alert alert-info mt-3"><%= message %></div>
                        <%
                            }
                        %>

                        <% } %> <!-- End of session check -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
