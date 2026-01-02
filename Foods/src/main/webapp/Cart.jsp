<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="com.food.model.Cart,com.food.model.CartItem"%>
    
    <%
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null) {
        cart = new Cart();
        session.setAttribute("cart", cart);
    }
    Integer restaurantId = (Integer) session.getAttribute("oldRestaurantId");
    if (restaurantId == null) {
        response.sendRedirect("restaurant.jsp");
        return;

    }
%>
    

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="JavaFoods - Your Shopping Cart">
    <title>Cart</title>
    <link rel="stylesheet" href="common.css">
    <link rel="stylesheet" href="cartStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800;900&display=swap"
        rel="stylesheet">
</head>

<body>

<%if (!cart.getItems().isEmpty()){ %>
    <!-- Navbar -->
    <nav class="navbar scrolled">
        <div class="container navbar-container">
            <a href="Restaurant.jsp" class="logo">
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
                <a href="Cart.jsp" class="cart-btn active" id="cartBtn">
                    <i class="fas fa-shopping-bag"></i>
                    <span class="cart-count" id="cartCount"> <%= cart.getItemCount() %></span>
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

    <!-- Cart Hero Section -->
    <header class="cart-hero">
        <div class="cart-hero-bg">
            <div class="hero-glow hero-glow-1"></div>
            <div class="hero-glow hero-glow-2"></div>
        </div>
        <div class="container">
            <div class="cart-hero-content">
                <span class="cart-badge animate-fade-in-up">
                    <i class="fas fa-shopping-cart"></i> Your Cart
                </span>
                <h1 class="cart-title animate-fade-in-up" style="animation-delay: 0.1s;">
                    Review Your <span class="text-gradient-animated">Order</span>
                </h1>
                <p class="cart-subtitle animate-fade-in-up" style="animation-delay: 0.2s;">
                    Almost there! Review your delicious selections before checkout.
                </p>
            </div>
        </div>
    </header>



    <!-- Cart Section -->
    <section class="cart-section">
        <div class="container">
            <div class="cart-layout">
                <!-- Cart Items -->
                <div class="cart-items-wrapper">
                    <div class="cart-header">
                        <h2 class="cart-items-title">
                            <i class="fas fa-utensils"></i>
                            Cart Items <span class="item-count"><%=cart.getItemCount() %></span>
                        </h2>
                        
                        <form action="cart" method="get">
                        <input type="hidden" name="itemId" value="clear">
                        <input type="hidden" name="restaurantId" value="<%= restaurantId%>">
                        <input type="hidden" name="action" value="clear">
                        <button class="clear-cart-btn">
                            <i class="fas fa-trash-alt"></i>
                            Clear All
                        </button>
                        </form>
                        
                    </div>
                  
                    

			<%
		for(CartItem item : cart.getItems().values()){
			%>  
	              <!-- Cart Item 1 -->
                    <div class="cart-item">
                        <div class="cart-item-image">
                            <img src="https://cdn.shortpixel.ai/client/q_lossy,ret_img,w_1200/https://norecipes.com/wp-content/uploads/2017/05/chicken-biryani-12-1200x1799.jpg"
                                alt=<%= item.getName() %>>
                        </div>
                        <div class="cart-item-details">
                            <div class="cart-item-info">
                                <h3 class="cart-item-name"><%= item.getName() %></h3>
                                <p class="cart-item-description">item-description</p>
                                <div class="cart-item-tags">
                                    <span class="item-tag bestseller"><i class="fas fa-fire"></i> Bestseller</span>
                                </div>
                            </div>
                            
                            
                            <!-- increase decrease button(Quantity) -->
                            <div class="cart-item-actions">
                                <div class="quantity-selector">
                                
                                <form action = "cart" method="get">
                                    <input type="hidden" name="itemId" value="<%=item.getItemId() %>">
                                    <input type="hidden" name="action" value="update">
                                    <input type="hidden" name="restaurantId" value="<%=restaurantId%>">
                                    <input type="hidden" name="quantity" value="<%=item.getQuantity()+1%>">
                                    <button class="qty-btn plus"><i class="fas fa-plus"></i></button>
                                    </form>
                                    
                                    <span class="qty-value"><%= item.getQuantity() %></span>
                                    
                                    <form action = "cart" method="get">
                                    <input type="hidden" name="itemId" value="<%=item.getItemId() %>">
                                    <input type="hidden" name="action" value="update">
                                    <input type="hidden" name="restaurantId" value="<%=restaurantId%>">
                                    <input type="hidden" name="quantity" value="<%=item.getQuantity()-1%>">
                                    <button class="qty-btn minus"
								    <% if (item.getQuantity() == 1) {
								    %>disabled 
								    <%  }
								    %>><i class="fas fa-minus"></i>
								</button>
								 </form>
                                    
                                </div>
                                <div class="cart-item-price">
                                    <span class="price"><%= item.getPrice() %></span>
                                </div>
                                
                                 <!-- REMOVE ITEM -->
							    <form action="cart" method="get" style="display:inline;">
							        <input type="hidden" name="action" value="delete">
							          <input type="hidden" name="restaurantId" value="<%=restaurantId%>">	
							          <input type="hidden" name="itemId" value="<%= item.getItemId() %>">						        
							         <button class="remove-item-btn">
                                    <i class="fas fa-times"></i>
                                </button>
							    </form>
                                
                            </div>
                        </div>
                    </div>
				<%} %>
				      
					   
                    <!-- Add More Items -->
                    <a href="menu?restaurantId=<%=restaurantId %>" class="add-more-items">
                        <i class="fas fa-plus-circle"></i>
                        Add More Items
                    </a>
                </div>

                <!-- Order Summary -->
                <div class="order-summary">
                    <div class="summary-card">
                        <h3 class="summary-title">
                            <i class="fas fa-receipt"></i>
                            Order Summary
                        </h3>
						<%
					    double subTotal = cart.getTotalPrice();
					    double tax = subTotal * 0.05;
					    double grandTotal = subTotal + tax;
					%>
						
                        <div class="summary-details">
                            <div class="summary-row">
                                <span>Subtotal</span>
                               <span>₹<%= String.format("%.2f", subTotal) %></span>
                            </div>
                            <div class="summary-row">
                                <span>Delivery Fee</span>
                                <span class="delivery-free">FREE</span>
                            </div>
                            <div class="summary-row">
						    <span>Tax (5%)</span>
						    <span>₹<%= String.format("%.2f", tax) %></span>
						</div>
						
						
						
						<div class="summary-total">
						    <span>Total</span>
						    <span class="total-amount">₹<%= String.format("%.2f", grandTotal) %></span>
						</div>

						
						<% if (!cart.getItems().isEmpty()) { %>

						<form action="checkout.jsp" method="get">
						<button class="checkout-btn">
                            <span>Proceed to Checkout</span>
                            <i class="fas fa-arrow-right"></i>
                        </button>
						
						</form>
                        <%} %>

                        <div class="payment-icons">
                            <span>We Accept:</span>
                            <div class="payment-methods">
                                <i class="fab fa-cc-visa"></i>
                                <i class="fab fa-cc-mastercard"></i>
                                <i class="fab fa-cc-paypal"></i>
                                <i class="fab fa-cc-apple-pay"></i>
                            </div>
                        </div>
                    </div>
                    
                 
                   
                    

                    <!-- Delivery Info -->
                    <div class="delivery-info-card">
                        <div class="delivery-header">
                            <i class="fas fa-motorcycle"></i>
                            <div>
                                <h4>Estimated Delivery</h4>
                                <p>30-45 minutes</p>
                            </div>
                        </div>
                        <div class="delivery-note">
                            <i class="fas fa-info-circle"></i>
                            <span>Free delivery on orders above ₹499</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
      		<% 
			}else{
			%>
					    <!-- Empty Cart State (Hidden by default) -->
				    <section class="empty-cart-section">
				        <div class="container">
				            <div class="empty-cart-content">
				                <div class="empty-cart-icon">
				                    <i class="fas fa-shopping-cart"></i>
				                </div>
				                <h2>Your Cart is Empty</h2>
				                <p>Looks like you haven't added any delicious items yet!</p>
				                <a href="home" class="btn btn-primary btn-lg">
				                    <i class="fas fa-utensils"></i>
				                    Browse Menu
				                </a>
				            </div>
				        </div>
				    </section>
				   
				<%} %>
 
    
 

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
    
    
    <script type="text/javascript">
    const menuToggle = document.getElementById('menuToggle');
    const mobileMenu = document.getElementById('mobileMenu');

    if (menuToggle && mobileMenu) {
        menuToggle.addEventListener('click', function () {
            mobileMenu.classList.toggle('active');
            menuToggle.querySelector('i').classList.toggle('fa-bars');
            menuToggle.querySelector('i').classList.toggle('fa-times');
        });
    }
    </script>
    
</body>

</html>