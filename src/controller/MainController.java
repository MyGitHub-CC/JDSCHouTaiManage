package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.UserService;

@Controller
public class MainController {

	@Autowired
	UserService userService;
	
	@RequestMapping(value="main", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView("main/main");
		return mv;
	}
	
	@RequestMapping(value="mainHeader", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView mainHeader() {
		ModelAndView mv = new ModelAndView("main/header");
		return mv;
	}
	
	@RequestMapping(value="mainLeft", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView mainLeft() {
		ModelAndView mv = new ModelAndView("main/left");
		return mv;
	}
	
	@RequestMapping(value="mainFooter", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView mainFooter() {
		ModelAndView mv = new ModelAndView("main/footer");
		return mv;
	}
}
