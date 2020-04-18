package com.hk.th.service;

import java.util.ArrayList;

import com.hk.th.vo.bookVo;
import com.hk.th.vo.menuVo;
import com.hk.th.vo.resVo;

public interface ManaService {
	public ArrayList<bookVo> getNoShow();
	public boolean addPenalty(String id);
	public ArrayList<resVo> getRes();
	public resVo getResDetail(int code);
	public ArrayList<resVo> getUnRes();
	public boolean updateDetailRes(resVo vo);
	public boolean updateDetailMenu(menuVo mvo);
	public boolean deleteMem(String id);
	public boolean deleteRes(int code,String uid);
	public ArrayList<menuVo> getMenu(int code);
}
