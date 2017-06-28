package service;

import java.util.List;

import org.springframework.stereotype.Service;

import entity.User;
@Service
public interface UserService {
	
	public User	searchById(int id);

	public List<User> searchByCondition(int begin, User user);
	
	public int searchCount(User conditionUser);

	public int insert(User user);

	public int update(User user);

	public int delete(int uId);
}
