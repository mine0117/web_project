package com.hk.th.dao;

import java.util.List;
import com.hk.th.vo.regionVo;



public interface regionDao {

	public List<regionVo> Selectregionlist();
	public regionVo Selectregionnamelist(String map_name);
	public List<regionVo> Selectsouthlist();
	public List<regionVo> Selectnorthlist();
	

	
}
