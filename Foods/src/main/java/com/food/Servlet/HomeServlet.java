package com.food.Servlet;

import java.io.IOException;
import java.util.List;

import com.food.dao.RestaurantDAO;
import com.food.daoimplementation.RestaurantDAOImpl;
import com.food.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/home")
public class HomeServlet extends HttpServlet{
 @Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	 RestaurantDAO daoImpl=new RestaurantDAOImpl();
	 
	 List<Restaurant> allRestaurants =daoImpl.getAllRestaurants();
	 
	 for(Restaurant restaurant : allRestaurants) {
		 
	 }
	req.setAttribute("allRestaurants", allRestaurants);
		 RequestDispatcher rd=req.getRequestDispatcher("Restaurant.jsp");
		 rd.forward(req, resp);

}
 }
