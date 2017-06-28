package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.CatetoryService;
import service.KindService;
import entity.Category;
import entity.Kind;

@Controller
public class CateController {

	@Autowired
	CatetoryService categoryService;
	@Autowired
	KindService kindService;
	
	@RequestMapping(value="category", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView category(Integer ye, Category conditionCategory) {
		ModelAndView mv = new ModelAndView("cate/category");
		if (conditionCategory == null) {
			Category category = new Category();
			conditionCategory = category;
		}
		int count = categoryService.searchCount(conditionCategory);
		int maxPage = (count - 1) / 5 + 1;
		if (ye == null || ye < 1) {
			ye = 1;
		} else if (ye > maxPage) {
			ye = maxPage;
		}
		int begin = (ye - 1 ) * 5 ;
		List<Category> categorys = categoryService.search(begin,conditionCategory);
		mv.addObject("categorys", categorys);
		mv.addObject("conditionCategory", conditionCategory);
		mv.addObject("maxPage", maxPage);
		mv.addObject("ye", ye);
		return mv;
	}
	
	@RequestMapping(value="categoryShowAdd", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView categoryShowAdd() {
		ModelAndView mv = new ModelAndView("cate/addCategory");
		return mv;
	}
	
	@RequestMapping(value="categoryAdd", method={RequestMethod.POST, RequestMethod.GET})
	public void categoryAdd(Category category,HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out;
		try {
			out = response.getWriter();
			int reslut = categoryService.insert(category);
			if (reslut > 0) {
				out.print("<script>alert('添加成功！');location.href='category'</script>");
			} else {
				out.print("<script>alert('添加失败！');location.href='category'</script>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="categoryShowModify", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView categoryShowModify(Integer cateId) {
		ModelAndView mv = new ModelAndView("cate/modifyCategory");
		Category category = categoryService.searchById(cateId);
		mv.addObject("category", category);
		return mv;
	}
	
	@RequestMapping(value="categoryModify", method={RequestMethod.POST, RequestMethod.GET})
	public void categoryModify(Category category,HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out;
		try {
			out = response.getWriter();
			int reslut = categoryService.update(category);
			if (reslut > 0) {
				out.print("<script>alert('修改成功！');location.href='category'</script>");
			} else {
				out.print("<script>alert('修改失败！');location.href='category'</script>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="categoryDelete", method={RequestMethod.POST,RequestMethod.GET})
	public void categoryDelete(Integer cateId,HttpServletResponse response) {
		PrintWriter out;
		try {
			out = response.getWriter();
			int result = categoryService.delete(cateId);
			if (result > 0) {
				out.print("<script>alert('删除成功');location.href='category'</script>");
			} else {
				out.print("<script>alert('删除成功');location.href='category'</script>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="kind", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView kind(Integer ye,Kind conditionKind) {
		ModelAndView mv = new ModelAndView("cate/kind");
		if (conditionKind == null) {
			Kind kind = new Kind();
			conditionKind = kind;
		}
		if ("null".equals(conditionKind.getName())){
	  		conditionKind.setName("");
	  	}
	  	if(conditionKind.getCategory() == null){
	  		Category category = new Category();
	  		category.setId(-1);
	  		conditionKind.setCategory(category);
	  	}
		int count = kindService.searchCount(conditionKind);
		int maxPage = (count - 1) / 5 + 1;
		if (ye == null || ye < 1) {
			ye = 1;
		} else if (ye > maxPage) {
			ye = maxPage;
		}
		int begin = (ye - 1 ) * 5 ;
		List<Kind> kinds = kindService.search(begin,conditionKind);
		List<Category> categorys = categoryService.searchAll();
		mv.addObject("kinds", kinds);
		mv.addObject("conditionKind", conditionKind);
		mv.addObject("categorys", categorys);
		mv.addObject("maxPage", maxPage);
		mv.addObject("ye", ye);
		return mv;
	}

	@RequestMapping(value="kindShowAdd", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView kindShowAdd() {
		ModelAndView mv = new ModelAndView("cate/addKind");
		List<Category> categorys = categoryService.searchAll();
		mv.addObject("categorys", categorys);
		return mv;
	}
	
	@RequestMapping(value="kindAdd", method={RequestMethod.POST, RequestMethod.GET})
	public void kindAdd(Kind kind,HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out;
		try {
			out = response.getWriter();
			int reslut = kindService.insert(kind);
			if (reslut > 0) {
				out.print("<script>alert('添加成功！');location.href='kind'</script>");
			} else {
				out.print("<script>alert('添加失败！');location.href='kind'</script>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="kindShowModify", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView kindShowModify(Integer kindId) {
		ModelAndView mv = new ModelAndView("cate/modifyKind");
		Kind kind = kindService.searchById(kindId);
		List<Category> categorys = categoryService.searchAll();
		mv.addObject("kind", kind);
		mv.addObject("categorys", categorys);
		return mv;
	}
	
	@RequestMapping(value="kindModify", method={RequestMethod.POST, RequestMethod.GET})
	public void kindModify(Kind kind,HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out;
		try {
			out = response.getWriter();
			int reslut = kindService.update(kind);
			if (reslut > 0) {
				out.print("<script>alert('修改成功！');location.href='kind'</script>");
			} else {
				out.print("<script>alert('修改失败！');location.href='kind'</script>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="kindDelete", method={RequestMethod.POST,RequestMethod.GET})
	public void kindDelete(Integer kindId,HttpServletResponse response) {
		PrintWriter out;
		try {
			out = response.getWriter();
			int result = kindService.delete(kindId);
			if (result > 0) {
				out.print("<script>alert('删除成功');location.href='kind'</script>");
			} else {
				out.print("<script>alert('删除成功');location.href='kind'</script>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
