package service;

import java.util.List;

import org.springframework.stereotype.Service;

import entity.Category;

@Service
public interface CatetoryService {
	
	public List<Category> search(int begin,Category conditionCategory);
	
	public int searchCount(Category conditionCategory);

	public int insert(Category category);

	public Category searchById(Integer cateId);

	public int update(Category category);

	public int delete(Integer cateId);

	public List<Category> searchAll();

}
