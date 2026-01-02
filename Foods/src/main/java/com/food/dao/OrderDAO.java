package com.food.dao;

import java.util.List;

import com.food.model.Order;

public interface OrderDAO {
	int addOrder(Order o);
	Order getOrder(int orderId);
	boolean updateOrder(Order o);
	boolean deleteOrder(int orderId);
	
	List<Order> getAllOrders();
}
