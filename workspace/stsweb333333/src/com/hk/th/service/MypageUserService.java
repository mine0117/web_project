package com.hk.th.service;

import java.util.ArrayList;
import java.util.List;

import com.hk.th.vo.bookVo;
import com.hk.th.vo.resVo;
import com.hk.th.vo.MembersVo;

public interface MypageUserService {
	//Members select
	public ArrayList<MembersVo> getselectmembers();
	//Members update
	public int getupdatemembers(MembersVo songvo);
	//Members detail
	public MembersVo getdetailmembers(String id);
	
	//Book select
	public ArrayList<bookVo> getselectbook(int res_code);
	//book detail
	public bookVo getdetailbook(int bo_code);
	

	
	//members enroll 상태 확인
	public String getcheckmembers(String uid);
	
	public boolean getupdateenroll(String uid);
	
	//res insert
	public int getinsertres(resVo resvo,String enroll);
	
	//res res_code 검색
	public resVo getselectRes_code(String res_uid);
	
	//res update
	public boolean getupdateres(resVo resvo);
	
	//book conf update
	public boolean getupdateconf(int  bo_code);
	
	//myres delete
	public boolean getdelete(String res_uid);
}
