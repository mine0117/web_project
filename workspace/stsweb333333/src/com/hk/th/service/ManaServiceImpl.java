package com.hk.th.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hk.th.dao.ManaDao;
import com.hk.th.vo.bookVo;
import com.hk.th.vo.menuVo;
import com.hk.th.vo.resVo;

@Service("ManaService")
public class ManaServiceImpl implements ManaService{
	@Resource(name="ManaDao")
	private ManaDao mndao;
	
	@Override
	public ArrayList<bookVo> getNoShow() {
		ArrayList<bookVo> list = (ArrayList<bookVo>) mndao.selectNoShowList();
		return list;
	}

	@Override
	public boolean addPenalty(String id) {
		mndao.updatePenalty(id);
		mndao.updateConf(id);
		return true;
	}

	@Override
	public ArrayList<resVo> getRes() {
		ArrayList<resVo> list = (ArrayList<resVo>) mndao.selectResList();
		return list;
	}

	@Override
	public resVo getResDetail(int code) {
		resVo vo = mndao.selectResDetail(code);
		return vo;
	}

	@Override
	public ArrayList<resVo> getUnRes() {
		ArrayList<resVo> list = (ArrayList<resVo>) mndao.selectUnList();
		return list;
	}

	@Override
	public boolean updateDetailRes(resVo vo) {
		mndao.updateRes(vo);
	
		return true;
	}

	@Override
	public boolean deleteMem(String id) {
		mndao.deleteMem(id);
		return true;
	}

	@Override
	public boolean deleteRes(int code,String uid) {
		mndao.deleteRes(code);
		mndao.updateEnrollBack(uid);
		return true;
	}

	@Override
	public ArrayList<menuVo> getMenu(int code) {
		ArrayList<menuVo> list = (ArrayList<menuVo>) mndao.selectMenu(code);
		return list;
	}

	@Override
	public boolean updateDetailMenu(menuVo mvo) {
		mndao.updateMenu(mvo);
		return true;
	}

}
