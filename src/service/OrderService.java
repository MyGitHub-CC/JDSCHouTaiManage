package service;

import java.util.List;

import org.springframework.stereotype.Service;

import entity.Order;

@Service
public interface OrderService {

	public List<Order> search(int begin, Order order);

	public int searchCount(Order order);

	public int delete(int orderId);

}
