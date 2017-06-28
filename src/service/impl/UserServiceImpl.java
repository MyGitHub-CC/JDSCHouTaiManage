package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDao;

import service.UserService;
import entity.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDao userDao;

	@Override
	public User searchById(int id) {
		return userDao.searchById(id);
	}

	@Override
	public List<User> searchByCondition(int begin,User conditionUser) {
		return userDao.searchByCondition(begin, conditionUser);
	}

	@Override
	public int searchCount(User conditionUser) {
		return userDao.searchCount(conditionUser);
	}

	@Override
	public int insert(User user) {
		return userDao.insert(user);
	}

	@Override
	public int update(User user) {
		return userDao.update(user);
	}

	@Override
	public int delete(int uId) {
		return userDao.delete(uId);
	}
}
