package com.food.daoimplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.UserDAO;
import com.food.model.User;
import com.food.utility.DBConnection;

public class UserDAOImpl implements UserDAO {
	String Add_USER ="INSERT INTO `user`(`username`,`password`,`email`,`address`,`role`,`createdDate`,`lastLoginDate`)values(?,?,?,?,?,?,?)";
	String get_user="SELECT * FROM `user` WHERE `userID`=?";
	
	
	@Override
	public void addUSer(User u) {
		Connection connection =DBConnection.getConnection();
		try {
			PreparedStatement preparedStatement=connection.prepareStatement(Add_USER);
			preparedStatement.setString(1, u.getUsername());
			preparedStatement.setString(2, u.getPassword());
			preparedStatement.setString(3, u.getEmail());
			preparedStatement.setString(4, u.getAddress());
			preparedStatement.setString(5, u.getRole());
			preparedStatement.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
			preparedStatement.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
			
			preparedStatement.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public User getUser(int id) {
	 
	 Connection connection=DBConnection.getConnection();
	 User u=null;
	 try {
		PreparedStatement preparedStatement=connection.prepareStatement(get_user);
		
		preparedStatement.setInt(1,id);
		
		ResultSet rs =preparedStatement.executeQuery();
		
		while(rs.next()) {
			int userId=rs.getInt("userId");
			String username = rs.getString("username");
			String password = rs.getString("password");
			String email = rs.getString("email");
			String address = rs.getString("address");
			String role = rs.getString("role");
	
			
			u =new User(userId,username,password,email,address,role);
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return u;
	}

	
	
	@Override
	public void updateUser(User u) {
		String Update_user="UPDATE `user` SET `password`=?, `email`=?, `address`=?, `role`=? WHERE `userId`=? ";
		
		Connection connection=DBConnection.getConnection();
		try {
			PreparedStatement preparedStatement=connection.prepareStatement(Update_user);
			preparedStatement.setString(1, u.getPassword());
			preparedStatement.setString(2, u.getEmail());
			preparedStatement.setString(3, u.getAddress());
			preparedStatement.setString(4, u.getRole());
			preparedStatement.setInt(5, u.getUserId());
			
			preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	@Override
	public void deleteUser(int id) {
		String delete_user="DELETE FROM `user` WHERE `userId`=? ";
		
		Connection connection=DBConnection.getConnection();
		try {
			PreparedStatement preparedStatement=connection.prepareStatement(delete_user);
			
			preparedStatement.setInt(1, id);
			
			preparedStatement.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	@Override
	public List<User> getAllUser() {
		
		List<User> users=new ArrayList<>();
		String getAll_users="SELECT `userID`, `username`, `password`,`email`, `address`, `role`  FROM `user`";
		User u=null;
		
		Connection connection=DBConnection.getConnection();
		try {
			PreparedStatement preparedStatement=connection.prepareStatement(getAll_users);
			ResultSet rs =preparedStatement.executeQuery();
			
			while(rs.next()) {
				int userId=rs.getInt("userId");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String email = rs.getString("email");
				String address = rs.getString("address");
				String role = rs.getString("role");
		
				
				u =new User(username,password,email,address,role);
				u.setUserId(userId);
				
				users.add(u);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return users;
	}
	
	@Override
	public User login(String username, String password) {

	    User user = null;
	    String LOGIN_QUERY =
	        "SELECT * FROM user WHERE username=? AND password=?";

	    try (Connection con = DBConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(LOGIN_QUERY)) {

	        ps.setString(1, username);
	        ps.setString(2, password);

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            user = new User();
	            user.setUsername(rs.getString("username"));
	            user.setEmail(rs.getString("email"));
	            user.setAddress(rs.getString("address"));
	            user.setRole(rs.getString("role"));
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return user;
	}
	
	@Override
    public boolean registerUser(User u) {

        String checkQuery = "SELECT userID FROM user WHERE email = ?";
        String insertQuery =
            "INSERT INTO user(username, email, address, password) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement checkStmt = conn.prepareStatement(checkQuery)) {

            // Check if user exists
            checkStmt.setString(1, u.getEmail());
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                return false; // user already exists
            }

            // Insert new user
            try (PreparedStatement ps = conn.prepareStatement(insertQuery)) {

                ps.setString(1, u.getUsername());
                ps.setString(2, u.getEmail());
                ps.setString(3, u.getAddress());
                ps.setString(4, u.getPassword());
          

                ps.executeUpdate();
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    
	
}
