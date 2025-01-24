<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.ecommoces.model.Account" %>
<%@ page import="java.util.List" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Management - Cargills Online Store</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        .navbar {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .bg-red {
            background-color: #dc3545 !important;
        }

        .btn-red {
            background-color: #dc3545;
            border-color: #dc3545;
            color: #fff;
        }

        .btn-red:hover {
            background-color: #bd2130;
            border-color: #ac1d2a;
        }

        .btn-outline-red {
            border-color: #dc3545;
            color: #dc3545;
        }

        .btn-outline-red:hover {
            background-color: #dc3545;
            color: #fff;
        }

        .table-hover tbody tr:hover {
            background-color: rgba(220, 53, 69, 0.1);
        }

        .card {
            border: none;
            border-radius: 16px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .modal-content {
            border-radius: 16px;
        }
    </style>
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark bg-red mb-4">
    <div class="container">
        <a class="navbar-brand" href="#">
            <i class="bi bi-shop me-2"></i>
            Cargills Online Store
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
</nav>

<div class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1 class="h2">Customer Management</h1>
        <a href="AdminPanel.jsp" class="btn btn-outline-red">
            <i class="bi bi-arrow-left me-2"></i>
            Back to Dashboard
        </a>
    </div>

    <div class="card shadow-sm">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead class="table-light">
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">FirstName</th>
                        <th scope="col">LastName</th>
                        <th scope="col">Email</th>
                        <th scope="col">Telephone</th>

                        <th scope="col" class="text-center">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        List<Account> datalist = (List<Account>) request.getAttribute("customers");
                        if (datalist == null) {
                            response.sendRedirect("customers");
                            return;
                        }

                        if (datalist != null && !datalist.isEmpty()) {
                            for (Account customer : datalist) {
                    %>
                    <tr>
                        <td><%= customer.getFirstName() %></td>
                        <td><%= customer.getLastName() %></td>
                        <td><%= customer.getEmail() %></td>
                        <td><%= customer.getPhone() %></td>
                        <td><%= customer.getPassword() %></td>
                        <td class="text-center">
                            <button class="btn btn-red btn-sm"
                                    onclick="confirmDelete('<%= customer.getFirstName() %>')"
                                    type="button">
                                <i class="bi bi-trash me-1"></i>
                                Delete
                            </button>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="5" class="text-center">No Customers found</td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-red text-white">
                    <h5 class="modal-title" id="deleteModalLabel">Confirm Delete</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Are you sure you want to delete this customer?
                </div>
                <div class="modal-footer">
                    <form id="deleteForm" action="customer" method="POST">
                        <input type="hidden" id="customerId" name="customerId" value="">
                        <input type="hidden" name="action" value="delete">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-red">Delete</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function confirmDelete(customerId) {
        document.getElementById('customerId').value = customerId;
        var deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
        deleteModal.show();
    }
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
