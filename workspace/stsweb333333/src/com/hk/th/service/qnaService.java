package com.hk.th.service;

import java.util.ArrayList;

import com.hk.th.vo.qnaVo;

public interface qnaService {
	//qna select
	public ArrayList<qnaVo> qnaList();
	
	//qna insert
	public int insert(qnaVo qnaVo);
	
	//qna detail
	public qnaVo detailqna(int num);
	
	//qna delete
	public int deleteqna(int num);
	
	//qna update
	public qnaVo getqnaBynum(int num);
	public int updateqna(qnaVo qnaVo);
	//qna update hits
	public int updatecount(int num,int q_hits);
	
	//qna search
	public ArrayList<qnaVo> searchId(String id,String stype);
}
