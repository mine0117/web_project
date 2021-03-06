package com.hk.th.dao;


import java.util.List;

import com.hk.th.vo.qnaVo;

public interface qnaDao {
	//qna select
	public List<qnaVo> selectqnaList();
	
	//qna insert
	public int insertqna(qnaVo qnaVo);
	
	//qna detail
	public qnaVo detailqna(int num);
	
	//qna delete
	public int deleteqna(int num);
	
	//qna update
	public int updateqna(qnaVo qnaVo);
	public qnaVo selectqnaBynum(int num);
	//qna update hits
	public int updatecount(int num,int q_hits);
	
	//qna search
	public List<qnaVo> searchId(String id,String stype);
	
}
