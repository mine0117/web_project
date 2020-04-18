package com.hk.th;


import java.util.ArrayList;

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
import com.hk.th.vo.MembersVo;
import com.hk.th.vo.bookVo;
import com.hk.th.vo.menuVo;
import com.hk.th.vo.resVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ManagerController {
	
	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	
	@Resource(name="ManaService")
	private ManaService mnsv;
	@Resource(name="MypageUserService")
	private MypageUserService mysv;

	@RequestMapping(value="/manager_penalty.do",method=RequestMethod.GET)
	public String manager_penalty(Locale locale,Model model){
		logger.info("manager입장", locale);
		
		ArrayList<bookVo> list = mnsv.getNoShow();
		model.addAttribute("list",list);
		
		return "/manager/manager_penalty";
	}
	
	@RequestMapping(value="/addPenalty.do",method=RequestMethod.GET)
	public String addPenalty(Locale locale,Model model,HttpServletRequest request){
		logger.info("manager입장", locale);
		
		String id=request.getParameter("bo_uid");
		mnsv.addPenalty(id);
		
		ArrayList<bookVo> list = mnsv.getNoShow();
		model.addAttribute("list",list);
		
		return "redirect:manager_penalty.do";
	}
	
	@RequestMapping(value="/manager_memlist.do",method=RequestMethod.GET)
	public String manager_memlist(Locale locale,Model model){
		logger.info("manager입장", locale);
		
		ArrayList<MembersVo> list=mysv.getselectmembers();
		
		model.addAttribute("list",list);
		
		return "/manager/manager_memlist";
	}
	
	@RequestMapping(value="/manager_mem_detail.do",method=RequestMethod.GET)
	public String manager_mem_detail(Locale locale,Model model,HttpServletRequest request){
		logger.info("manager입장", locale);
		String id=request.getParameter("uid");
		
		MembersVo vo=mysv.getdetailmembers(id);
	
		String email=vo.getEmail();
		String email2=email.substring(email.indexOf("@")+1,email.length());//뒤
		email=email.substring(0,email.indexOf("@"));//앞
		vo.setEmail(email);   
		
		model.addAttribute("vo",vo);
		model.addAttribute("email2",email2);
		
		return "/manager/manager_mem_detail";
	}
	
	@RequestMapping(value="/manager_mem_update.do",method=RequestMethod.GET)
	public String manager_mem_update(Locale locale,Model model,MembersVo memvo,HttpServletRequest request){
		logger.info("manager입장", locale);
		
		String email=memvo.getEmail();
		String email2=request.getParameter("email2");
		memvo.setEmail(email+"@"+email2);
						
		mysv.getupdatemembers(memvo);

		String id=memvo.getUid();
		
		MembersVo vo=mysv.getdetailmembers(id);
		email=vo.getEmail();
		email2=email.substring(email.indexOf("@")+1,email.length());//뒤
		email=email.substring(0,email.indexOf("@"));//앞
		vo.setEmail(email);   
		
		model.addAttribute("vo",vo);
		model.addAttribute("email2",email2);
		
		return "/manager/manager_mem_detail";
	}
	
	@RequestMapping(value="/manager_mem_delete.do",method=RequestMethod.GET)
	public String manager_mem_delete(Locale locale,Model model,HttpServletRequest request){
		logger.info("manager입장", locale);
		
		String id = request.getParameter("uid");
			
		mnsv.deleteMem(id);
	
		return "redirect:manager_memlist.do";
	}
	
	
	@RequestMapping(value="/manager_askres_delete.do",method=RequestMethod.GET)
	public String manager_askres_delete(Locale locale,Model model,HttpServletRequest request){
		logger.info("manager입장", locale);
		
		int code =  Integer.parseInt(request.getParameter("res_code"));
		String uid = request.getParameter("res_uid");
		mnsv.deleteRes(code,uid);
	
		return "redirect:manager_asklist.do";
	}
	
	@RequestMapping(value="/manager_res_delete.do",method=RequestMethod.GET)
	public String manager_res_delete(Locale locale,Model model,HttpServletRequest request){
		logger.info("manager입장", locale);
		
		int code = Integer.parseInt(request.getParameter("res_code"));
		String uid = request.getParameter("res_uid");

		mnsv.deleteRes(code,uid);
	
		return "redirect:manager_reslist.do";
	}
	
	@RequestMapping(value="/manager_asklist.do",method=RequestMethod.GET)
	public String manager_asklist(Locale locale,Model model){
		logger.info("manager입장", locale);
		ArrayList<resVo> list = mnsv.getUnRes();
		model.addAttribute("list",list);
		
		return "/manager/manager_asklist";
	}

	
	@RequestMapping(value="/manager_ask_detail.do",method=RequestMethod.GET)
	public String manager_ask_detail(Locale locale,Model model,HttpServletRequest request){
		logger.info("manager입장", locale);
		int code = Integer.parseInt(request.getParameter("res_code"));
		resVo vo = mnsv.getResDetail(code);
		System.out.println(vo.getTheme());
		model.addAttribute("vo",vo);
		return "/manager/manager_ask_detail";
	}


	@RequestMapping(value="/manager_askres_update.do",method=RequestMethod.GET)
	public String manager_askres_update(Locale locale,Model model
			,HttpServletRequest request,resVo vo,menuVo mvo){
		logger.info("manager입장", locale);
		
		mnsv.updateDetailRes(vo);
		
		vo = mnsv.getResDetail(vo.getRes_code());
		
		model.addAttribute("vo",vo);
		
		return "/manager/manager_ask_detail";
		
	}
	
	@RequestMapping(value="/manager_reslist.do",method=RequestMethod.GET)
	public String manager_reslist(Locale locale,Model model){
		logger.info("manager입장", locale);

		ArrayList<resVo> list = mnsv.getRes();
		
		model.addAttribute("list",list);
		
		return "/manager/manager_reslist";
	}


	@RequestMapping(value="/manager_res_detail.do",method=RequestMethod.GET)
	public String manager_res_deatil(Locale locale,Model model,HttpServletRequest request){
		logger.info("manager입장", locale);
	
		int code = Integer.parseInt(request.getParameter("res_code"));
		
		resVo vo = mnsv.getResDetail(code);
		ArrayList<menuVo> list = mnsv.getMenu(code);
		
		
		model.addAttribute("vo",vo);
		model.addAttribute("list",list);

		return "/manager/manager_res_detail";
	}
	
	@RequestMapping(value="/manager_res_update.do",method=RequestMethod.GET)
	public String manager_res_update(Locale locale,Model model,
			HttpServletRequest request,resVo vo,menuVo mvo){
		logger.info("manager입장", locale);
		
	
		mnsv.updateDetailRes(vo);

		int code = vo.getRes_code();
		System.out.println(code);
		vo = mnsv.getResDetail(code);
		ArrayList<menuVo> list = mnsv.getMenu(code);
		
		model.addAttribute("vo",vo);
		model.addAttribute("list",list);
		
		return "/manager/manager_res_detail";
		
	}

	@RequestMapping(value="/manager_menu_update.do",method=RequestMethod.GET)
	public String manager_menu_update(Locale locale,Model model,
			HttpServletRequest request,resVo vo,menuVo mvo){
		logger.info("manager입장", locale);
		mnsv.updateDetailMenu(mvo);
		
		int code = vo.getRes_code();
		System.out.println(code);
		vo = mnsv.getResDetail(code);
		ArrayList<menuVo> list = mnsv.getMenu(code);
		
		model.addAttribute("vo",vo);
		model.addAttribute("list",list);
		
		return "/manager/manager_res_detail";
		
	}

	


}

