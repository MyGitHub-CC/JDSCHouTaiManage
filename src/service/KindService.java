package service;

import java.util.List;

import org.springframework.stereotype.Service;

import entity.Kind;

@Service
public interface KindService {
	
	public List<Kind> search(int begin, Kind conditionKind);
	
	public int searchCount(Kind conditionKind);

	public int insert(Kind kind);

	public Kind searchById(Integer kindId);
	
	public int update(Kind kind);

	public int delete(Integer kindId);

	public List<Kind> searchByCId(int cId);

}
