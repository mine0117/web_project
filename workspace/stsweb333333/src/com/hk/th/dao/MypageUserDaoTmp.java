package com.hk.th.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.th.vo.bookVo;
import com.hk.th.vo.resVo;
import com.hk.th.vo.MembersVo;
import com.hk.th.vo.bookVo;

@Service("MypageUserDao")
public class MypageUserDaoTmp implements MypageUserDao{
	
	
	@Autowired
	private SqlSession sqlsession;
	private String ns="MypageUser.";
	
	@Override
	public List<MembersVo> selectmembers() {
		List<MembersVo> dbres=sqlsession.selectList(ns+"selectmembers");
		return dbres;
	}

	@Override
	public int updatemembers(MembersVo songvo) {
		int dbres=sqlsession.update(ns+"updatemembers",songvo);
		return dbres;
	}

	@Override
	public MembersVo detailmembers(String id) {
		MembersVo dbres=sqlsession.selectOne(ns+"detailmembers",id);
		return dbres;
	}

	@Override
	public List<bookVo> selectbook(int res_code) {
		List<bookVo> dbres=sqlsession.selectList(ns+"selectbook",res_code);
		return dbres;
	}
	
	@Override
	public  bookVo detailbook(int bo_code) {
		bookVo dbres=sqlsession.selectOne(ns+"detailbook",bo_code);
		return dbres;
	}
	


	@Override
	public String checkmembers(String uid) {
		String dbres=sqlsession.selectOne(ns+"checkmembers",uid);
		System.out.println(dbres.length());
		return dbres;
	}

	@Override
	public int insertres(resVo resvo) {
		int dbres=sqlsession.insert(ns+"insertres",resvo);		
		return dbres;
	}

	@Override
	public boolean updateEnroll(String enroll) {
		 sqlsession.update(ns+"updateEnroll",enroll);
		return true;
	}
	
	@Override
	public boolean updateEnrollZero(String uid) {
		sqlsession.update(ns+"updateEnrollZero",uid);
		return true;
	}


	@Override
	public resVo selectRes(String res_uid) {
		resVo dbres=sqlsession.selectOne(ns+"selectRes",res_uid);
		return dbres;
	}

	@Override
	public boolean updateMyRes(resVo resvo) {
		sqlsession.update(ns+"updateMyRes",resvo);
		return true;
	}

	@Override
	public boolean updateConf(int  bo_code) {
		sqlsession.update(ns+"updateConf", bo_code);
		return true;
	}

	@Override
	public boolean deleteRes(String res_uid) {
		sqlsession.delete(ns+"deleteRes",res_uid);
		return true;
	}

	
	
	

}
