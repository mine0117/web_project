package com.hk.th.service;

import java.util.ArrayList;

import com.hk.th.vo.resVo;

public interface MainresService {

	public ArrayList<resVo> getMainrestlist();
	public resVo getMainrescodelist(String map_num);
	public ArrayList<resVo> getsouthreslist();
	public ArrayList<resVo> getlinelist(String line);
	
	public ArrayList<resVo> getResByMap(int num);
	public ArrayList<resVo> getResBytheme(String theme);
}
