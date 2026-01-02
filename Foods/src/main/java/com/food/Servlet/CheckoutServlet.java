package com.food.Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.food.daoimplementation.OrderDAOImpl;
import com.food.daoimplementation.OrderItemDAOImpl;
import com.food.model.Cart;
import com.food.model.CartItem;
import com.food.model.Order;
import com.food.model.OrderItem;
import com.food.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 HttpSession session=req.getSession();
		 Cart cart =(Cart)session.getAttribute("cart");
		 User user =(User)session.getAttribute("user");
		 
		 int restaurantId =(Integer) session.getAttribute("oldRestaurantId");
		 
		 String address = req.getParameter("address");
		 String payment =req.getParameter("payment");
		 
		 if(user == null) {
			 RequestDispatcher rd = req.getRequestDispatcher("login.html");
			 rd.forward(req, resp);
		 }
		 
		 if(cart!= null && user != null && !cart.getItems().isEmpty()) {
			 
			 Order order =new Order();
			 
			 order.setUserId(user.getUserId());
			 order.setRestaurantId(restaurantId);
			 order.setOrderDate(new Timestamp(System.currentTimeMillis()));
			 order.setAddress(address);
			 order.setStatus("Pending");
			 order.setPaymentMethod(payment);
			 
			 
			 double totalAmount=0.0;
			 
			 for(CartItem item : cart.getItems().values()) {
				totalAmount += item.getQuantity() * item.getPrice(); 
			 }
			 order.setTotalAmount(totalAmount);
			 
			 try {
				OrderDAOImpl orderDAOImpl = new OrderDAOImpl();
				
				int orderId =orderDAOImpl.addOrder(order);
				
				for(CartItem item : cart.getItems().values()) {
					int itemId= item.getItemId();
					int quantity =item.getQuantity();
					double totalPrice =item.getPrice();
					
					OrderItem orderItem = new OrderItem();
					
					orderItem.setOrderId(orderId);
					orderItem.setMenuId(orderId);
					orderItem.setQuantity(quantity);
					orderItem.setItemTotal(totalPrice);
					
					OrderItemDAOImpl orderItemDAOImpl = new OrderItemDAOImpl();
					
					orderItemDAOImpl.addOrderItem(orderItem);
				 }
				
				
				
			} catch (ClassNotFoundException | SQLException e) {
			resp.sendRedirect("cart.jsp");	
			}
			 
			 session.removeAttribute("cart");
			 
			 session.removeAttribute("oldRestaurantId");
			 
			 resp.sendRedirect("orderConfirmation.jsp");
			 
		 }
		 else {
			 resp.sendRedirect("cart.jsp");
		 }
	}
	
}
