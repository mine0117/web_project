package com.hk.th.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.th.vo.qnaVo;

@Repository("qnaDao")
public class qnaDaoImpl implements qnaDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String ns = "qna.";

	@Override
	public List<qnaVo> selectqnaList() {
		
		List<qnaVo> list = sqlSession.selectList(ns+"selectqnaList");		
		return list;
	}

	@Override
	public int insertqna(qnaVo qnaVo){		
		int dbres=sqlSession.insert(ns+"insertqna",qnaVo);	
		return dbres;
	}

	@Override
	public qnaVo detailqna(int num) {
		qnaVo dbres= sqlSession.selectOne(ns+"detailqna",num);
		return dbres;
	}

	@Override
	public int deleteqna(int num) {
		int dbres=sqlSession.delete(ns+"deleteqna",num);
		return dbres;
	}

	@Override
	public int updateqna(qnaVo qnaVo) {
		int dbres=sqlSession.update(ns+"updateqna",qnaVo);
		return dbres;
	}

	@Override
	public qnaVo selectqnaBynum(int num) {
		qnaVo dbres=sqlSession.selectOne(ns+"selectqnaBynum",num);
		
		return dbres;
	}

	@Override
	public int updatecount(int num,int q_hits) {
	      HashMap<String,Integer> hashmap=new HashMap<String,Integer>();
	      hashmap.put("num",num);
	      hashmap.put("q_hits", q_hits);
		int dbres=sqlSession.update(ns+"updatehitscount",hashmap);
		return dbres;
	}

	@Override
	public List<qnaVo> searchId(String id, String stype) {
		
		HashMap<String, String> hashmap= new HashMap<String, String>();
		hashmap.put("keyword", id);
		hashmap.put("searchtype", stype);	

		List<qnaVo> dbres=sqlSession.selectList(ns+"searchId",hashmap);
		return dbres;
	}
	
		
}
