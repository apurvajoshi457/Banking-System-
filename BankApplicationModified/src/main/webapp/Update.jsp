<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update Balance</title>

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
                            <i class="bi bi-wallet"></i> Update Account Balance
                        </h3>
                        <p class="text-muted text-center">Modify the balance of an account securely</p>

                        <form action="UpdateController" method="post">
                            <div class="mb-3">
                                <label class="form-label" for="accountNo">Enter Account Number:</label>
                                <input type="text" class="form-control" name="accountNo" id="accountNo" placeholder="Account Number" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label" for="newBalance">Enter New Balance:</label>
                                <input type="text" class="form-control" name="newBalance" id="newBalance" placeholder="New Balance" required>
                            </div>

                            <button type="submit" class="btn btn-success w-100">
                                <i class="bi bi-arrow-repeat"></i> Update Balance
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
