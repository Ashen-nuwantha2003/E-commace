<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Cargills Online</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
</head>
<body class="bg-light">
<div class="container d-flex justify-content-center align-items-center min-vh-100">
    <div class="card shadow p-4" style="width: 100%; max-width: 400px;">
        <div class="text-center mb-4">
            <img src="imgs/cargills%20new.png" alt="Cargills Logo" style="width: 100px; height: auto;">
            <h2 class="h4 mt-3">Login to Your Account</h2>
        </div>
        <form action="login.jsp" method="POST">
            <!-- Email Input -->
            <div class="mb-3">
                <label for="email" class="form-label">Email address</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
            </div>
            <!-- Password Input -->
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <!-- Remember Me Checkbox -->
            <div class="form-check mb-3">
                <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe">
                <label class="form-check-label" for="rememberMe">Remember me</label>
            </div>
            <!-- Submit Button -->
            <div class="d-grid">
                <button type="submit" class="btn btn-danger">Login</button>
            </div>
        </form>
        <!-- Links -->
        <div class="text-center mt-3">
            <p class="small">
                <a href="forgot-password.jsp" class="text-decoration-none">Forgot Password?</a>
            </p>
            <p class="small">
                Don't have an account? <a href="Signup.jsp" class="text-decoration-none">Sign Up</a>
            </p>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
