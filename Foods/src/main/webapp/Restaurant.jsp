<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.util.List,com.food.model.Restaurant"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HomePage</title>
<link rel="stylesheet" href="common.css">
<link rel="stylesheet" href="homeStyles.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800;900&display=swap"
        rel="stylesheet">
</head>
<body>

    <nav class="navbar">
        <div class="container navbar-container">
            <a href="#" class="logo">
                <span class="logo-icon">🍽️</span>
                <span class="logo-text">JavaFoods</span>
            </a>

            <div class="nav-links">
                <a href="#" class="nav-link active">Home</a>
                <a href="#menu" class="nav-link">Menu</a>
                <a href="#restaurants" class="nav-link">Restaurants</a>
                <a href="#offers" class="nav-link">Offers</a>
            </div>

            <div class="nav-actions">
                <a href="Cart.jsp" class="cart-btn">
                    <i class="fas fa-shopping-bag"></i>
                    <span class="cart-count">2</span>
                </a>
                <a href="login.html" class="btn btn-nav">Sign In</a>
                <button class="menu-toggle" id="menuToggle">
                    <i class="fas fa-bars"></i>
                </button>
            </div>
        </div>

        <!-- Mobile Menu -->
        <div class="mobile-menu" id="mobileMenu">
            <a href="#" class="mobile-link">Home</a>
            <a href="#menu" class="mobile-link">Menu</a>
            <a href="#restaurants" class="mobile-link">Restaurants</a>
            <a href="#offers" class="mobile-link">Offers</a>
            <a href="login.html" class="mobile-link">Sign In</a>
        </div>
    </nav>

    <!-- Hero Section -->
    <header class="hero">
        <div class="hero-bg-elements">
            <div class="hero-glow hero-glow-1"></div>
            <div class="hero-glow hero-glow-2"></div>
            <div class="floating-food food-1">🍕</div>
            <div class="floating-food food-2">🍔</div>
            <div class="floating-food food-3">🌮</div>
            <div class="floating-food food-4">🍟</div>
        </div>

        <div class="container hero-container">
            <div class="hero-content">
                <span class="hero-badge animate-fade-in-up">
                    <i class="fas fa-fire"></i> #1 Food Delivery App
                </span>
                <h1 class="hero-title animate-fade-in-up" style="animation-delay: 0.1s;">
                    Order Food<br>
                    <span class="text-gradient-animated">To Your Door</span>
                </h1>
                <p class="hero-description animate-fade-in-up" style="animation-delay: 0.2s;">
                    Discover culinary delights and find your favorite dish with our swift and savory food delivery
                    service.
                </p>

                <div class="hero-search animate-fade-in-up" style="animation-delay: 0.3s;">
                    <div class="search-location">
                        <i class="fas fa-map-marker-alt"></i>
                        <span>New York</span>
                        <i class="fas fa-chevron-down"></i>
                    </div>
                    <div class="search-divider"></div>
                    <input type="text" placeholder="Search for food or restaurants...">
                    <button class="search-btn">
                        <i class="fas fa-search"></i>
                    </button>
                </div>

                <div class="hero-stats animate-fade-in-up" style="animation-delay: 0.4s;">
                    <div class="stat-item">
                        <span class="stat-number">12K+</span>
                        <span class="stat-label">Daily Orders</span>
                    </div>
                    <div class="stat-divider"></div>
                    <div class="stat-item">
                        <span class="stat-number">500+</span>
                        <span class="stat-label">Restaurants</span>
                    </div>
                    <div class="stat-divider"></div>
                    <div class="stat-item">
                        <span class="stat-number">4.9</span>
                        <span class="stat-label">App Rating</span>
                    </div>
                </div>
            </div>

            <div class="hero-image animate-fade-in-up" style="animation-delay: 0.2s;">
                <div class="hero-img-wrapper">
                    <img src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=800&q=80"
                        alt="Delicious Burger" class="main-img">
                    <div class="hero-img-glow"></div>
                </div>

                <!-- Floating Cards -->
                <div class="float-card card-delivery">
                    <div class="float-icon-wrapper">
                        <i class="fas fa-motorcycle"></i>
                    </div>
                    <div class="float-text">
                        <strong>30 min</strong>
                        <span>Fast Delivery</span>
                    </div>
                </div>

                <div class="float-card card-rating">
                    <div class="float-icon-wrapper rating">
                        <i class="fas fa-star"></i>
                    </div>
                    <div class="float-text">
                        <strong>4.9 Rating</strong>
                        <span>2.5k+ Reviews</span>
                    </div>
                </div>

                <div class="float-card card-discount">
                    <span class="discount-badge">20% OFF</span>
                    <span class="discount-text">First Order</span>
                </div>
            </div>
        </div>
    </header>

    <!-- How It Works Section -->
    <section class="section how-it-works">
        <div class="container">
            <div class="how-header">
                <div class="how-title-wrapper">
                    <h2 class="section-title-large">Get Your Food In Less<br>Than An Hour</h2>
                    <p class="how-description">
                        Craving delicious meals without the hassle of cooking or leaving your home?
                        Look no further than JavaFoods, your go-to food delivery app.
                    </p>
                    <a href="#menu" class="btn btn-outline">
                        <span>Explore Menu</span>
                        <i class="fas fa-arrow-right"></i>
                    </a>
                </div>
            </div>
				<div class="steps-grid">
                <div class="step-card">
                    <div class="step-number">01</div>
                    <div class="step-content">
                        <h3>Search Your Favorite Food</h3>
                        <p>Order your food online to get the fastest delivery.</p>
                        <a href="#" class="step-link">Download Now <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
     

                <div class="step-card">
                    <div class="step-number">02</div>
                    <div class="step-content">
                        <h3>Select Your Food</h3>
                        <p>Select you want from thousands of restaurants and cuisines available near you.</p>
                    </div>
                    <div class="step-image">
                        <img src="https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&w=300&q=80"
                            alt="Food selection">
                    </div>
                </div>

                <div class="step-card">
                    <div class="step-number">03</div>
                    <div class="step-content">
                        <h3>Confirm Your Order</h3>
                        <p>With order meal, get your food delivered to your doorstep within an hour!</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Best Deals Section -->
    <section class="section best-deals" id="offers">
        <div class="container">
            <div class="section-header-flex">
                <div>
                    <span class="section-tag">🔥 Hot Deals</span>
                    <h2 class="section-title">See Today's Best Deals</h2>
                </div>
                <a href="#" class="view-all-btn">
                    View All <i class="fas fa-arrow-right"></i>
                </a>
            </div>

            <div class="deals-grid">
                <div class="deal-card deal-large">
                    <div class="deal-image">
                        <img src="https://images.unsplash.com/photo-1586190848861-99aa4a171e90?auto=format&fit=crop&w=800&q=80"
                            alt="Burger Deal">
                        <div class="deal-overlay"></div>
                    </div>
                    <div class="deal-content">
                        <span class="deal-badge">Best Buy</span>
                        <h3 class="deal-title">8 Burgers+<br>French Fries</h3>
                        <p class="deal-description">100% fresh beef patty, cheddar cheese, onion, pickles and more!</p>
                        <a href="#" class="btn btn-primary">Explore Menu</a>
                    </div>
                </div>

                <div class="deal-cards-column">
                    <div class="deal-card deal-small">
                        <img src="https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=400&q=80"
                            alt="Pizza">
                        <div class="deal-info">
                            <span class="deal-discount">30% OFF</span>
                            <h4>Pepperoni Pizza</h4>
                            <p>Large size with extra cheese</p>
                        </div>
                    </div>
                    <div class="deal-card deal-small">
                        <img src="https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?auto=format&fit=crop&w=400&q=80"
                            alt="Fried Chicken">
                        <div class="deal-info">
                            <span class="deal-discount">25% OFF</span>
                            <h4>Crispy Chicken</h4>
                            <p>8 pieces bucket meal</p>
                        </div>
                    </div>
                    <div class="deal-card deal-small">
                        <img src="https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?auto=format&fit=crop&w=400&q=80"
                            alt="Special Pizza">
                        <div class="deal-info">
                            <span class="deal-discount">40% OFF</span>
                            <h4>Chef's Special</h4>
                            <p>Premium wood-fired pizza</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Categories Section -->
    <section class="section categories" id="menu">
        <div class="container">
            <div class="section-header-flex">
                <div>
                    <span class="section-tag">🍽️ Categories</span>
                    <h2 class="section-title">Our Food Categories</h2>
                </div>
                <a href="#" class="view-all-btn">
                    View All <i class="fas fa-arrow-right"></i>
                </a>
            </div>

            <div class="categories-grid">
                <div class="category-card">
                    <div class="category-img">
                        <img src="https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=300&q=80"
                            alt="Pizza">
                    </div>
                    <h3>Pizza</h3>
                    <p>14 Items</p>
                </div>

                <div class="category-card">
                    <div class="category-img">
                        <img src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=300&q=80"
                            alt="Burger">
                    </div>
                    <h3>Burgers</h3>
                    <p>19 Items</p>
                </div>

                <div class="category-card">
                    <div class="category-img">
                        <img src="https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?auto=format&fit=crop&w=300&q=80"
                            alt="Chicken">
                    </div>
                    <h3>Chicken</h3>
                    <p>5 Items</p>
                </div>

                <div class="category-card">
                    <div class="category-img">
                        <img src="https://images.unsplash.com/photo-1579871494447-9811cf80d66c?auto=format&fit=crop&w=300&q=80"
                            alt="Sushi">
                    </div>
                    <h3>Sushi</h3>
                    <p>12 Items</p>
                </div>

                <div class="category-card">
                    <div class="category-img">
                        <img src="https://images.unsplash.com/photo-1551024506-0bccd828d307?auto=format&fit=crop&w=300&q=80"
                            alt="Dessert">
                    </div>
                    <h3>Desserts</h3>
                    <p>15 Items</p>
                </div>

                <div class="category-card">
                    <div class="category-img">
                        <img src="https://images.unsplash.com/photo-1563379926898-05f4575a45d8?auto=format&fit=crop&w=300&q=80"
                            alt="Pasta">
                    </div>
                    <h3>Pasta</h3>
                    <p>10 Items</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Featured Restaurants -->
    <section class="section restaurants-section" id="restaurants">
    <div class="container">

        <div class="section-header-flex">
            <div>
                <span class="section-tag">⭐ Top Rated</span>
                <h2 class="section-title">Popular Restaurants</h2>
            </div>
            <a href="#" class="view-all-btn">
                View All <i class="fas fa-arrow-right"></i>
            </a>
        </div>

        <div class="restaurants-grid">

            <%
                List<Restaurant> restaurants =
                    (List<Restaurant>) request.getAttribute("allRestaurants");

                if (restaurants != null) {
                    for (Restaurant restaurant : restaurants) {
            %>
			<a href="menu?resId=<%=restaurant.getRestaurantId()%>">
            <div class="restaurant-card">
                <div class="restaurant-img">
                    <img src="<%= restaurant.getImagePath() %>">
                         alt="${ restaurant.getName() }">
                </div>

                <div class="restaurant-info">
                    <h3><%= restaurant.getName() %></h3>
                    <p class="restaurant-tags">
                        <%= restaurant.getCuisineType() %>
                    </p>
                    
                    <p class="restaurant-tags">
                        <%= restaurant.getAddress() %>
                    </p>
                    
                    <p class="restaurant-tags">
                        <%= restaurant.getRating() %>
                    </p>

                    <div class="restaurant-footer">
                        <span class="delivery-fee">
                            <i class="fas fa-motorcycle"></i> 
                            Free Delivery
                        </span>
                        <span class="min-order">
    							<%= restaurant.getDeliveryTime() %> min
						</span>

                    </div>
                </div>
            </div>
            </a>

            <%
                    }
                }
            %>

        </div>
    </div>
</section>


    
    

    <!-- Why Choose Us Section -->
    <section class="section why-us">
        <div class="container">
            <div class="why-us-header">
                <span class="section-tag">✨ Why JavaFoods</span>
                <h2 class="section-title-large">Why We Are The Best</h2>
            </div>

            <div class="features-grid">
                <div class="feature-card">
                    <div class="feature-number">01</div>
                    <div class="feature-icon">
                        <i class="fas fa-utensils"></i>
                    </div>
                    <h3>Wide Culinary Selection</h3>
                    <p>Choose from a diverse range of cuisines, satisfying cravings for every palate.</p>
                </div>

                <div class="feature-card">
                    <div class="feature-number">02</div>
                    <div class="feature-icon">
                        <i class="fas fa-shipping-fast"></i>
                    </div>
                    <h3>Fast Delivery</h3>
                    <p>Our efficient network ensures your food arrives fresh and hot, right on time.</p>
                </div>

                <div class="feature-card">
                    <div class="feature-number">03</div>
                    <div class="feature-icon">
                        <i class="fas fa-map-marked-alt"></i>
                    </div>
                    <h3>Real-time Tracking</h3>
                    <p>Stay informed with live order tracking, so you know exactly where your meal is.</p>
                </div>

                <div class="feature-card">
                    <div class="feature-number">04</div>
                    <div class="feature-icon">
                        <i class="fas fa-headset"></i>
                    </div>
                    <h3>24/7 Support</h3>
                    <p>Need assistance? Our support team is available around the clock to assist you.</p>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-top">
                <div class="footer-brand">
                    <a href="#" class="logo footer-logo">
                        <span class="logo-icon">🍽️</span>
                        <span class="logo-text">JavaFoods</span>
                    </a>
                    <p>Best food delivery service providing high quality food from the best restaurants in town.</p>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>

                <div class="footer-links">
                    <div class="footer-col">
                        <h3>Quick Links</h3>
                        <ul>
                            <li><a href="#">Home</a></li>
                            <li><a href="#">Menu</a></li>
                            <li><a href="#">Restaurants</a></li>
                            <li><a href="#">Offers</a></li>
                        </ul>
                    </div>

                    <div class="footer-col">
                        <h3>Support</h3>
                        <ul>
                            <li><a href="#">Help Center</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Terms of Service</a></li>
                            <li><a href="#">Contact Us</a></li>
                        </ul>
                    </div>

                    <div class="footer-col">
                        <h3>Contact</h3>
                        <ul class="contact-info">
                            <li><i class="fas fa-map-marker-alt"></i> 123 Food Street, Tasty City</li>
                            <li><i class="fas fa-phone"></i> +1 234 567 890</li>
                            <li><i class="fas fa-envelope"></i> info@javafoods.com</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="footer-bottom">
                <p>&copy; 2025 JavaFoods. All rights reserved.</p>
                <div class="payment-methods">
                    <i class="fab fa-cc-visa"></i>
                    <i class="fab fa-cc-mastercard"></i>
                    <i class="fab fa-cc-paypal"></i>
                    <i class="fab fa-cc-apple-pay"></i>
                </div>
            </div>
        </div>
    </footer>

    <script src="script.js"></script>
    <script>
        // Navbar Scroll Effect
        window.addEventListener('scroll', function () {
            const navbar = document.querySelector('.navbar');
            if (window.scrollY > 50) {
                navbar.classList.add('scrolled');
            } else {
                navbar.classList.remove('scrolled');
            }
        });

        // Mobile Menu Toggle
        const menuToggle = document.getElementById('menuToggle');
        const mobileMenu = document.getElementById('mobileMenu');

        menuToggle.addEventListener('click', function () {
            mobileMenu.classList.toggle('active');
            menuToggle.querySelector('i').classList.toggle('fa-bars');
            menuToggle.querySelector('i').classList.toggle('fa-times');
        });

        // Animate on scroll
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animate-in');
                }
            });
        }, observerOptions);

        document.querySelectorAll('.step-card, .category-card, .restaurant-card, .feature-card, .deal-card').forEach(el => {
            observer.observe(el);
        });
    </script>
</body>
</html>