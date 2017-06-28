package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import service.CatetoryService;
import service.KindService;
import service.ProductService;
import entity.Category;
import entity.Kind;
import entity.Product;
import entity.Publishing;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;
	@Autowired
	CatetoryService categoryService;
	@Autowired
	KindService kindService;
	
	@RequestMapping(value="product", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView product(Integer ye, Product conditionProduct) {
		ModelAndView mv = new ModelAndView("product/product");
		int kId = -1;
		if (conditionProduct.getKind() != null) {
			kId = conditionProduct.getKind().getId();
		}
		int count = productService.searchCount(kId,conditionProduct);
		int maxPage = (count - 1) / 5 + 1;
		if (ye == null || ye < 1) {
			ye = 1;
		} else if (ye > maxPage) {
			ye = maxPage;
		}
		int begin = (ye - 1 ) * 5 ;
		List<Product> products = productService.search(begin, kId,conditionProduct);
		List<Category> categorys = categoryService.searchAll();
		int cId = categorys.get(0).getId();
		if (conditionProduct.getKind() != null && conditionProduct.getKind().getCategory() != null) {
			cId = conditionProduct.getKind().getCategory().getId();
		}
		List<Kind> kinds = kindService.searchByCId(cId);
		mv.addObject("products", products);
		mv.addObject("categorys", categorys);
		mv.addObject("kinds", kinds);
		mv.addObject("conditionProduct", conditionProduct);
		mv.addObject("maxPage", maxPage);
		mv.addObject("ye", ye);
		return mv;
	}
	
	@RequestMapping(value="productShowAdd", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView productShowAdd() {
		ModelAndView mv = new ModelAndView("product/add");
		List<Category> categorys = categoryService.searchAll();
		List<Kind> kinds = kindService.searchByCId(categorys.get(0).getId());
		List<Publishing> publishings = productService.searchPublishing();
		mv.addObject("categorys", categorys);
		mv.addObject("kinds", kinds);
		mv.addObject("publishings", publishings);
		return mv;
	}
	
	@RequestMapping(value="productAdd", method={RequestMethod.POST, RequestMethod.GET})
	public void productAdd(Product product,HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="myfile") MultipartFile[] myfiles) {
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		String newName = "";
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			String uploadPath = request.getSession().getServletContext().getRealPath("/") + "/photo";
			MultipartFile myfile = myfiles[0];
			if (!myfile.isEmpty()) {
				String oldName = myfile.getOriginalFilename();
				UUID uuid = UUID.randomUUID();
				newName = uuid.toString() + oldName.substring(oldName.lastIndexOf("."));
				myfile.transferTo(new File(uploadPath + "/"+ newName)) ;
			} else {
				out.print("文件上传失败！");
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		product.setPhoto(newName);
		int reslut = productService.insert(product);
		if (reslut > 0) {
			out.print("<script>alert('添加成功！');location.href='product'</script>");
		} else {
			out.print("<script>alert('添加失败！');location.href='product'</script>");
		}
	}
	
	@RequestMapping(value="changeKind", method={RequestMethod.POST, RequestMethod.GET})
	public void changeKind(Integer cId,HttpServletResponse response) {
		List<Kind> kinds = kindService.searchByCId(cId);
		try {
			PrintWriter out = response.getWriter();
			JSONArray jsonArray = JSONArray.fromObject(kinds);
			out.print(jsonArray);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	@RequestMapping(value="productShowModify", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView productShowModify(Integer proId) {
		ModelAndView mv = new ModelAndView("product/modify");
		Product product = productService.searchById(proId);
		Kind kind = kindService.searchById(product.getKind().getId());
		product.setKind(kind);
		List<Category> categorys = categoryService.searchAll();
		List<Kind> kinds = kindService.searchByCId(product.getKind().getCategory().getId());
		List<Publishing> publishings = productService.searchPublishing();
		mv.addObject("product", product);
		mv.addObject("categorys", categorys);
		mv.addObject("kinds", kinds);
		mv.addObject("publishings", publishings);
		return mv;
	}
	
	@RequestMapping(value="productModify", method={RequestMethod.POST, RequestMethod.GET})
	public void productModify(Product product,HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="myfile") MultipartFile[] myfiles,String url) {
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		String newName = "";
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			String uploadPath = request.getSession().getServletContext().getRealPath("/") + "/photo";
			MultipartFile myfile = myfiles[0];
			if (!myfile.isEmpty()) {
				String oldName = myfile.getOriginalFilename();
				UUID uuid = UUID.randomUUID();
				newName = uuid.toString() + oldName.substring(oldName.lastIndexOf("."));
				myfile.transferTo(new File(uploadPath + "/"+ newName)) ;
			} else {
				newName = url;
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		product.setPhoto(newName);
		int reslut = productService.update(product);
		if (reslut > 0) {
			out.print("<script>alert('更新成功！');location.href='product'</script>");
		} else {
			out.print("<script>alert('更新失败！');location.href='product'</script>");
		}
	}
	
	@RequestMapping(value="productDelete", method={RequestMethod.POST, RequestMethod.GET})
	public void productDelete(Integer proId, HttpServletResponse response) {
		int result = productService.delete(proId);
		try {
			PrintWriter out = response.getWriter();
			if (result > 0) {
				out.print("<script>alert('删除成功！');window.location.href='product'</script>");
			} else {
				out.print("<script>alert('删除失败！');window.location.href='product'</script>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
