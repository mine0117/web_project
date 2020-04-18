package com.hk.th.dao;

import java.util.List;

import com.hk.th.vo.bookVo;
import com.hk.th.vo.resVo;
import com.hk.th.vo.MembersVo;

public interface MypageUserDao {
	//members select
	public List<MembersVo> selectmembers();
	//members update
	public int updatemembers(MembersVo songvo);

	//members detail
	public MembersVo detailmembers(String id);
	
	//book select res_code
	public List<bookVo> selectbook(int res_code);
	
	//book detail res_code
	public  bookVo detailbook(int bo_code);
	
	
	//members enroll 상태 확인
	public String checkmembers(String uid);
	
	//res insert
	public int insertres(resVo resvo);
	//enroll 1
	public boolean updateEnroll(String enroll);
	//enroll 0
	public boolean updateEnrollZero(String uid);
	
	//res res_code 검색
	public resVo selectRes(String res_uid);
	
	//res update
	public boolean updateMyRes(resVo resvo);
	
	//update book conf
	public boolean updateConf(int  bo_code);
	
	//myres delete
	public boolean deleteRes(String res_uid);
	
}
