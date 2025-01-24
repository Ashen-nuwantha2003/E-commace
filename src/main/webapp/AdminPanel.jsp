<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cargills Online Store Admin Panel</title>
    <!-- Bootstrap CSS from CDN -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        .navbar {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: none;
            border-radius: 16px;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        .text-red {
            color: #dc3545 !important;
        }

        .bg-red {
            background-color: #dc3545 !important;
        }

        .btn-red {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        .btn-red:hover {
            background-color: #bd2130;
            border-color: #ac1d2a;
        }
    </style>
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark bg-red mb-4">
    <div class="container">
        <a class="navbar-brand" href="#">
            <i class="bi bi-shop me-2"></i>
            Cargills Online
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
</nav>

<div class="container py-4">
    <div class="row">
        <div class="col-12">
            <div class="card shadow-sm mb-4">
                <div class="card-body">
                    <h1 class="card-title h3 mb-4">Admin Dashboard</h1>
                    <div class="row g-4">
                        <div class="col-md-4">
                            <div class="card h-100">
                                <div class="card-body text-center">
                                    <i class="bi bi-people display-4 text-red mb-3"></i>
                                    <h5 class="card-title">Customer Management</h5>
                                    <p class="card-text">Manage customer accounts and information</p>
                                    <a href="customerManagement.jsp" class="btn btn-red">Access</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card h-100">
                                <div class="card-body text-center">
                                    <i class="bi bi-box-seam display-4 text-red mb-3"></i>
                                    <h5 class="card-title">Item Management</h5>
                                    <p class="card-text">Manage products and inventory</p>
                                    <a href="ItemSelect.jsp" class="btn btn-red">Access</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card h-100">
                                <div class="card-body text-center">
                                    <i class="bi bi-cart-check display-4 text-red mb-3"></i>
                                    <h5 class="card-title">Order Management</h5>
                                    <p class="card-text">Track and manage customer orders</p>
                                    <a href="" class="btn btn-red">Access</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-end">
                <button class="btn btn-red">
                    <i class="bi bi-box-arrow-right me-2"></i>
                    <a href="index.jsp" class="btn btn-red"></a>
                    Logout from Admin Panel
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS and Popper.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
