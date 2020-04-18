package com.hk.th.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.hk.th.dao.regionDao;
import com.hk.th.vo.regionVo;

@Repository("regionService")
public class regionServiceImpl implements regionService{
	
	@Resource(name="regionDao")
	private regionDao regiondb;
	@Override
	public ArrayList<regionVo> getregionlist() {
		
		ArrayList<regionVo> rlist = (ArrayList<regionVo>)regiondb.Selectregionlist();
		
		return rlist;
	}
	
	@Override
	public ArrayList<regionVo> getsouthlist() {
		
		ArrayList<regionVo> rlist =(ArrayList<regionVo>)regiondb.Selectsouthlist();
		return rlist;
	}
	@Override
	public ArrayList<regionVo> getnorthlist() {
		ArrayList<regionVo> rlist =(ArrayList<regionVo>)regiondb.Selectnorthlist();
		return rlist;
	}

	@Override
	public regionVo getregionNamelist(String map_name) {
		
		regionVo svres = regiondb.Selectregionnamelist(map_name);
		return svres;
	}

	

}
