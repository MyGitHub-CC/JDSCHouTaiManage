package service;

import java.util.List;

import org.springframework.stereotype.Service;

import entity.Product;
import entity.Publishing;
@Service
public interface ProductService {
	
	public List<Product> search(int begin, int kId, Product conditionProduct);
	
	public int searchCount(int kId, Product conditionProduct);

	public int insert(Product product);

	public int update(Product product);

	public int delete(Integer proId);

	public Product searchById(Integer proId);

	public List<Publishing> searchPublishing();
	
}
