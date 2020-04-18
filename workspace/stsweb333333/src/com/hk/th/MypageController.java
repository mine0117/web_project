package com.hk.th;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.th.service.ManaService;
import com.hk.th.service.MypageUserService;
import com.hk.th.vo.bookVo;
import com.hk.th.vo.resVo;
import com.hk.th.vo.MembersVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MypageController {
	
	
	@Resource(name="MypageUserService")
	private MypageUserService mysvs;

	
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/form_myres.do", method = RequestMethod.GET)
	public String form_myres(Model model ){
	
		
		
		return "/mypage/form_myres";
		
	
	}
	
	@RequestMapping(value = "/mypage_reservation_shop.do", method = RequestMethod.GET)
	public String mypage_reservation_shop(Model model,HttpServletRequest request,resVo resvo ){
		
		int res_code=resvo.getRes_code();
		
		
		//�쓬�떇�젏 �삁�빟�뱾�쓣 蹂닿린 �쐞�븳 肄붾뱶�뱾
		ArrayList<bookVo> lists=mysvs.getselectbook(res_code);
		
		model.addAttribute("lists",lists);
		model.addAttribute("res_code",res_code);
		

		
		return "/mypage/mypage_reservation_shop";
		
	
	}
	
	@RequestMapping(value = "/mypage_user_info.do", method = RequestMethod.GET)
	public String mypage_user_info(Model model,HttpServletRequest request,MembersVo memvo ){
		
		
		
		//song_ga瑜� 媛믪쑝濡� 媛��졇媛��꽌 list�뱾�쓣 肉뚮젮以��떎.
		String uid="song_ga";
		
		//String id=request.getParameter("uid");	
		MembersVo list= mysvs.getdetailmembers(uid);	
		model.addAttribute("uid",uid);
		
		
		//email瑜� 吏ㅻ씪�꽌 �꽔�뼱以��떎.
		String email=list.getEmail();
		String email2=email.substring(email.indexOf("@")+1,email.length());//�뮘
		email=email.substring(0,email.indexOf("@"));//�븵
		list.setEmail(email);   
		model.addAttribute("list",list);
		model.addAttribute("email2",email2);
		
		
		//enroll�뿬遺� �솗�씤
		//String id="song_ga";		
		String check=mysvs.getcheckmembers(uid);//1�씠硫� �벑濡앹씠 �릺�뼱�엳怨�,0�씠硫� �벑濡앹씠 �릺�뼱�엳吏��븡�떎.
		System.out.println(check+"sadasdsadsada");
		model.addAttribute("check",check);
		
	
		
		return "/mypage/mypage_user_info";
		
	
	}
	
	@RequestMapping(value = "/mypage_user_info2.do", method = RequestMethod.GET)
	public String mypage_user_info2(Model model,HttpServletRequest request,MembersVo membersvo ){
		
		
		//�닔�젙踰꾪듉�쓣 �닃�윭�꽌 �삩 媛믩뱾�쓣(�씠硫붿씪) �젙由ы븳�떎.	
		//�씠硫붿씪媛믪쓣 媛��졇�삩�떎
		String email=membersvo.getEmail();				
		String email2=request.getParameter("email2");
		membersvo.setEmail(email+"@"+email2);//song+ @+naver.com
		
		//�닔�젙�븳 �씠硫붿씪�뱾�쓣 �꽔�뼱以��떎.
		int list=mysvs.getupdatemembers(membersvo);
		model.addAttribute("list",list);
		model.addAttribute("email2",email2);
		
		return "redirect:mypage_user_info.do";
		
	
	}
	

	
	@RequestMapping(value = "/mypage_user_myres.do", method = RequestMethod.GET)
	public String mypage_user_myres(Model model, HttpServletRequest request,resVo vo,MembersVo memvo){
		
		String res_uid=request.getParameter("uid");
		
		resVo vo1=mysvs.getselectRes_code(res_uid);
		
		
		
		
		
		model.addAttribute("vo",vo1);
		
		
		//�벑濡앹뿬遺�瑜� �솗�씤�븳�떎.(�븘�씠�뵒瑜� �꽔�뼱以��떎)
		String uid=request.getParameter("uid");		
		String check=mysvs.getcheckmembers(uid);
		int check2=Integer.valueOf(check);
		model.addAttribute("check",check);
		model.addAttribute("id",res_uid);
		
		
		if(check2!=0){
			return "/mypage/mypage_user_myres";
		}else{
			return "/mypage/form_myres";
		}
		
		
		
		
		
	
	}
	
	@RequestMapping(value = "/mypage_user_myres2.do", method = RequestMethod.GET)
	public String mypage_user_myres2(Model model, HttpServletRequest request,resVo resvo){
		
			
		mysvs.getupdateres(resvo);				
		resvo=mysvs.getselectRes_code(resvo.getRes_uid());				
		model.addAttribute("vo",resvo);
		
		return "/mypage/mypage_user_myres";
		

	}
	
	@RequestMapping(value = "/mypage_user_myres_path.do", method = RequestMethod.GET)
	public String mypage_user_myres_path(Model model, HttpServletRequest request,resVo resvo){
		//�쓬�떇�젏�삁�빟�뿉�꽌 �굹�쓽 �쓬�떇�젏�쑝濡� 媛��뒗 寃쎌쑀吏�
		String res_uid="song_ga";
		resvo.setRes_uid(res_uid);
		resVo vo1=mysvs.getselectRes_code(res_uid);
	
		model.addAttribute("vo",vo1);
		
		
		return "/mypage/mypage_user_myres";
		

	}
	
	@RequestMapping(value = "/delete_myres.do", method = RequestMethod.GET)
	public String delete_myres(Model model, HttpServletRequest request,resVo resvo){
		
		String res_uid=request.getParameter("res_uid");
		
		
		mysvs.getdelete(res_uid);
		
		int res_code=resvo.getRes_code();
		if(res_code==0){
			
			mysvs.getupdateenroll(res_uid);
			
		}
		return "redirect:mypage_user_info.do";
		
		
		
		

	}
	
	@RequestMapping(value = "/mypage_user_check.do", method = RequestMethod.GET)
	public String mypage_user_check(Model model,resVo resvo,MembersVo memvo ){
		
		String uid="song_ga";
		int insert=mysvs.getinsertres(resvo,uid);
		
		
		//String check=mysvs.getcheckmembers(uid);
		
		//check="1";
		//MembersVo list= mysvs.getdetailmembers(uid);
		//list.setEnroll(check);
		
		return "redirect:mypage_user_info.do";
		
	
	}
	
	@RequestMapping(value = "/reservation_shop_detail.do", method = RequestMethod.GET)
	public String reservation_shop_detail(Model model,bookVo bookvo,resVo resvo ){
	
		int bo_code=bookvo.getBo_code();
		
		/*String email=bookvo.getBo_email();
		String email2=email.substring(email.indexOf("@")+1,email.length());//�뮘
		email=email.substring(0,email.indexOf("@"));//�븵
		bookvo.setBo_email(email);   
		model.addAttribute("email2",email2);
		System.out.println(bookvo.getBo_email()+"ssssssssssssss");
		*/
		
		bookvo=mysvs.getdetailbook(bo_code);
		String email=bookvo.getBo_email();
		String email2=email.substring(email.indexOf("@")+1,email.length());//�뮘
		email=email.substring(0,email.indexOf("@"));//�븵
		
		
		
		bookVo detail=mysvs.getdetailbook(bo_code);
		detail.setBo_email(email);
		
		model.addAttribute("detail",detail);
		model.addAttribute("email2",email2);
		return "/mypage/reservation_shop_detail";
		
	
	}
	
	@RequestMapping(value = "/reservation_shop_detail2.do", method = RequestMethod.GET)
	public String reservation_shop_detail2(Model model,bookVo bookvo,resVo resvo,HttpServletRequest request ){
			
			
			int bo_code=bookvo.getBo_code();
			mysvs.getupdateconf(bo_code);
			bookvo=mysvs.getdetailbook(bo_code);
			String email2=request.getParameter("email2");			
			String email=bookvo.getBo_email();
			email=email.substring(0,email.indexOf("@"));
			bookvo.setBo_email(email);
			
			model.addAttribute("detail",bookvo);
			model.addAttribute("email2",email2);
			
		
		return "/mypage/reservation_shop_detail";
		
	
		
	}
	

}

