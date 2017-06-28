package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.KindService;
import dao.KindDao;
import entity.Kind;

@Service
public class KindServiceImpl implements KindService {

	@Autowired
	KindDao kindDao;
	
	@Override
	public List<Kind> search(int begin, Kind conditionKind) {
		return kindDao.search(begin,conditionKind);
	}

	@Override
	public int searchCount(Kind conditionKind) {
		return kindDao.searchCount(conditionKind);
	}

	@Override
	public int insert(Kind kind) {
		return kindDao.insert(kind);
	}

	@Override
	public Kind searchById(Integer kindId) {
		return kindDao.searchById(kindId);
	}

	@Override
	public int update(Kind kind) {
		return kindDao.update(kind);
	}

	@Override
	public int delete(Integer kindId) {
		return kindDao.delete(kindId);
	}

	@Override
	public List<Kind> searchByCId(int cId) {
		return kindDao.searchByCId(cId);
	}

}
