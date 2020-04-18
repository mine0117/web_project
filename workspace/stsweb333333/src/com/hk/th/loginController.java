package com.hk.th;

import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.th.service.loginService;
import com.hk.th.vo.MembersVo;


@Controller
public class loginController {

	@Resource(name="loginService")
	private loginService lS;
	
	@RequestMapping(value="/joinform.do", method = RequestMethod.GET)
	public String joinform(Model model, HttpServletRequest request ){
		
		ArrayList<MembersVo> Memlist =lS.getSelectMember();
		String uid = request.getParameter("uid");
		int result = lS.Memcheckid(uid);
		
		model.addAttribute("Memlist", Memlist);
		model.addAttribute("uidcheck", uid);	
		model.addAttribute("uid", uid);	
		return "/login/joinform";

	}
	
	@RequestMapping(value="/join.do", method = RequestMethod.POST)
	public String join(Model model, MembersVo vo){
		
		int reg = lS.InsertMemberDo(vo);
		if(reg!=0){
			return "main";
		}else{
			return "joinform";
		}


	}
	

}
