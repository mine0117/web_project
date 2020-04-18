package com.hk.th.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.hk.th.vo.resVo;

@Repository("MainresDao")
public class MainresDaoImpl implements MainresDao {

	@Autowired
	private SqlSessionTemplate sqlsession;
	private String ns ="Mainres.";
	
	@Override
	public List<resVo> Selectmrestlist() {
		List<resVo> Mainreslist = sqlsession.selectList(ns+"Selectmrestlist");
		return  Mainreslist;
	}

	@Override
	public resVo Selectmrescodelist(String map_num) {
		
		resVo dbres = sqlsession.selectOne(ns+ "Selectmrescodelist",map_num);
		return dbres;
	}

	@Override
	public List<resVo> southreslist() {
		
		List<resVo> slist =sqlsession.selectList(ns+"southreslist");
		return slist;
	}

	@Override
	public List<resVo> Selectlinelist(String line) {
		List<resVo> dbres = sqlsession.selectOne(ns+"Selectlinelist",line);
		return  dbres;
	}

	@Override
	public List<resVo> selectResByMap(int num) {
		List<resVo> list = sqlsession.selectList(ns+"selectResByMap",num);
			
		return list;
	}

	@Override
	public List<resVo> selectResBytheme(String theme) {
		List<resVo> list = sqlsession.selectList(ns+"selectResBytheme", theme);
		return list;
	}

}
