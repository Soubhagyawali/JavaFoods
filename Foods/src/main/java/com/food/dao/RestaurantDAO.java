package com.food.dao;

import java.util.List;

import com.food.model.Restaurant;

public interface RestaurantDAO {
	void addRestaurant(Restaurant r);
	Restaurant getRestaurant(int resId);
	void updateRestaurant(Restaurant r);
	void deleteRestaurant(int resId);
	List<Restaurant> getAllRestaurants();
}
