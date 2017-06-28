package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.User;

public interface UserDao {
	
	public User	searchById(@Param(value="uId") int uId);
	
	public List<User> searchByCondition(@Param(value="begin")int begin, @Param(value="conditionUser") User conditionUser);
	
	public int searchCount(@Param(value="conditionUser") User conditionUser);

	public int insert(User user);

	public int update(User user);

	public int delete(@Param(value="uId") int uId);
}
