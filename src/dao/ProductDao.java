package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Product;
import entity.Publishing;

public interface ProductDao {

	public List<Product> search(@Param(value="begin")int begin, @Param(value="kId")int kId,
			@Param(value="conditionProduct")Product conditionProduct);
	
	public int searchCount(@Param(value="kId")int kId , @Param(value="conditionProduct")Product conditionProduct);
	
	public int insert(Product product);

	public int update(Product product);
	
	public int delete(Integer proId);

	public Product searchById(Integer proId);

	public List<Publishing> searchPublishing();
}
