package com.hk.th.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.th.vo.regionVo;

@Repository("regionDao")
public class regionDaoImpl implements regionDao {
	
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	private String ns = "reg.";
	
	
	@Override
	public List<regionVo> Selectregionlist() {
		
		List<regionVo> rlist = sqlsession.selectList(ns+"Selectregionlist");
		
		return rlist;
	}


	@Override
	public regionVo Selectregionnamelist(String name) {
		regionVo dbres = sqlsession.selectOne(ns+"Selectregionnamelist",name);
		return dbres;
	}


	@Override
	public List<regionVo> Selectsouthlist() {
		
		List<regionVo> rlist = sqlsession.selectList(ns+"Selectsouthlist");
		return rlist;
	}


	@Override
	public List<regionVo> Selectnorthlist() {
		List<regionVo> rlist = sqlsession.selectList(ns+"Selectnorthlist");
		return rlist;
	}

	

}
