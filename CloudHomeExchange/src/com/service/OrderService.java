package com.service;

import com.dao.OrderDao;
import com.entity.Order;

public class OrderService {
	private OrderDao orderDao = new OrderDao();
	
	public boolean addOrder(Order order) {
		return orderDao.addOrder(order);
	}
	
	public boolean updateOrderState(Order order) {
		return orderDao.updateOrderState(order);
	}
}
