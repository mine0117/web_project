package com.hk.th;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.th.service.MainresService;
import com.hk.th.service.regionService;
import com.hk.th.vo.regionVo;
import com.hk.th.vo.resVo;


@Controller
public class MainController {

	@Resource(name="MainresService")
	private MainresService Mrs;
	
	@Resource(name="regionService")
	private regionService rs;

	
	@RequestMapping(value="/north.do",method = RequestMethod.GET)
	public String north(Model model, HttpServletRequest request) {
	int map_num = Integer.parseInt(request.getParameter("map_num"));//100

		
		ArrayList<resVo> list = Mrs.getResByMap(map_num);
		System.out.println(list);


		model.addAttribute("map_num",map_num);
		model.addAttribute("list", list);
		return "north";
	}

	@RequestMapping(value="/theme.do",method = RequestMethod.GET)
	public String theme(Model model, HttpServletRequest request) {
	int map_num = Integer.parseInt(request.getParameter("map_num"));//100
	String theme = request.getParameter("theme");
		ArrayList<resVo> thelist = Mrs.getResBytheme(theme);
		ArrayList<resVo> list = Mrs.getResByMap(map_num);
		System.out.println(list);
		System.out.println(theme);

		model.addAttribute("map_num",map_num);
/*		model.addAttribute("list", list);
*/		model.addAttribute("theme", thelist);
		return "/theme/theme";
	}

}
