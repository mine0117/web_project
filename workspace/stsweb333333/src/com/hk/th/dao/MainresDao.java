package com.hk.th.dao;

import java.util.List;


import com.hk.th.vo.resVo;

public interface MainresDao {

	public List<resVo> Selectmrestlist();
	public resVo Selectmrescodelist(String map_num);
	public List<resVo> Selectlinelist(String line);
	
	public List<resVo> southreslist();
	
	
	public List<resVo> selectResByMap(int num);
	
	public List<resVo> selectResBytheme(String theme);
	
}
