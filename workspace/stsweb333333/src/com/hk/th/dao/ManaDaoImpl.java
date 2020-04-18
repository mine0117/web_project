package com.hk.th.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.th.vo.bookVo;
import com.hk.th.vo.menuVo;
import com.hk.th.vo.resVo;

@Repository("ManaDao")
public class ManaDaoImpl implements ManaDao {
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	private String ns="Mana.";
	
	@Override
	public List<bookVo> selectNoShowList() {
		List<bookVo> list = sqlsession.selectList(ns+"selectNoShowList");
		
		return list;
	}

	@Override
	public boolean updatePenalty(String id) {
		sqlsession.update(ns+"updatePenalty",id);
		return true;
	}

	@Override
	public boolean updateConf(String id) {
		sqlsession.update(ns+"updateConf",id);
		return true;
	}

	@Override
	public List<resVo> selectResList() {
		List<resVo> list = sqlsession.selectList(ns+"selectResList");
		return list;
	}

	@Override
	public resVo selectResDetail(int code) {
		resVo vo = sqlsession.selectOne(ns+"selectResDetail",code);
		return vo;
	}

	@Override
	public List<resVo> selectUnList() {
		List<resVo> list = sqlsession.selectList(ns+"selectUnList");
		return list;
	}

	@Override
	public boolean updateRes(resVo vo) {
		sqlsession.update(ns+"updateRes",vo);
		return true;
	}

	@Override
	public boolean deleteMem(String id) {
		sqlsession.delete(ns+"deleteMem",id);
		return true;
	}
	

	@Override
	public boolean deleteRes(int code) {
	
		sqlsession.delete(ns+"deleteRes",code);
		return true;
	}

	@Override
	public boolean updateEnrollBack(String uid) {
		sqlsession.delete(ns+"updateEnrollBack",uid);
		return true;
	}

	@Override
	public List<menuVo> selectMenu(int code) {
	
		List<menuVo> list = sqlsession.selectList(ns+"selectMenu",code);
		return list;
	}

	@Override
	public boolean updateMenu(menuVo mvo) {
		sqlsession.update(ns+"updateMenu",mvo);
		return true;
	}
	
	
	

}
