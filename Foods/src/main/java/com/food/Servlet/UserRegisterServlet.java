package com.food.Servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.food.dao.UserDAO;
import com.food.daoimplementation.UserDAOImpl;
import com.food.model.User;

@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAOImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

       
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        String password = req.getParameter("password");

        //Basic validation
        if (name == null || email == null || password == null ||
            name.isEmpty() || email.isEmpty() || password.isEmpty()) {

            resp.sendRedirect("register.html?error=empty");
            return;
        }

        //Create User object
        User user = new User();
        user.setUsername(name);    
        user.setEmail(email);
        user.setAddress(address);
        user.setPassword(password);
        user.setRole("USER");
       

        boolean isRegistered = userDAO.registerUser(user);

        if (isRegistered) {
            //Registration success...go to login
            resp.sendRedirect("login.html?success=registered");
        } else {
            //User already exists
            resp.sendRedirect("register.html?error=exists");
        }
    }
}