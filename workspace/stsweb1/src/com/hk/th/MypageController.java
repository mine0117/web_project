package com.hk.th;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.th.service.MainresService;
import com.hk.th.service.ManaService;
import com.hk.th.service.MypageUserService;
import com.hk.th.vo.bookVo;
import com.hk.th.vo.menuVo;
import com.hk.th.vo.resVo;
import com.hk.th.vo.MembersVo;
import com.hk.th.vo.Paging;


/**
 * Handles requests for the application home page.
 */
@Controller
public class MypageController {
	
	
	@Resource(name="MypageUserService")
	private MypageUserService mysvs;

	@Resource(name="MainresService")
	private MainresService Mrs;
	

	
	Paging pagemaker;	//�럹�씠吏뺤쓣 �궗�슜�븯湲� �쐞�븳 寃�.

	

	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		int map_num=120;
		
		//int map_num = Integer.parseInt(request.getParameter("map_num"));//100
		int currentPageNo=1;
		int maxPost=5;
		
		if(request.getParameter("pages") != null)//寃뚯떆臾쇱씠 1媛쒕룄�뾾�쑝硫�(=�럹�씠吏�媛� �깮�꽦�씠 �븞�릺�뿀�쑝硫�)�씠 �븘�땲�씪硫� == �럹�씠吏뺤씠 �깮�꽦�릺�뿀�떎硫�
			currentPageNo = Integer.parseInt(request.getParameter("pages")); //pages�뿉�엳�뒗 string ���엯 蹂��닔瑜� int�삎�쑝濡� 諛붽씀�뼱�꽌 currentPageNo�뿉 �떞�뒗�떎.
		
		Paging paging = new Paging(currentPageNo, maxPost); //Paging.java�뿉�엳�뒗 currentPAgeNo, maxPost瑜� paging蹂��닔�뿉 �떞�뒗�떎.
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getmaxPost(); // query.xml�뿉�꽌 select瑜� �븷�븣 �궗�슜�븯湲곗쐞�븳 offset 蹂��닔�쓽 �꽑�뼵. 
		// �쁽�옱 3�럹�씠吏� �씠怨�, 洹� �럹�씠吏��뿉 寃뚯떆臾쇱씠 10媛쒓� �엳�떎硫� offset媛믪� (3-1) * 10 = 20�씠 �맂�떎.
			

		paging.setNumberOfRecords(Mrs.getrescount(map_num)); // �럹�씠吏�瑜� �몴�떆�븯湲� �쐞�빐 �쟾泥� 寃뚯떆臾� �닔瑜� �뙆�븙�븯湲� �쐞�븳寃�
		
		paging.makePaging(); 
		
	
		ArrayList<resVo> page = new ArrayList<resVo>(); 
		page = (ArrayList<resVo>) Mrs.getpagereslist(offset, paging.getmaxPost(), map_num);
		ArrayList<String> piclist = new ArrayList<String>();
		String[] arr = null;
	    for(int i =0; i<page.size(); i++) {
	    	String temp = page.get(i).getPics();
	    	
	    	for(int a=0;a<6;a++){
	    		arr = temp.split("/");
	    		piclist.add(arr[a]);
	    	}

	    }
	   
	    model.addAttribute("piclist",piclist);
		model.addAttribute("map_num",map_num);
		model.addAttribute("list",page);
		model.addAttribute("paging",paging);
		
		
		
		return "main";
		
	
	}
	
	@RequestMapping(value = "/form_myres.do", method = RequestMethod.GET)
	public String form_myres(Model model ){
	
		
		
		return "/mypage/form_myres";
		
	
	}
	
	@RequestMapping(value = "/mypage_reservation_shop.do", method = RequestMethod.GET)
	public String mypage_reservation_shop(Model model,HttpServletRequest request,resVo resvo ){
		
		String uid=request.getParameter("uid");
		MembersVo membervo=mysvs.getdetailmembers(uid);
		String enroll=membervo.getEnroll();
		//int enroll=Integer.valueOf(enroll_str);
		resvo=mysvs.getselectRes_code(uid);
				
		
		
	
		
		if(enroll.equals("誘몃벑濡�")){
			return "/mypage/form_myres";
		}
			
		int res_code=resvo.getRes_code();
		int currentPageNo=1;
		int maxPost=5;
		
		if(request.getParameter("pages") != null)//寃뚯떆臾쇱씠 1媛쒕룄�뾾�쑝硫�(=�럹�씠吏�媛� �깮�꽦�씠 �븞�릺�뿀�쑝硫�)�씠 �븘�땲�씪硫� == �럹�씠吏뺤씠 �깮�꽦�릺�뿀�떎硫�
			currentPageNo = Integer.parseInt(request.getParameter("pages")); //pages�뿉�엳�뒗 string ���엯 蹂��닔瑜� int�삎�쑝濡� 諛붽씀�뼱�꽌 currentPageNo�뿉 �떞�뒗�떎.
		
		Paging paging = new Paging(currentPageNo, maxPost); //Paging.java�뿉�엳�뒗 currentPAgeNo, maxPost瑜� paging蹂��닔�뿉 �떞�뒗�떎.
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getmaxPost(); // query.xml�뿉�꽌 select瑜� �븷�븣 �궗�슜�븯湲곗쐞�븳 offset 蹂��닔�쓽 �꽑�뼵. 
		// �쁽�옱 3�럹�씠吏� �씠怨�, 洹� �럹�씠吏��뿉 寃뚯떆臾쇱씠 10媛쒓� �엳�떎硫� offset媛믪� (3-1) * 10 = 20�씠 �맂�떎.
			
		
		ArrayList<bookVo> page = new ArrayList<bookVo>(); // WriteInfo�뿉 �엳�뒗 蹂��닔�뱾�쓣 ArrayList ���엯�쓽 諛곗뿴濡� �몦 �떎�쓬 �씠瑜� page�씪�뒗 蹂��닔�뿉 �떞�뒗�떎.
		page = (ArrayList<bookVo>) mysvs.getpageList(offset, paging.getmaxPost(),res_code); 
		//writeService.java�뿉 �엳�뒗 writeList �븿�닔瑜� �씠�슜�븯�뿬 offset媛믨낵 maxPost媛믪쓣 ArrayList ���엯�쓽 諛곗뿴濡� �떞怨�, �씠 諛곗뿴 �옄泥대�� page 蹂��닔�뿉 �떞�뒗�떎.																							
		
		paging.setNumberOfRecords(mysvs.getpageGetCount(res_code)); // �럹�씠吏�瑜� �몴�떆�븯湲� �쐞�빐 �쟾泥� 寃뚯떆臾� �닔瑜� �뙆�븙�븯湲� �쐞�븳寃�
		
		paging.makePaging(); 
		
		model.addAttribute("res_code",res_code);
		model.addAttribute("lists",page);
		model.addAttribute("paging",paging);
		
		
		
		

		
		return "/mypage/mypage_reservation_shop";
		
	
	}
	
	@RequestMapping(value = "/mypage_reservation_shop2.do", method = RequestMethod.GET)
	public String mypage_reservation_shop2(Model model,HttpServletRequest request,resVo resvo ){
		
		
		String res_code1=request.getParameter("res_code");
		
		int res_code=Integer.valueOf(res_code1);
		
	
		
		if(res_code==0){
			return "redirect: mypage_user_info.do";
		}
			
		
		int currentPageNo=1;
		int maxPost=5;
		
		if(request.getParameter("pages") != null)//寃뚯떆臾쇱씠 1媛쒕룄�뾾�쑝硫�(=�럹�씠吏�媛� �깮�꽦�씠 �븞�릺�뿀�쑝硫�)�씠 �븘�땲�씪硫� == �럹�씠吏뺤씠 �깮�꽦�릺�뿀�떎硫�
			currentPageNo = Integer.parseInt(request.getParameter("pages")); //pages�뿉�엳�뒗 string ���엯 蹂��닔瑜� int�삎�쑝濡� 諛붽씀�뼱�꽌 currentPageNo�뿉 �떞�뒗�떎.
		
		Paging paging = new Paging(currentPageNo, maxPost); //Paging.java�뿉�엳�뒗 currentPAgeNo, maxPost瑜� paging蹂��닔�뿉 �떞�뒗�떎.
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getmaxPost(); // query.xml�뿉�꽌 select瑜� �븷�븣 �궗�슜�븯湲곗쐞�븳 offset 蹂��닔�쓽 �꽑�뼵. 
		// �쁽�옱 3�럹�씠吏� �씠怨�, 洹� �럹�씠吏��뿉 寃뚯떆臾쇱씠 10媛쒓� �엳�떎硫� offset媛믪� (3-1) * 10 = 20�씠 �맂�떎.
			
		
		ArrayList<bookVo> page = new ArrayList<bookVo>(); // WriteInfo�뿉 �엳�뒗 蹂��닔�뱾�쓣 ArrayList ���엯�쓽 諛곗뿴濡� �몦 �떎�쓬 �씠瑜� page�씪�뒗 蹂��닔�뿉 �떞�뒗�떎.
		page = (ArrayList<bookVo>) mysvs.getpageList(offset, paging.getmaxPost(),res_code); 
		//writeService.java�뿉 �엳�뒗 writeList �븿�닔瑜� �씠�슜�븯�뿬 offset媛믨낵 maxPost媛믪쓣 ArrayList ���엯�쓽 諛곗뿴濡� �떞怨�, �씠 諛곗뿴 �옄泥대�� page 蹂��닔�뿉 �떞�뒗�떎.																							
		
		paging.setNumberOfRecords(mysvs.getpageGetCount(res_code)); // �럹�씠吏�瑜� �몴�떆�븯湲� �쐞�빐 �쟾泥� 寃뚯떆臾� �닔瑜� �뙆�븙�븯湲� �쐞�븳寃�
		
		paging.makePaging(); 
		
		model.addAttribute("res_code",res_code);
		model.addAttribute("lists",page);
		model.addAttribute("paging",paging);
		
		
		
		

		
		return "/mypage/mypage_reservation_shop";
		
	
	}
	
	@RequestMapping(value = "/mypage_user_info.do", method = RequestMethod.GET)
	public String mypage_user_info(Model model,HttpServletRequest request,MembersVo memvo,resVo resvo ){
		
		HttpSession session = request.getSession();
		//song_ga瑜� 媛믪쑝濡� 媛��졇媛��꽌 list�뱾�쓣 肉뚮젮以��떎.
		String uid=(String) session.getAttribute("loginUid");
		
		//String id=request.getParameter("uid");	
		MembersVo list= mysvs.getdetailmembers(uid);	
		model.addAttribute("uid",uid);
		
		
		//email瑜� 吏ㅻ씪�꽌 �꽔�뼱以��떎.
		String email=list.getEmail();
		String email2=email.substring(email.indexOf("@")+1,email.length());//�뮘
		email=email.substring(0,email.indexOf("@"));//�븵
		list.setEmail(email);  
		String enroll=list.getEnroll();
		model.addAttribute("list",list);
		model.addAttribute("email2",email2);
		model.addAttribute("enroll",enroll);
	
	
		
		return "/mypage/mypage_user_info";
		
	
	}
	
//	�긽�꽭�젙蹂� �닔�젙
	
	@RequestMapping(value = "/mypage_user_info2.do", method = RequestMethod.GET)
	public String mypage_user_info2(Model model,HttpServletRequest request,MembersVo membersvo ){
		
		
	
		String email=request.getParameter("email");
		String email2=request.getParameter("email2");
		membersvo.setEmail(email+"@"+email2);//song+ @+naver.com
		
		//�닔�젙�븳 �씠硫붿씪�뱾�쓣 �꽔�뼱以��떎.
		mysvs.getupdatemembers(membersvo);
		
	
		String uid=membersvo.getUid();
		
		MembersVo list= mysvs.getdetailmembers(uid);
		
		
		email=list.getEmail();
		
		
		email2=email.substring(email.indexOf("@")+1,email.length());//�뮘
		email=email.substring(0,email.indexOf("@"));//�븵
		list.setEmail(email);  
		
		model.addAttribute("list",list);
		model.addAttribute("email2",email2);
		return "/mypage/mypage_user_info";
		
	
	}
	

	
	@RequestMapping(value = "/mypage_user_myres.do", method = RequestMethod.GET)
	public String mypage_user_myres(Model model, HttpServletRequest request,resVo vo,MembersVo memvo){
		
		String res_uid=request.getParameter("uid");
		
		resVo vo1=mysvs.getselectRes_code(res_uid);
		
		
		
		
		//�벑濡앹뿬遺�瑜� �솗�씤�븳�떎.(�븘�씠�뵒瑜� �꽔�뼱以��떎)
		String uid=request.getParameter("uid");		
		String check=mysvs.getcheckmembers(uid);
		
		
		//int check2=Integer.valueOf(check);
		model.addAttribute("check",check);
		model.addAttribute("uid",uid);
		
		
		if(check.equals("�벑濡�")){
			int res_code=vo1.getRes_code();
			ArrayList<menuVo> list=mysvs.getselectmenu(res_code);			
			model.addAttribute("list",list);
			model.addAttribute("vo",vo1);
			return "/mypage/mypage_user_myres";
			
		}else{
		
			return "/mypage/form_myres";
		}
		
		
		
		
		
	
	}
	
	@RequestMapping(value = "/mypage_user_myres2.do", method = RequestMethod.GET)
	public String mypage_user_myres2(Model model, HttpServletRequest request,resVo resvo,menuVo menuvo){
		
			
		mysvs.getupdateres(resvo);		
		String res_uid=request.getParameter("res_uid");
		resvo=mysvs.getselectRes_code(res_uid);				
		model.addAttribute("vo",resvo);
		
		mysvs.getupdatemenu(menuvo);
		String code=request.getParameter("res_code");
		int res_code=Integer.valueOf(code);		
		ArrayList<menuVo> list=mysvs.getselectmenu(res_code);
		model.addAttribute("list",list);
		
		return "/mypage/mypage_user_myres";
		

	}
	
	@RequestMapping(value = "/user_menu_update.do", method = RequestMethod.GET)
	public String user_menu_update(Model model, HttpServletRequest request,resVo resvo,menuVo menuvo){		
		
		mysvs.getupdatemenu(menuvo);
		String code=request.getParameter("res_code");
		int res_code=Integer.valueOf(code);		
		ArrayList<menuVo> list=mysvs.getselectmenu(res_code);
		model.addAttribute("list",list);
		
		String res_uid=request.getParameter("res_uid");		
		resVo vo1=mysvs.getselectRes_code(res_uid);
		
		model.addAttribute("vo",vo1);
		return "/mypage/mypage_user_myres";
		
	}
	
	@RequestMapping(value = "/mypage_user_myres_path.do", method = RequestMethod.GET)
	public String mypage_user_myres_path(Model model, HttpServletRequest request,resVo resvo){
		//�쓬�떇�젏�삁�빟�뿉�꽌 �굹�쓽 �쓬�떇�젏�쑝濡� 媛��뒗 寃쎌쑀吏�
		
		String res_code1=request.getParameter("res_code");
		int res_code=Integer.valueOf(res_code1);			
		ArrayList<menuVo> list=mysvs.getselectmenu(res_code);
		model.addAttribute("list",list);
		
		resvo=mysvs.getAllRescode(res_code);
		model.addAttribute("vo",resvo);
		

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
	public String mypage_user_check(Model model,resVo resvo,MembersVo memvo,HttpServletRequest request ){
		
		String uid="song_ga";
		int insert=mysvs.getinsertres(resvo,uid);
		
		
		//String check=mysvs.getcheckmembers(uid);
		
		//check="1";
		//MembersVo list= mysvs.getdetailmembers(uid);
		//list.setEnroll(check);
		
		return "redirect:mypage_user_info.do";
		
	
	}
	
	@RequestMapping(value = "/reservation_shop_detail.do", method = RequestMethod.GET)
	public String reservation_shop_detail(Model model,bookVo bookvo,resVo resvo,HttpServletRequest request ){
		
		String bo_code1=request.getParameter("bo_code");
		int bo_code=Integer.valueOf(bo_code1);
		
		
		
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
			String bo_conf=bookvo.getBo_conf();
			
			
			mysvs.getupdateconf(bookvo);
			bookvo=mysvs.getdetailbook(bo_code);
			String email2=request.getParameter("email2");			
			String email=bookvo.getBo_email();
			email=email.substring(0,email.indexOf("@"));
			bookvo.setBo_email(email);
			
			model.addAttribute("detail",bookvo);
			model.addAttribute("email2",email2);
			
		
		return "/mypage/reservation_shop_detail";
		
	
		
	}
	

	@RequestMapping(value = "/deleteUser.do", method = RequestMethod.GET)
	public String deleteUser(Model model,bookVo bookvo,resVo resvo,HttpServletRequest request ){
		String uid=request.getParameter("uid");
		mysvs.getdeleteUser(uid);
		
		return "redirect:logout.do";
		
		
	}
	
		
	
			
	
}

