<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@page import="java.util.List,com.food.model.Menu"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="JavaFoods - Explore our delicious menu of Indian and international cuisines">
    <title>Menu</title>
    <link rel="stylesheet" href="common.css">
    <link rel="stylesheet" href="menuStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800;900&display=swap"
        rel="stylesheet">
</head>

<body>
    <!-- Navbar -->
    <nav class="navbar">
        <div class="container navbar-container">
            <a href="home.html" class="logo">
                <span class="logo-icon">🍽️</span>
                <span class="logo-text">JavaFoods</span>
            </a>

            <div class="nav-links">
                <a href="Restaurant.jsp" class="nav-link">Home</a>
                <a href="menu.jsp" class="nav-link">Menu</a>
                <a href="home.html#restaurants" class="nav-link">Restaurants</a>
                <a href="home.html#offers" class="nav-link">Offers</a>
            </div>

            <div class="nav-actions">
                <a href="#" class="cart-btn" id="cartBtn">
                    <i class="fas fa-shopping-bag"></i>
                    <span class="cart-count" id="cartCount">0</span>
                </a>
                <a href="login.html" class="btn btn-nav">Sign In</a>
                <button class="menu-toggle" id="menuToggle">
                    <i class="fas fa-bars"></i>
                </button>
            </div>
        </div>

        <!-- Mobile Menu -->
        <div class="mobile-menu" id="mobileMenu">
            <a href="home.html" class="mobile-link">Home</a>
            <a href="menu.html" class="mobile-link">Menu</a>
            <a href="home.html#restaurants" class="mobile-link">Restaurants</a>
            <a href="home.html#offers" class="mobile-link">Offers</a>
            <a href="login.html" class="mobile-link">Sign In</a>
        </div>
    </nav>

    <!-- Menu Hero Section -->
    <header class="menu-hero">
        <div class="menu-hero-bg">
            <div class="hero-glow hero-glow-1"></div>
            <div class="hero-glow hero-glow-2"></div>
            <div class="floating-food food-1">🍛</div>
            <div class="floating-food food-2">🍕</div>
            <div class="floating-food food-3">🌮</div>
            <div class="floating-food food-4">🍜</div>
        </div>
        <div class="container">
            <div class="menu-hero-content">
                <span class="menu-badge animate-fade-in-up">
                    <i class="fas fa-utensils"></i> Our Menu
                </span>
                <h1 class="menu-title animate-fade-in-up" style="animation-delay: 0.1s;">
                    Discover <span class="text-gradient-animated">Delicious</span> Dishes
                </h1>
                <p class="menu-subtitle animate-fade-in-up" style="animation-delay: 0.2s;">
                    From authentic Indian flavors to international favorites, explore our carefully curated selection of
                    dishes.
                </p>
            </div>
        </div>
    </header>

    <!-- Category Filter -->
    <section class="category-filter">
        <div class="container">
            <div class="filter-wrapper">
                <button class="filter-btn active" data-filter="all">
                    <span class="filter-icon">🍽️</span>
                    All Dishes
                </button>
                <button class="filter-btn" data-filter="indian">
                    <span class="filter-icon">🍛</span>
                    Indian
                </button>
                <button class="filter-btn" data-filter="pizza">
                    <span class="filter-icon">🍕</span>
                    Pizza
                </button>
                <button class="filter-btn" data-filter="burger">
                    <span class="filter-icon">🍔</span>
                    Burgers
                </button>
                <button class="filter-btn" data-filter="asian">
                    <span class="filter-icon">🍜</span>
                    Asian
                </button>
            </div>
        </div>
    </section>

    <!-- Menu Grid Section -->
    <section class="menu-section">
        <div class="container">
            <div class="menu-grid" id="menuGrid">
           <%
           List<Menu> allMenusByRestaurant = (List<Menu>) request.getAttribute("allMenusByRestaurant");
           if(allMenusByRestaurant != null && !allMenusByRestaurant.isEmpty()){
               for(Menu menu : allMenusByRestaurant){
           %>
                <!-- Menu Item 1 - Butter Chicken -->
                <div class="menu-card" data-category="indian">
                    <div class="menu-card-image">
                        <img src="<%= menu.getImagePath() %>"
                            alt="${menu.getItemName() }">
                        <div class="menu-card-overlay">
                            <span class="menu-tag bestseller">
                                <i class="fas fa-fire"></i> Bestseller
                            </span>
                        </div>
                        <button class="wishlist-btn"><i class="far fa-heart"></i></button>
                    </div>
                    <div class="menu-card-content">
                        <div class="menu-card-header">
                            <h3 class="menu-item-name"><%= menu.getItemName() %></h3>
                            <div class="menu-rating">
                                <i class="fas fa-star"></i>
                                <span>4.8</span>
                            </div>
                        </div>
                        <p class="menu-item-description"><%= menu.getDescription() %></p>
                        <div class="menu-card-footer">
                            <div class="menu-price">
                                <span class="price-current"><%= menu.getPrice() %></span>
                            </div>
                            
                                
                            <form action="cart"  class="add-to-cart-form">
    
							    <!-- Hidden technical fields -->
							    <input type="hidden" name="itemId" value="<%= menu.getMenuID() %>">
							    <input type="hidden" name="restaurantId" value="<%= menu.getRestaurantId() %>">
							    <input type="hidden" name="quantity" value="1">
							    <input type="hidden" name="action" value="add">

							    <!-- Styled submit button -->
							    <button type="submit" class="add-to-cart-btn">
							        <i class="fas fa-plus"></i>
							        Add To Cart
								</button>

							</form>


                          
                        </div>
                    </div>
                </div>
				<%
				    }
				} else {
				%>
				    <p>No menu items available.</p>
				<%
				}
				%>
            </div>
        </div>
    </section>

    <!-- Cart Notification Toast -->
    <div class="cart-toast" id="cartToast">
        <div class="toast-content">
            <i class="fas fa-check-circle"></i>
            <span>Item added to cart!</span>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-top">
                <div class="footer-brand">
                    <a href="home.html" class="logo footer-logo">
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
                            <li><a href="home.html">Home</a></li>
                            <li><a href="menu.html">Menu</a></li>
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

    <script>
       
        // Wishlist buttons
        document.querySelectorAll('.wishlist-btn').forEach(btn => {
            btn.addEventListener('click', function () {
                this.classList.toggle('active');
                const icon = this.querySelector('i');
                if (this.classList.contains('active')) {
                    icon.classList.remove('far');
                    icon.classList.add('fas');
                } else {
                    icon.classList.remove('fas');
                    icon.classList.add('far');
                }
            });
        });

        // Filter functionality
        const filterBtns = document.querySelectorAll('.filter-btn');
        const menuCards = document.querySelectorAll('.menu-card');

        filterBtns.forEach(btn => {
            btn.addEventListener('click', function () {
                // Remove active class from all buttons
                filterBtns.forEach(b => b.classList.remove('active'));
                // Add active class to clicked button
                this.classList.add('active');

                const filter = this.dataset.filter;

                menuCards.forEach(card => {
                    if (filter === 'all' || card.dataset.category === filter) {
                        card.style.display = 'block';
                        card.classList.add('animate-in');
                    } else {
                        card.style.display = 'none';
                        card.classList.remove('animate-in');
                    }
                });
            });
        });

        // Navbar scroll effect
        window.addEventListener('scroll', function () {
            const navbar = document.querySelector('.navbar');
            if (window.scrollY > 50) {
                navbar.classList.add('scrolled');
            } else {
                navbar.classList.remove('scrolled');
            }
        });

        // Mobile menu toggle
        const menuToggle = document.getElementById('menuToggle');
        const mobileMenu = document.getElementById('mobileMenu');

        menuToggle.addEventListener('click', function () {
            mobileMenu.classList.toggle('active');
            menuToggle.querySelector('i').classList.toggle('fa-bars');
            menuToggle.querySelector('i').classList.toggle('fa-times');
        });

        // Animate cards on scroll
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

        document.querySelectorAll('.menu-card').forEach(el => {
            observer.observe(el);
        });
    </script>
</body>

</html>