package com.hk.th;

import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.th.service.qnaService;
import com.hk.th.vo.qnaVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class qnaController {
	
	private static final Logger logger = LoggerFactory.getLogger(qnaController.class);
	
	@Resource(name="qnaService")
	private qnaService qsv;
	
	//qna게시글 목록
	@RequestMapping(value = "/qna.do", method = RequestMethod.GET)
	public String qna(Model model ){
		
		ArrayList<qnaVo> list = qsv.qnaList();
		
	
		model.addAttribute("list",list);
		
		return "/Q&A/qna";
			
	}
		
	//qna게시글 작성처리
	@RequestMapping(value = "/qna_insert.do", method = RequestMethod.GET)
	public String qna_insert(qnaVo qnavo,Model model,HttpServletRequest request){
		
		qnavo.setQ_title(request.getParameter("title"));
		qnavo.setQ_contents(request.getParameter("content"));
		int insert=qsv.insert(qnavo);
		if(insert==0){ 
			return "error";
		}else{
			return "redirect:qna.do";
		}				
	}
	
	//qna게시글 작성화면
	@RequestMapping(value = "/qna_write.do", method = RequestMethod.GET)
	public String qna_write(Model model){
		
		
		return "/Q&A/qna_write";
		
	
	}
	
	//qna게시글 수정화면
	@RequestMapping(value = "/qna_modify.do", method = RequestMethod.GET)
	public String qna_modify(Model model,HttpServletRequest request){
		
		//선택한 num (id 로 바뀔예정) 값을 가져온다.
		int num=Integer.parseInt(request.getParameter("num"));
		
		qnaVo qnaVo=null;
		qnaVo=qsv.getqnaBynum(num);
		
		model.addAttribute("num",num);
		model.addAttribute("qnaVo",qnaVo);

		
		return "/Q&A/qna_modify";
		
	
	}
	//qna게시글 정보수정처리
	@RequestMapping(value = "/qna_update.do", method = RequestMethod.POST)
	public String qna_update(Model model,HttpServletRequest request,qnaVo qnaVo){
		
		try{
			qsv.updateqna(qnaVo);
		  } catch (Exception e){
	            e.printStackTrace();
	      }        

		String num = request.getParameter("q_num");
		
		model.addAttribute("q_num",num);
		
		return "redirect:/qna_detail.do";
		
	
	}

	
	//qna게시글 상세정보
	@RequestMapping(value = "/qna_detail.do", method = RequestMethod.GET)
	public String qna_detail(Model model,HttpServletRequest request,qnaVo qnavo ){
		
		String n = request.getParameter("q_num");
		int q_hits=qnavo.getQ_hits();
		
		int num = Integer.parseInt(n);
		qsv.updatecount(num,q_hits);	
		qnaVo list=qsv.detailqna(num);
		
		
		model.addAttribute("list",list);
		
		return "/Q&A/qna_detail";
		
	
	}
	
	//게시물 삭제
	@RequestMapping(value = "/qna_delete.do", method = RequestMethod.GET)
	public String qna_delete(Model model,HttpServletRequest request ){
		int num =Integer.parseInt(request.getParameter("q_num"));
		
		int deleteresult =qsv.deleteqna(num);
		
		return "redirect:qna.do";
		
	
	}
	//자주하는 질문
	@RequestMapping(value = "/qna_manyanswer.do", method = RequestMethod.GET)
	public String qna_manyanswer(Model model ){
		
		
		
		return "/Q&A/qna_manyanswer";
		
	
	}
	//게시물 검색
	@RequestMapping(value = "/qnasearch.do", method = RequestMethod.GET)
	public String qnasearch(Model model,HttpServletRequest request,qnaVo qnavo ){
		
		String id=request.getParameter("id");
		String stype=request.getParameter("stype");
		
		ArrayList<qnaVo> list=qsv.searchId(id, stype);		
		model.addAttribute("list",list);
		
		
		return "/Q&A/qna";
		
	
	}
}
	