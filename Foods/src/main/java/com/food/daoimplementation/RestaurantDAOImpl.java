package com.food.daoimplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.RestaurantDAO;
import com.food.model.Restaurant;
import com.food.utility.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {
	String add_Res="INSERT INTO `Restaurant`(`rName`,`cuisineType`,`deliveryTime`,`rAddress`,`imagePath`)VALUES(?,?,?,?,?)";
	String get_Res = "SELECT * FROM `restaurant` WHERE `resId`=?";
	
	
	@Override
	public void addRestaurant(Restaurant r) {
		Connection connection= DBConnection.getConnection();
		
		try {
			PreparedStatement preparedStatement=connection.prepareStatement(add_Res);
			
			preparedStatement.setString(1, r.getName());
			preparedStatement.setString(2, r.getCuisineType());
			preparedStatement.setInt(3, r.getDeliveryTime() );
			preparedStatement.setString(4, r.getAddress());
			preparedStatement.setString(5, r.getImagePath());
			
			preparedStatement.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	

	@Override
	public Restaurant getRestaurant(int restaurantId) {
		Connection connection=DBConnection.getConnection();
		Restaurant r =null;
		
		
		try {
			PreparedStatement preparedStatement =connection.prepareStatement(get_Res);
			preparedStatement.setInt(1,restaurantId);
			
			ResultSet rs =preparedStatement.executeQuery();
			
			while(rs.next()) {
				int resId=rs.getInt("resId");
				String name = rs.getString("rName");
				String cuisineType = rs.getString("cuisineType");
				int deliveryTime=rs.getInt("deliveryTime");
				String address = rs.getString("rAddress");
				int adminUserId=rs.getInt("adminUserId");
				int rating = rs.getInt("rating");
				boolean isActive=rs.getBoolean("isActive");
				String imagePath = rs.getString("imagePath");
				
				r=new Restaurant(resId, name, cuisineType, deliveryTime, address, adminUserId,rating, isActive,imagePath);
				
		}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return r;
	}
		
		

	@Override
	public void updateRestaurant(Restaurant r) {
		String Update_user="UPDATE `restaurant` SET `rName`=?, `cuisineType`=?, `deliveryTime`=?, `rAddress`=?, `imagePath`=? WHERE `resId`=?";
		
		Connection connection= DBConnection.getConnection();
		
		try {
			PreparedStatement preparedStatement=connection.prepareStatement(Update_user);
			
			preparedStatement.setString(1, r.getName());
			preparedStatement.setString(2, r.getCuisineType());
			preparedStatement.setInt(3, r.getDeliveryTime());
			preparedStatement.setString(4, r.getAddress());
			preparedStatement.setString(5, r.getImagePath());
			preparedStatement.setInt(6, r.getRestaurantId());
			
			
			preparedStatement.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	@Override
	public void deleteRestaurant(int resId) {
		String delete_res="DELETE FROM `restaurant` WHERE `resId`=? ";
		
		Connection connection=DBConnection.getConnection();
		try {
			PreparedStatement preparedStatement=connection.prepareStatement(delete_res);
			
			preparedStatement.setInt(1, resId);
			
			preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	

	@Override
	public List<Restaurant> getAllRestaurants() {
		List<Restaurant> restaurant =new ArrayList<>();
		String getAll_Res = "SELECT * FROM `restaurant`";
		Restaurant r=null;
		
		Connection connection= DBConnection.getConnection();
		try {
			PreparedStatement preparedStatement =connection.prepareStatement(getAll_Res);
			
			
			ResultSet rs =preparedStatement.executeQuery();
			
			while(rs.next()) { 
				int resId=rs.getInt("resId");
				String name = rs.getString("name");
				String cuisineType = rs.getString("cuisineType");
				int deliveryTime=rs.getInt("deliveryTime");
				String address = rs.getString("address");
				int adminUserId=rs.getInt("adminUserId");
				int rating = rs.getInt("rating");
				boolean isActive=rs.getBoolean("isActive");
				String imagePath = rs.getString("imagePath");
		       
				r=new Restaurant(resId, name, cuisineType, deliveryTime, address, adminUserId,rating, isActive,imagePath);
				r.setRestaurantId(resId);
				restaurant.add(r);
		}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return restaurant;
		
		
	}
}
