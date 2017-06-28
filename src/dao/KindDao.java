package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Kind;

public interface KindDao {

	public List<Kind> search(@Param(value="begin")int begin,
			@Param(value="conditionKind") Kind conditionKind);
	
	public int searchCount(@Param(value="conditionKind")Kind conditionKind);

	public int insert(Kind kind);

	public Kind searchById(Integer kindId);

	public int update(Kind kind);

	public int delete(Integer kindId);

	public List<Kind> searchByCId(@Param(value="cId")int cId);

}
