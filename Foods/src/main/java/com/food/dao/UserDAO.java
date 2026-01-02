package com.food.dao;

import java.util.List;

import com.food.model.User;

public interface UserDAO {
	void addUSer(User u);
	User getUser(int id);
	void updateUser(User u);
	void deleteUser(int id);
	List<User> getAllUser();
	User login(String username, String password);
	boolean registerUser(User u);
}
