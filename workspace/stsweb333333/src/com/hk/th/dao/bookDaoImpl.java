package com.hk.th.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.th.vo.bookVo;

@Repository("bookDao")
public class bookDaoImpl implements bookDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String ns = "book.";




}
