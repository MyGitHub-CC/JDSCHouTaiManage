package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.OrderService;
import entity.Order;
import entity.User;

@Controller
public class OrderController {

	@Autowired
	OrderService orderService;
	
	@RequestMapping(value = "order", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView order(Integer ye,Order conditionOrder) {
		ModelAndView mv = new ModelAndView("order/order");
		if(conditionOrder.getUser() == null ){
	  		User user = new User();
	  		conditionOrder.setUser(user);
	  	}
		int count = orderService.searchCount(conditionOrder);
		int maxPage = (count - 1) / 5 + 1;
		if (ye == null || ye < 1) {
			ye = 1;
		} else if (ye > maxPage) {
			ye = maxPage;
		}
		int begin = (ye - 1) * 5;
		List<Order> orders = orderService.search(begin,conditionOrder);
		mv.addObject("orders", orders);
		mv.addObject("conditionOrder", conditionOrder);
		mv.addObject("maxPage", maxPage);
		mv.addObject("ye", ye);
		return mv;
	}

	@RequestMapping(value = "orderDelete", method = { RequestMethod.POST, RequestMethod.GET })
	public void orderDelete(Integer orderId, HttpServletResponse response) {
		int result = orderService.delete(orderId);
		try {
			PrintWriter out = response.getWriter();
			if (result > 0) {
				out.print("<script>alert('删除成功！');window.location.href='order'</script>");
			} else {
				out.print("<script>alert('删除失败！');window.location.href='order'</script>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
