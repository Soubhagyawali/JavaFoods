package com.food.Servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.MenuDAO;
import com.food.daoimplementation.MenuDAOImpl;
import com.food.model.Menu;



@WebServlet("/menu")


public class MenuServlet extends HttpServlet 
{
		
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			 
			String resIdParam = req.getParameter("resId");
			 if (resIdParam == null) {
			        resp.getWriter().println("Restaurant ID missing");
			        return;
			    }
			  int restaurantId = Integer.parseInt(resIdParam);
			
			MenuDAO menuDaoImpl = new MenuDAOImpl();
			
			List<Menu> allMenusByRestaurant = menuDaoImpl.getMenuByRestaurantById(restaurantId);
			
			req.setAttribute("allMenusByRestaurant", allMenusByRestaurant != null ? allMenusByRestaurant : new ArrayList<>());
			
			RequestDispatcher rd = req.getRequestDispatcher("menu.jsp");
			rd.forward(req, resp);
		
		}
		
	
	
}
