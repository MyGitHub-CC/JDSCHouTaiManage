package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.CatetoryService;
import dao.CategoryDao;
import entity.Category;

@Service
public class CategoryServiceImpl implements CatetoryService {

	@Autowired
	CategoryDao categoryDao;
	
	@Override
	public List<Category> search(int begin, Category conditionCategory) {
		return categoryDao.search(begin,conditionCategory);
	}

	@Override
	public int searchCount(Category conditionCategory) {
		return categoryDao.searchCount(conditionCategory);
	}

	@Override
	public int insert(Category category) {
		return categoryDao.insert(category);
	}

	@Override
	public Category searchById(Integer cateId) {
		return categoryDao.searchById(cateId);
	}

	@Override
	public int update(Category category) {
		return categoryDao.update(category);
	}

	@Override
	public int delete(Integer cateId) {
		return categoryDao.delete(cateId);
	}

	@Override
	public List<Category> searchAll() {
		return categoryDao.searchAll();
	}

}
