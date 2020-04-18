package com.hk.th.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hk.th.dao.bookDao;
import com.hk.th.vo.bookVo;

@Service("bookService")
public class bookServiceImpl implements bookService{

	@Resource(name="bookDao")
	private bookDao boDao;

	
	
	
}
