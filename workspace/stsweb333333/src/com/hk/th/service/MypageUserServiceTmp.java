package com.hk.th.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hk.th.dao.MypageUserDao;
import com.hk.th.vo.bookVo;
import com.hk.th.vo.resVo;
import com.hk.th.vo.MembersVo;

@Service("MypageUserService")
public class MypageUserServiceTmp implements MypageUserService{
	
	@Resource(name="MypageUserDao")
	private MypageUserDao mydao;
	
	
	@Override
	public ArrayList<MembersVo> getselectmembers() {
		ArrayList<MembersVo> svres=(ArrayList<MembersVo>) mydao.selectmembers();
		return svres;
	}


	@Override
	public int getupdatemembers(MembersVo memvo) {
		int svres=mydao.updatemembers(memvo);
		return svres;
	}


	@Override
	public MembersVo getdetailmembers(String id) {
		MembersVo svres=mydao.detailmembers(id);
		return svres;
	}


	@Override
	public ArrayList<bookVo> getselectbook(int res_code) {
		ArrayList<bookVo> svres=(ArrayList<bookVo>) mydao.selectbook(res_code);
		return svres;
	}



	@Override
	public bookVo getdetailbook(int bo_code) {
		bookVo svres= mydao.detailbook(bo_code);
		return svres;
	}

	@Override
	public String getcheckmembers(String uid) {
		String svres=mydao.checkmembers(uid);
		return svres;
	}


	@Override
	public int getinsertres(resVo resvo,String enroll) {
		int svres=mydao.insertres(resvo);
		mydao.updateEnroll(enroll);
		return svres;
	}


	@Override
	public resVo getselectRes_code(String res_uid) {
		resVo svres=mydao.selectRes(res_uid);
		return svres;
	}


	@Override
	public boolean getupdateres(resVo resvo) {
		mydao.updateMyRes(resvo);
		return true;
	}


	@Override
	public boolean getupdateconf(int  bo_code) {
		mydao.updateConf(bo_code);
		return true;
	}


	@Override
	public boolean getdelete(String res_uid) {
		mydao.deleteRes(res_uid);
		return true;
	}


	@Override
	public boolean getupdateenroll(String uid) {
		mydao.updateEnrollZero(uid);
		return true;
	}



}
