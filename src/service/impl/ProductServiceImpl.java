package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ProductDao;

import entity.Product;
import entity.Publishing;

import service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao productDao;

	@Override
	public List<Product> search(int begin, int kId, Product conditionProduct) {
		return productDao.search(begin, kId, conditionProduct);
	}

	@Override
	public int searchCount(int kId, Product conditionProduct) {
		return productDao.searchCount(kId, conditionProduct);
	}

	@Override
	public int insert(Product product) {
		return productDao.insert(product);
	}

	@Override
	public int update(Product product) {
		return productDao.update(product);
	}

	@Override
	public int delete(Integer proId) {
		return productDao.delete(proId);
	}

	@Override
	public Product searchById(Integer proId) {
		
		return productDao.searchById(proId);
	}

	@Override
	public List<Publishing> searchPublishing() {
		return productDao.searchPublishing();
	}

}
