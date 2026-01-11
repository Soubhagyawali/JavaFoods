package com.food.Servlet;

import java.io.IOException;

import com.food.daoimplementation.MenuDAOImpl;
import com.food.model.Cart;
import com.food.model.CartItem;
import com.food.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
 @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	 
	 HttpSession session =req.getSession();
	 
	 Cart cart =(Cart)session.getAttribute("cart");
	 Integer oldRestaurantId =(Integer)session.getAttribute("oldRestaurantId");

	 String restaurantIdStr = req.getParameter("restaurantId");


	 if ((restaurantIdStr == null || restaurantIdStr.equals("null")) && oldRestaurantId != null) {
	     restaurantIdStr = String.valueOf(oldRestaurantId);
	 }


	 if (restaurantIdStr == null || restaurantIdStr.equals("null")) {
	     resp.sendRedirect("restaurant.jsp");
	     return;
	 }

	 int restaurantId = Integer.parseInt(restaurantIdStr);
	 
	 if (cart == null || oldRestaurantId == null || !oldRestaurantId.equals(restaurantId)) {
		    cart = new Cart();
		    session.setAttribute("cart", cart);
		    session.setAttribute("oldRestaurantId", restaurantId);
		}
	 
	 String action = req.getParameter("action");
	 
	 if(action.equals("add")) {
		 addItemToCart(req,cart);
	 }else if(action.equals("update")) {
		 updateItemToCart(req,cart);
	 }else if(action.equals("delete")) {
		deleteItemToCart(req,cart);
	 }else if(action.equals("clear")) {
		cart.clear();
	}
	 
	 resp.sendRedirect("Cart.jsp");
	 
	}

 
 



 private void addItemToCart(HttpServletRequest req, Cart cart) {
	 int itemId = Integer.parseInt(req.getParameter("itemId"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		

			MenuDAOImpl menudaoimpl = new MenuDAOImpl();
			Menu menu=menudaoimpl.getMenu(itemId);
			
			String itemName = menu.getItemName();
			double itemPrice =menu.getPrice();
			 String imageUrl = menu.getImagePath();
			
			CartItem cartItem=new CartItem(itemId, itemName, quantity, itemPrice,imageUrl);
			cart.addItem(cartItem);

 }
 
 
 private void updateItemToCart(HttpServletRequest req, Cart cart) {
	 int itemId = Integer.parseInt(req.getParameter("itemId"));
     int quantity = Integer.parseInt(req.getParameter("quantity"));

     if (quantity <= 0) {
         cart.removeItem(itemId);
     } else {
         cart.updateItem(itemId, quantity);
     }
}
 
 
 private void deleteItemToCart(HttpServletRequest req, Cart cart) {
	  int itemId = Integer.parseInt(req.getParameter("itemId"));
     cart.removeItem(itemId);

}
}
