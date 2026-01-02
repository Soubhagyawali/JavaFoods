package com.food.dao;

import java.util.List;

import com.food.model.Menu;

public interface MenuDAO {
	


		public void addMenu(Menu menu);

		public Menu getMenu(int id);

		public List<Menu> getAllMenu();

		public void deleteMenu(int id);

		public Menu updateMenu(int id);
		
		public List<Menu> getMenuByRestaurantById(int id);


	
}