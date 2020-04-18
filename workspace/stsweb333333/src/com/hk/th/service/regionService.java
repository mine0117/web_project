package com.hk.th.service;

import java.util.ArrayList;
import com.hk.th.vo.regionVo;



public interface regionService {

	
	ArrayList<regionVo> getregionlist();
	regionVo getregionNamelist(String map_name);
	ArrayList<regionVo> getsouthlist();
	ArrayList<regionVo> getnorthlist();
	
	
}
