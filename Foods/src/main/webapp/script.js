/* =====================================================
   MAIN SCRIPT
   JavaFoods - Interactive Elements
   ===================================================== */

document.addEventListener('DOMContentLoaded', () => {
    
    // Smooth Scroll for Internal Links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth'
                });
            }
        });
    });

    // Mobile Menu Toggle
    const menuToggle = document.querySelector('.menu-toggle');
    const navLinks = document.querySelector('.nav-links');
    
    if (menuToggle) {
        menuToggle.addEventListener('click', () => {
            navLinks.classList.toggle('active');
            
            // Create a simple mobile menu overlay if it doesn't exist
            let mobileMenu = document.querySelector('.mobile-menu-overlay');
            if (!mobileMenu) {
                mobileMenu = document.createElement('div');
                mobileMenu.className = 'mobile-menu-overlay';
                mobileMenu.style.position = 'fixed';
                mobileMenu.style.top = '80px';
                mobileMenu.style.left = '0';
                mobileMenu.style.width = '100%';
                mobileMenu.style.background = 'white';
                mobileMenu.style.padding = '2rem';
                mobileMenu.style.boxShadow = '0 10px 20px rgba(0,0,0,0.1)';
                mobileMenu.style.display = 'none';
                mobileMenu.style.flexDirection = 'column';
                mobileMenu.style.gap = '1rem';
                mobileMenu.style.animation = 'slideInRight 0.3s ease';
                
                // Clone links
                const links = document.querySelectorAll('.nav-link');
                links.forEach(link => {
                    const mobileLink = link.cloneNode(true);
                    mobileLink.style.fontSize = '1.2rem';
                    mobileMenu.appendChild(mobileLink);
                });
                
                document.body.appendChild(mobileMenu);
            }
            
            if (mobileMenu.style.display === 'none') {
                mobileMenu.style.display = 'flex';
                menuToggle.innerHTML = '<i class="fas fa-times"></i>';
            } else {
                mobileMenu.style.display = 'none';
                menuToggle.innerHTML = '<i class="fas fa-bars"></i>';
            }
        });
    }

    // Wishlist Button Animation
    const wishlistBtns = document.querySelectorAll('.wishlist-btn');
    wishlistBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const icon = this.querySelector('i');
            if (icon.classList.contains('far')) {
                icon.classList.remove('far');
                icon.classList.add('fas');
                icon.style.color = '#E63946';
                this.style.transform = 'scale(1.1)';
                setTimeout(() => this.style.transform = 'scale(1)', 200);
            } else {
                icon.classList.remove('fas');
                icon.classList.add('far');
                icon.style.color = 'inherit';
            }
        });
    });

    // Intersection Observer for Scroll Animations
    const observerOptions = {
        threshold: 0.1
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('animate-fade-in-up');
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);

    document.querySelectorAll('.category-card, .restaurant-card').forEach((el, index) => {
        el.style.opacity = '0';
        el.style.animationDelay = `${index * 0.1}s`;
        observer.observe(el);
    });

});
