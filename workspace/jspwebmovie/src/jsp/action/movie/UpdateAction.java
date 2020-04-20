package jsp.action.movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import movie.controller.Action;
import movie.model.MemberDao;
import movie.vo.MemberVo;

public class UpdateAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		
		MemberVo memvo = new MemberVo();
		memvo.setId(request.getParameter("id"));
		memvo.setPwd(request.getParameter("pwd"));
		memvo.setDname(request.getParameter("dname"));
		memvo.setEmail(request.getParameter("email"));
		
		MemberDao mdao = MemberDao.getInstance();
		mdao.updateMem(memvo);
		
		int result = mdao.updateMem(memvo);
		if(result==1){
			//등록성공시
			HttpSession session = request.getSession();
			session.setAttribute("dname", memvo.getDname());
					
			return "main.do";
		}else{
			//등록실패시
			return "/modifyform.do?id="+id;
		}
		
	}

}
