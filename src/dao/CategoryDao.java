package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Category;

public interface CategoryDao {

	public List<Category> search(@Param(value="begin")int begin,
			@Param(value="conditionCategory") Category conditionCategory);
	
	public int searchCount(Category conditionCategory);

	public int insert(Category category);

	public Category searchById(Integer cateId);

	public int update(Category category);

	public int delete(Integer cateId);

	public List<Category> searchAll();
	
}
