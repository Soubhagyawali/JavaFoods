package com.food.model;

public class OrderItem {
	private int orderItemID;
	private int orderId;
	private int menuId;
	private double itemTotal;
	private int quantity;
	private Menu menuItem; 
	
	
	public OrderItem() {
	
	}


	public OrderItem(int orderItemID, int orderId, int menuId, double itemTotal, int quantity) {
		super();
		this.orderItemID = orderItemID;
		this.orderId = orderId;
		this.menuId = menuId;
		this.itemTotal = itemTotal;
		this.quantity = quantity;
		
	}


	@Override
	public String toString() {
		return "OrderItem [orderItemID=" + orderItemID + ", orderId=" + orderId + ", menuId=" + menuId + ", itemTotal="
				+ itemTotal + ", quantity=" + quantity + ", menuItem=" + menuItem + "]";
	}


	public int getOrderItemID() {
		return orderItemID;
	}


	public void setOrderItemID(int orderItemID) {
		this.orderItemID = orderItemID;
	}


	public int getOrderId() {
		return orderId;
	}


	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}


	public int getMenuId() {
		return menuId;
	}


	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}


	public double getItemTotal() {
		return itemTotal;
	}


	public void setItemTotal(double itemTotal) {
		this.itemTotal = itemTotal;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public Menu getMenuItem() {
		return menuItem;
	}


	public void setMenuItem(Menu menuItem) {
		this.menuItem = menuItem;
	}
	

}