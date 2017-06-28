package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Order;

public interface OrderDao {
	
	public List<Order> search(@Param(value="begin")int begin, @Param(value="order")Order order);
	
	public int searchCount(@Param(value="order")Order order);
	
	public int delete(@Param(value="orderId")int orderId);
	
	public int deleteMProAndOrder(@Param(value="orderId")int orderId);

}
