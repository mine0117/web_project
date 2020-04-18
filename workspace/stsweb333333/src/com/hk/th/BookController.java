package com.hk.th;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.th.service.bookService;
import com.hk.th.vo.bookVo;
import com.hk.th.vo.resVo;


@Controller
public class BookController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

	@Resource(name="bookService")
	private bookService bosv;
	
//	�삁�빟硫붿씤
	@RequestMapping(value = "/resv.do", method = RequestMethod.GET)
	public String reservation(Model model,Locale locale ){
		//ArrayList<resVo> list = bosv.();
		//model.addAttribute("list",list);
		
		//System.out.println(list.toString());
		
		
		
		return "/reservation/reservation";
	}
	
//	�삁�빟留쏆쭛 寃��깋
	@RequestMapping(value = "/resv_find.do", method = RequestMethod.GET)
	public String reservation_find(Model model,Locale locale,HttpServletRequest request){
		
		String foodcode = request.getParameter("foodcode");
		String themacode = request.getParameter("themacode");
		String locationcode = request.getParameter("locationcode");
		
		return "/reservation/reservation_search";
	}
	
//	�삁�빟�젙蹂� �엯�젰 �뤌 
	@RequestMapping(value = "/resv_info.do", method = RequestMethod.GET)
	public String reservation_info(Model model,Locale locale ){

		return "/reservation/reservation_info";
	}
	
//  �삁�빟�젙蹂� 泥섎━
	@RequestMapping(value = "/reservation.do", method = RequestMethod.GET)
	public String MYreservation(Model model,Locale locale,HttpServletRequest request,HttpServletResponse response){
		
		String bo_name = request.getParameter("bo_name");
		String bo_id = request.getParameter("bo_id");
		String bo_date = request.getParameter("bo_date");
		String bo_time = request.getParameter("bo_time");
		String bo_human = request.getParameter("bo_human");
		String bo_tel = request.getParameter("bo_tel");
		String bo_email = request.getParameter("bo_email");
		String bo_dotcom = request.getParameter("myselect");
		String mail = bo_email + "@"+ bo_dotcom;
		
		/*System.out.println(bo_name);
		System.out.println(bo_id);
		System.out.println(bo_date);
		System.out.println(bo_time);
		System.out.println(bo_human);
		System.out.println(bo_tel);
		System.out.println(mail);*/
		
		return "redirect:resv_my.do";
	}
	
//	�굹�쓽 �삁�빟 �젙蹂�
	@RequestMapping(value = "/resv_my.do", method = RequestMethod.GET)
	public String reservation_my(Model model,Locale locale ){

		return "/reservation/reservation_my";
	}
	
//	�삁�빟�젙蹂� �솗�씤	
	@RequestMapping(value = "/resv_detail.do", method = RequestMethod.GET)
	public String reservation_detail(Model model,Locale locale ){

		return "/reservation/reservation_detail";
		
	}
	
	
		
	
	


}
