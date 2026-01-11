package com.food.daoimplementation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.OrderDAO;
import com.food.model.Order;

public class OrderDAOImpl implements OrderDAO {

	private Connection connection;
	
	public OrderDAOImpl() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/tapfood_db", "root","Sou@2bu22cb054");
	}

	
	
	@Override
	public int addOrder(Order o) {

	    int orderId = 0;

	    String sql = "INSERT INTO `order` (userId, resId, orderDate, totalAmt, status, paymentMode) "
	               + "VALUES (?, ?, ?, ?, ?, ?)";

	    try (PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

	        statement.setInt(1, o.getUserId());
	        statement.setInt(2, o.getRestaurantId());
	        statement.setTimestamp(3, o.getOrderDate());
	        statement.setDouble(4, o.getTotalAmount());
	        statement.setString(5, o.getStatus());
	        statement.setString(6, o.getPaymentMethod());

	        int affectedRows = statement.executeUpdate();

	        if (affectedRows == 0) {
	            throw new SQLException("Creating order failed, no rows affected.");
	        }

	        try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
	            if (generatedKeys.next()) {
	                orderId = generatedKeys.getInt(1);
	            } else {
	                throw new SQLException("Creating order failed, no ID obtained.");
	            }
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return orderId;
	}
	
	

	@Override
	public Order getOrder(int orderId) {
		
		    Order order = null;

		    String sql ="SELECT * FROM order WHERE orderId = ?";

		    try (PreparedStatement statement = connection.prepareStatement(sql)) {

		        statement.setInt(1, orderId);

		        try (ResultSet rs = statement.executeQuery()) {

		            if (rs.next()) {
		                order = new Order();
		                order.setOrderId(rs.getInt("OrderID"));
		                order.setUserId(rs.getInt("UserID"));
		                order.setRestaurantId(rs.getInt("RestaurantID"));
		                order.setOrderDate(rs.getTimestamp("OrderDate"));
		                order.setTotalAmount(rs.getDouble("TotalAmount"));
		                order.setStatus(rs.getString("Status"));
		                order.setPaymentMethod(rs.getString("PaymentMethod"));
		            }
		        }

		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return order;
		
	}

	@Override
	public boolean updateOrder(Order o) {

	    String sql = "UPDATE order SET status = ?, paymentMode= ? WHERE orderId = ?";

	    try (PreparedStatement statement = connection.prepareStatement(sql)) {

	        statement.setString(1, o.getStatus());
	        statement.setString(2, o.getPaymentMethod());
	        statement.setInt(3, o.getOrderId());

	        int affectedRows = statement.executeUpdate();

	        return affectedRows > 0;

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return false;
	}

	@Override
	public boolean deleteOrder(int orderId) {

	    String sql = "DELETE FROM orders WHERE OrderID = ?";

	    try (PreparedStatement statement = connection.prepareStatement(sql)) {

	        statement.setInt(1, orderId);

	        int affectedRows = statement.executeUpdate();

	        return affectedRows > 0;

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return false;
	}

	@Override
	public List<Order> getAllOrders() {

	    List<Order> orders = new ArrayList<>();

	    String sql = "SELECT * FROM order";

	    try (PreparedStatement statement = connection.prepareStatement(sql);
	         ResultSet rs = statement.executeQuery()) {

	        while (rs.next()) {
	            Order order = new Order();
	            order.setOrderId(rs.getInt("OrderID"));
	            order.setUserId(rs.getInt("UserID"));
	            order.setRestaurantId(rs.getInt("RestaurantID"));
	            order.setOrderDate(rs.getTimestamp("OrderDate"));
	            order.setTotalAmount(rs.getDouble("TotalAmount"));
	            order.setStatus(rs.getString("Status"));
	            order.setPaymentMethod(rs.getString("PaymentMethod"));

	            orders.add(order);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return orders;
	}

}
