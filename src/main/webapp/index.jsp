<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cargills Online - Sri Lanka's Freshest Grocery Store</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <style>
        #category>div {
            width: 10%;
            aspect-ratio: 1/1;
            margin: 1%;
            border-radius: 100%;
        }

        #category>div>div {
            width: 100%;
            aspect-ratio: 1/1;
            border: 1px solid;
            margin: 1%;
            border-radius: 100%;
            background-size: cover;
        }

        #category>div:nth-child(1)>div {
            background-image: url("/imgs/seedless_fruits.jpg");
        }

        #category>div:nth-child(2)>div {
            background-image: url("/imgs/2-2-2-2foodgroups_vegetables_detailfeature.jpg");
        }

        #category>div:nth-child(3)>div {
            background-image: url("/imgs/meats.jpg");
        }

        #category>div:nth-child(4)>div {
            background-image: url("/imgs/dairy.jpg");
        }

        #category>div:nth-child(5)>div {
            background-image: url("/imgs/pantry.jpg");
        }

        #category>div>button {
            place-self: end end;
            display: flex;
            align-items: end;
            justify-content: center;
        }

    </style>
</head>
<body>
<header class="bg-danger py-2">
    <div class="container d-flex justify-content-between align-items-center">
        <!-- Logo Section -->
        <div class="d-flex align-items-center">
            <img src="imgs/cargills%20new.png" alt="Cargills Logo" style="width: 80px; height: auto; margin-right: 5px;">
            <h1 class="h5 text-white m-0">Cargills Online</h1>
        </div>
        <!-- Search Bar Section -->
        <div class="d-flex align-items-center flex-grow-1 mx-3">
            <input class="form-control me-2" type="text" placeholder="Search for Products" style="max-width: 400px;">
            <div class="dropdown">
                <button class="btn btn-light dropdown-toggle" type="button" id="locationDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    Colombo
                </button>
                <ul class="dropdown-menu" aria-labelledby="locationDropdown">
                    <li><a class="dropdown-item" href="#">Colombo</a></li>
                    <li><a class="dropdown-item" href="#">Kandy</a></li>
                    <li><a class="dropdown-item" href="#">Galle</a></li>
                </ul>
            </div>
        </div>
        <!-- User Options -->
        <div class="d-flex align-items-center">
            <img src="icon/icons8-login-67.png" style="width: 30px;">
            <a href="Login.jsp" class="text-white me-3">Login/Sign Up</a>
            <img src="icon/icons8-shopping-cart-80.png" style="width: 30px; margin-right: 15px">
            <a href="#"><img src="icon/icons8-google-play-50.png" alt="Google Play" style="width: 30px; margin-right: 10px;"></a>
            <a href="google play.jsp" class="text-white me-3">Google Play</a>
            <a href="#"><img src="icon/icons8-apple-logo-50.png" alt="App Store" style="width: 30px;"></a>
            <a href="apple store.jsp" class="text-white me-3">Apple Store</a>
        </div>
    </div>
    <!-- Categories Navigation -->
    <div class="bg-light">
        <div class="container">
            <nav class="nav">
                <a class="nav-link text-danger fw-bold" href="#">Shop By Category</a>
                <a class="nav-link" href="#">Baby Products</a>
                <a class="nav-link" href="#">Dairy</a>
                <a class="nav-link" href="#">Beverages</a>
                <a class="nav-link" href="#">Food Cupboard</a>
                <a class="nav-link" href="#">Household</a>
                <a class="nav-link" href="#">Tea & Coffee</a>
                <span class="ms-auto text-muted">Delivery Today: 12:00 PM - 04:00 PM</span>
            </nav>
        </div>
    </div>
</header>


<main class="container my-4">
    <section class="hero text-center py-5 bg-light">
        <h2>Welcome to Sri Lanka's Freshest Online Grocery Store</h2>
        <p class="lead">Shop fresh produce, meats, pantry staples, and more delivered straight to your door.</p>
        <a href="products.jsp" class="btn btn-primary btn-lg">Shop Now</a>
    </section>

    <div class="container mt-5">
        <section class="categories my-5">
            <h3 class="text-center">Shop by Category</h3>
            <div class="row text-center" id="category">
                <div class="col-md-2">
                    <div></div>
                    <a href="category.jsp?category=fruits" class="btn btn-outline-secondary">Fruits</a>
                </div>
                <div class="col-md-2">
                    <div></div>
                    <a href="category.jsp?category=vegetables" class="btn btn-outline-secondary">Vegetables</a>
                </div>
                <div class="col-md-2">
                    <div></div>
                    <a href="category.jsp?category=meats" class="btn btn-outline-secondary">Meats</a>
                </div>
                <div class="col-md-2">
                    <div></div>
                    <a href="category.jsp?category=dairy" class="btn btn-outline-secondary">Dairy</a>
                </div>
                <div class="col-md-2">
                    <div></div>
                    <a href="category.jsp?category=pantry" class="btn btn-outline-secondary">Pantry Staples</a>
                </div>
            </div>
        </section>
    </div>

    <!-- Slideshow Section -->
    <section class="slideshow my-5">
        <div id="businessCarousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <!-- Slide 1: Special Offers -->
                <div class="carousel-item active">
                    <img src="imgs/DySec-zJn1bOYCgqUFD-BANNER-JAN-WEB.png" class="d-block w-100" alt="Special Offers">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Special Offers</h5>
                        <p>Don't miss out on our exclusive deals!</p>
                    </div>
                </div>
                <!-- Slide 2: Discounts -->
                <div class="carousel-item">
                    <img src="imgs/DySec-3Se5qMCYlbVGFT_Web_Banner.png" class="d-block w-100" alt="Discounts">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Discounts</h5>
                        <p>Save big on your favorite items!</p>
                    </div>
                </div>
                <!-- Slide 3: Best Selling Items -->
                <div class="carousel-item">
                    <img src="imgs/DySec-5qgCYOaxmJunilever-campaign-app-web%20(1).png" class="d-block w-100" alt="Best Selling Items">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Best Selling Items</h5>
                        <p>Check out our most popular products.</p>
                    </div>
                </div>
                <!-- Slide 4: Flash Deals -->
                <div class="carousel-item">
                    <img src="imgs/DySec-CsPb2nJzVLDySec-zVL8tjGvSekist%20web.png" class="d-block w-100" alt="Flash Deals">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Flash Deals</h5>
                        <p>Limited-time offers just for you!</p>
                    </div>
                </div>
            </div>
            <!-- Carousel Controls -->
            <button class="carousel-control-prev" type="button" data-bs-target="#businessCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#businessCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </section>

</main>

<!-- Products Section -->
<div class="container my-5" id="products">
    <h2 class="mb-4 text-center">Best of FRUIT</h2>
    <div class="row row-cols-1 row-cols-md-5 g-4">
        <!-- Product Card -->
        <div class="col">
            <div class="card h-100">
                <img src="imgs/banana.jpg" style="width: 150px; height: 130px; place-self: center center;" class="card-img-top" alt="Good Harvest Spine Gourd">
                <div class="card-body">
                    <h5 class="card-title">Sugar Plantain Full hand</h5>
                    <p class="card-text">1 kg</p>
                    <p class="text-primary fw-bold">Rs. 291.00 <small>(Inclusive of all taxes)</small></p>
                    <a href="#" class="btn btn-danger w-100">Add</a>
                </div>
            </div>
        </div>
        <!-- Product Card -->
        <div class="col">
            <div class="card h-100">
                <img src="imgs/gragendfood.jpg" style="width: 150px; height: 155px; place-self: center center;" class="card-img-top" alt="Good Harvest Thalana Batu">
                <div class="card-body">
                    <h5 class="card-title">Dragon Fruit</h5>
                    <p class="card-text">500.00 g</p>
                    <p class="text-primary fw-bold">Rs. 475.00 <small>(Inclusive of all taxes)</small></p>
                    <a href="#" class="btn btn-danger w-100">Add</a>
                </div>
            </div>
        </div>
        <!-- Product Card -->
        <div class="col">
            <div class="card h-100">
                <img src="imgs/mango.jpg"style="width: 150px; height: 130px; place-self: center center;" class="card-img-top" alt="Good Harvest Tomato">
                <div class="card-body">
                    <h5 class="card-title">Karthakolomban Mango</h5>
                    <p class="card-text">1 kg</p>
                    <p class="text-primary fw-bold">Rs. 500.00 <small>(Inclusive of all taxes)</small></p>
                    <a href="#" class="btn btn-danger w-100">Add</a>
                </div>
            </div>
        </div>
        <!-- Product Card -->
        <div class="col">
            <div class="card h-100">
                <img src="imgs/stobry.jpg" style="width: 150px; height: 155px; place-self: center center;" class="card-img-top" alt="Big Onion">
                <div class="card-body">
                    <h5 class="card-title">Strawberry</h5>
                    <p class="card-text">500.00 g</p>
                    <p class="text-primary fw-bold">Rs. 450.00 <small>(Inclusive of all taxes)</small></p>
                    <a href="#" class="btn btn-danger w-100">Add</a>
                </div>
            </div>
        </div>
        <!-- Product Card -->
        <div class="col">
            <div class="card h-100">
                <img src="imgs/ali%20gatapera.jpg" style="width: 160px; height: 155px; place-self: center center;" class="card-img-top" alt="Broccoli">
                <div class="card-body">
                    <h5 class="card-title">Avacado</h5>
                    <p class="card-text">800.00 g</p>
                    <p class="text-primary fw-bold">Rs. 620.00 <small>(Inclusive of all taxes)</small></p>
                    <a href="#" class="btn btn-danger w-100">Add</a>
                </div>
            </div>
        </div>
    </div>
</div>


<footer class="bg-dark text-white py-3">
    <div class="container text-center">
        <p>&copy; 2025 Cargills Online. All Rights Reserved.</p>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
