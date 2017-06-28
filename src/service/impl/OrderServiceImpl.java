package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.OrderService;
import dao.OrderDao;
import entity.Order;
@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDao orderDao;

	@Override
	public List<Order> search(int begin, Order order) {
		return orderDao.search(begin, order);
	}

	@Override
	public int searchCount(Order order) {
		return orderDao.searchCount(order);
	}

	@Override
	public int delete(int orderId) {
		int rs = 0;
		int result1 = orderDao.delete(orderId);
		int result2 = orderDao.deleteMProAndOrder(orderId);
		if (result1 > 0 && result2 > 0) {
			rs = 1;
		}
		return rs;
	}

}
