<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="JavaFoods - Secure Checkout">
    <title>JavaFoods | Checkout</title>
    <link rel="stylesheet" href="common.css">
    <link rel="stylesheet" href="checkoutStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800;900&display=swap"
        rel="stylesheet">
</head>

<body>
    <!-- Navbar -->
    <nav class="navbar scrolled">
        <div class="container navbar-container">
            <a href="home.html" class="logo">
                <span class="logo-icon">🍽️</span>
                <span class="logo-text">JavaFoods</span>
            </a>
            <div class="nav-links">
                <a href="home.html" class="nav-link">Home</a>
                <a href="menu.html" class="nav-link">Menu</a>
                <a href="home.html#restaurants" class="nav-link">Restaurants</a>
                <a href="home.html#offers" class="nav-link">Offers</a>
            </div>
            <div class="nav-actions">
                <a href="cart.html" class="cart-btn" id="cartBtn">
                    <i class="fas fa-shopping-bag"></i>
                    <span class="cart-count" id="cartCount">3</span>
                </a>
                <a href="login.html" class="btn btn-nav">Sign In</a>
                <button class="menu-toggle" id="menuToggle"><i class="fas fa-bars"></i></button>
            </div>
        </div>
        <div class="mobile-menu" id="mobileMenu">
            <a href="home.html" class="mobile-link">Home</a>
            <a href="menu.html" class="mobile-link">Menu</a>
            <a href="home.html#restaurants" class="mobile-link">Restaurants</a>
            <a href="home.html#offers" class="mobile-link">Offers</a>
            <a href="login.html" class="mobile-link">Sign In</a>
        </div>
    </nav>

    <!-- Checkout Hero -->
    <header class="checkout-hero">
        <div class="checkout-hero-bg">
            <div class="hero-glow hero-glow-1"></div>
            <div class="hero-glow hero-glow-2"></div>
        </div>
        <div class="container">
            <div class="checkout-hero-content">
                <span class="checkout-badge animate-fade-in-up"><i class="fas fa-lock"></i> Secure Checkout</span>
                <h1 class="checkout-title animate-fade-in-up" style="animation-delay: 0.1s;">Complete Your <span
                        class="text-gradient-animated">Order</span></h1>
                <p class="checkout-subtitle animate-fade-in-up" style="animation-delay: 0.2s;">You're just a few steps
                    away from delicious food!</p>
            </div>
        </div>
    </header>

    <!-- Progress Steps -->
    <section class="progress-section">
        <div class="container">
            <div class="checkout-progress">
                <div class="progress-step completed">
                    <div class="step-icon"><i class="fas fa-check"></i></div><span class="step-label">Cart</span>
                </div>
                <div class="progress-line completed"></div>
                <div class="progress-step active">
                    <div class="step-icon"><span>2</span></div><span class="step-label">Checkout</span>
                </div>
                <div class="progress-line"></div>
                <div class="progress-step">
                    <div class="step-icon"><span>3</span></div><span class="step-label">Confirmation</span>
                </div>
            </div>
        </div>
    </section>

    <!-- Checkout Section -->
    <section class="checkout-section">
        <div class="container">
            <div class="checkout-layout">
                <!-- Checkout Form -->
                <form action="checkout" method="post">

    <div class="checkout-form-wrapper">
        <!-- Delivery Address -->
        <div class="checkout-card">
            <div class="card-header">
                <div class="header-icon"><i class="fas fa-map-marker-alt"></i></div>
                <div class="header-text">
                    <h2>Delivery Address</h2>
                    <p>Where should we deliver your order?</p>
                </div>
            </div>

            <div class="card-body">
                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label">Full Name</label>
                        <div class="input-wrapper">
                            <i class="fas fa-user"></i>
                            <input type="text" name="fullName" class="form-input" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Phone Number</label>
                        <div class="input-wrapper">
                            <i class="fas fa-phone"></i>
                            <input type="tel" name="phone" class="form-input" required>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">Address</label>
                    <div class="input-wrapper">
                        <i class="fas fa-home"></i>
                        <input type="text" name="address" class="form-input" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label">City</label>
                        <div class="input-wrapper">
                            <i class="fas fa-city"></i>
                            <input type="text" name="city" class="form-input" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="form-label">State</label>
                        <div class="input-wrapper">
                            <i class="fas fa-map"></i>
                            <input type="text" name="state" class="form-input" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="form-label">PIN Code</label>
                        <div class="input-wrapper">
                            <i class="fas fa-mail-bulk"></i>
                            <input type="text" name="pincode" class="form-input" required>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">Delivery Instructions</label>
                    <div class="input-wrapper textarea-wrapper">
                        <i class="fas fa-sticky-note"></i>
                        <textarea name="instructions" class="form-input form-textarea"></textarea>
                    </div>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="place-order-btn">
                    Place Order
                </button>
            </div>
        </div>
    </div>



                    <!-- Delivery Time -->
                    <div class="checkout-card">
                        <div class="card-header">
                            <div class="header-icon"><i class="fas fa-clock"></i></div>
                            <div class="header-text">
                                <h2>Delivery Time</h2>
                                <p>When would you like your order?</p>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="delivery-time-options">
                                <label class="time-option"><input type="radio" name="deliveryTime" value="asap" checked>
                                    <div class="time-card">
                                        <div class="time-icon"><i class="fas fa-bolt"></i></div>
                                        <div class="time-details"><span class="time-title">ASAP</span><span
                                                class="time-estimate">30-45 minutes</span></div>
                                        <div class="time-badge popular">Most Popular</div>
                                    </div>
                                </label>
                                <label class="time-option"><input type="radio" name="deliveryTime" value="scheduled">
                                    <div class="time-card">
                                        <div class="time-icon"><i class="fas fa-calendar-alt"></i></div>
                                        <div class="time-details"><span class="time-title">Schedule</span><span
                                                class="time-estimate">Choose a time</span></div>
                                    </div>
                                </label>
                            </div>
                            <div class="schedule-picker" id="schedulePicker" style="display: none;">
                                <div class="form-row">
                                    <div class="form-group"><label class="form-label">Date</label>
                                        <div class="input-wrapper"><i class="fas fa-calendar"></i><input type="date"
                                                class="form-input"></div>
                                    </div>
                                    <div class="form-group"><label class="form-label">Time</label>
                                        <div class="input-wrapper"><i class="fas fa-clock"></i><select
                                                class="form-input form-select">
                                                <option>12:00 PM - 12:30 PM</option>
                                                <option>12:30 PM - 1:00 PM</option>
                                                <option>6:00 PM - 6:30 PM</option>
                                                <option>7:00 PM - 7:30 PM</option>
                                            </select></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Payment Method -->
                    <div class="checkout-card">
                        <div class="card-header">
                            <div class="header-icon"><i class="fas fa-credit-card"></i></div>
                            <div class="header-text">
                                <h2>Payment Method</h2>
                                <p>Choose how you'd like to pay</p>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="payment-options">
                                <label class="payment-option"><input type="radio" name="payment" value="card" checked>
                                    <div class="payment-card">
                                        <div class="payment-icon"><i class="fas fa-credit-card"></i></div><span
                                            class="payment-title">Credit/Debit Card</span>
                                        <div class="card-brands"><i class="fab fa-cc-visa"></i><i
                                                class="fab fa-cc-mastercard"></i></div>
                                    </div>
                                </label>
                                <label class="payment-option"><input type="radio" name="payment" value="paypal">
                                    <div class="payment-card">
                                        <div class="payment-icon paypal"><i class="fab fa-paypal"></i></div><span
                                            class="payment-title">PayPal</span>
                                    </div>
                                </label>
                                <label class="payment-option"><input type="radio" name="payment" value="applepay">
                                    <div class="payment-card">
                                        <div class="payment-icon apple"><i class="fab fa-apple-pay"></i></div><span
                                            class="payment-title">Apple Pay</span>
                                    </div>
                                </label>
                                <label class="payment-option"><input type="radio" name="payment" value="cash">
                                    <div class="payment-card">
                                        <div class="payment-icon cash"><i class="fas fa-money-bill-wave"></i></div><span
                                            class="payment-title">Cash on Delivery</span>
                                    </div>
                                </label>
                            </div>
                            <div class="card-details-form" id="cardDetailsForm">
                                <div class="form-group"><label class="form-label">Card Number</label>
                                    <div class="input-wrapper"><i class="fas fa-credit-card"></i><input type="text"
                                            class="form-input" placeholder="1234 5678 9012 3456" maxlength="19"></div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group"><label class="form-label">Name on Card</label>
                                        <div class="input-wrapper"><i class="fas fa-user"></i><input type="text"
                                                class="form-input" placeholder="John Doe"></div>
                                    </div>
                                    <div class="form-group"><label class="form-label">Expiry Date</label>
                                        <div class="input-wrapper"><i class="fas fa-calendar"></i><input type="text"
                                                class="form-input" placeholder="MM/YY" maxlength="5"></div>
                                    </div>
                                    <div class="form-group"><label class="form-label">CVV</label>
                                        <div class="input-wrapper"><i class="fas fa-lock"></i><input type="password"
                                                class="form-input" placeholder="***" maxlength="4"></div>
                                    </div>
                                </div>
                                <div class="save-card-option"><label class="checkbox-wrapper"><input
                                            type="checkbox"><span class="checkmark"></span><span>Save this card for
                                            future orders</span></label></div>
                            </div>
                        </div>
                    </div>
                </div>
			</form>
                <!-- Order Summary -->
                <div class="order-summary">
                    <div class="summary-card sticky-card">
                        <h3 class="summary-title"><i class="fas fa-receipt"></i> Order Summary</h3>
                        <div class="order-items">
                            <div class="order-item">
                                <div class="item-image"><img
                                        src="https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?auto=format&fit=crop&w=60&q=80"
                                        alt="Butter Chicken"></div>
                                <div class="item-details"><span class="item-name">Butter Chicken</span><span
                                        class="item-qty">x1</span></div><span class="item-price">$16.99</span>
                            </div>
                            <div class="order-item">
                                <div class="item-image"><img
                                        src="https://images.unsplash.com/photo-1574071318508-1cdbab80d002?auto=format&fit=crop&w=60&q=80"
                                        alt="Pizza"></div>
                                <div class="item-details"><span class="item-name">Margherita Pizza</span><span
                                        class="item-qty">x2</span></div><span class="item-price">$29.98</span>
                            </div>
                            <div class="order-item">
                                <div class="item-image"><img
                                        src="https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?auto=format&fit=crop&w=60&q=80"
                                        alt="Biryani"></div>
                                <div class="item-details"><span class="item-name">Hyderabadi Biryani</span><span
                                        class="item-qty">x1</span></div><span class="item-price">$18.99</span>
                            </div>
                        </div>
                        <a href="cart.html" class="edit-cart-link"><i class="fas fa-edit"></i> Edit Cart</a>
                        <div class="summary-divider"></div>
                        
                        
                        <div class="summary-total"><span>Total</span><span class="total-amount">$62.66</span></div>
                        <button class="place-order-btn" id="placeOrderBtn"><i class="fas fa-lock"></i><span>Place
                                Order</span><i class="fas fa-arrow-right"></i></button>
                        <div class="security-badges">
                            <div class="security-badge"><i class="fas fa-shield-alt"></i><span>Secure</span></div>
                            <div class="security-badge"><i class="fas fa-undo"></i><span>Easy Refunds</span></div>
                        </div>
                        <p class="terms-text">By placing this order, you agree to our <a href="#">Terms</a> and <a
                                href="#">Privacy Policy</a></p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-top">
                <div class="footer-brand">
                    <a href="home.html" class="logo footer-logo"><span class="logo-icon">🍽️</span><span
                            class="logo-text">JavaFoods</span></a>
                    <p>Best food delivery service providing high quality food from the best restaurants in town.</p>
                    <div class="social-links"><a href="#"><i class="fab fa-facebook-f"></i></a><a href="#"><i
                                class="fab fa-twitter"></i></a><a href="#"><i class="fab fa-instagram"></i></a><a
                            href="#"><i class="fab fa-linkedin-in"></i></a></div>
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
                <div class="payment-methods"><i class="fab fa-cc-visa"></i><i class="fab fa-cc-mastercard"></i><i
                        class="fab fa-cc-paypal"></i><i class="fab fa-cc-apple-pay"></i></div>
            </div>
        </div>
    </footer>

    <script>
        const menuToggle = document.getElementById('menuToggle');
        const mobileMenu = document.getElementById('mobileMenu');
        menuToggle.addEventListener('click', function () { mobileMenu.classList.toggle('active'); menuToggle.querySelector('i').classList.toggle('fa-bars'); menuToggle.querySelector('i').classList.toggle('fa-times'); });

        document.querySelectorAll('input[name="deliveryTime"]').forEach(option => { option.addEventListener('change', function () { document.getElementById('schedulePicker').style.display = this.value === 'scheduled' ? 'block' : 'none'; }); });

        document.querySelectorAll('input[name="payment"]').forEach(option => { option.addEventListener('change', function () { document.getElementById('cardDetailsForm').style.display = this.value === 'card' ? 'block' : 'none'; }); });

        document.getElementById('placeOrderBtn').addEventListener('click', function () { this.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Processing...'; this.disabled = true; setTimeout(() => { this.innerHTML = '<i class="fas fa-check"></i> Order Placed!'; this.style.background = 'linear-gradient(135deg, var(--accent-green) 0%, var(--accent-green-dark) 100%)'; setTimeout(() => { alert('Order placed successfully! Thank you for ordering with JavaFoods.'); }, 500); }, 2000); });
    </script>
</body>

</html>