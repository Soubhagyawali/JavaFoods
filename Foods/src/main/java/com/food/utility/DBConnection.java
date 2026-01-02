package com.food.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static String url="jdbc:mysql://localhost:3306/tapfood_db";
	private static String username="root";
	private static String password="Sou@2bu22cb054";
	private static Connection connection= null;
	
	
	public static Connection getConnection() {
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection =DriverManager.getConnection(url, username, password);
		 
		
		
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	catch(SQLException e) {
		e.printStackTrace();
	}
	return connection;
}
}
