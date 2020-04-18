package com.hk.th.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.hk.th.dao.MainresDao;
import com.hk.th.vo.resVo;

@Repository("MainresService")
public class MainresServiceImpl implements MainresService {

	@Resource(name="MainresDao")
	private MainresDao mainresdb;
	public ArrayList<resVo> getMainrestlist() {
		
		ArrayList<resVo> Mainreslist =null;
		Mainreslist= (ArrayList<resVo>)mainresdb.Selectmrestlist();
		return Mainreslist;
	}

	@Override
	public resVo getMainrescodelist(String map_num) {
		resVo Mainrescodelist = mainresdb.Selectmrescodelist(map_num);
		return  Mainrescodelist;
	}

	@Override
	public ArrayList<resVo> getsouthreslist() {
		
		ArrayList<resVo> southlist = null;
		southlist = (ArrayList<resVo>)mainresdb.southreslist();
		return southlist;
	}

	@Override
	public ArrayList<resVo> getlinelist(String line) {
		ArrayList<resVo> linelist = (ArrayList<resVo>)mainresdb.Selectlinelist(line);
		return linelist;
	}

	@Override
	public ArrayList<resVo> getResByMap(int num) {
		ArrayList<resVo> list = (ArrayList<resVo>)mainresdb.selectResByMap(num);
		return list;
	}

	@Override
	public ArrayList<resVo> getResBytheme(String theme) {
		ArrayList<resVo> list = (ArrayList<resVo>)mainresdb.selectResBytheme(theme);
		return list;
	}

}
