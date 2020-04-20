package jsp.action.movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.controller.Action;
import movie.model.MemberDao;
import movie.vo.MemberVo;

public class JoinAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		MemberVo memvo = new MemberVo();
		memvo.setId(request.getParameter("id"));
		memvo.setPwd(request.getParameter("pwd"));
		memvo.setDname(request.getParameter("dname"));
		memvo.setEmail(request.getParameter("email"));
		
		MemberDao mdao = MemberDao.getInstance();
		mdao.insertMem(memvo);
				
		return "/join.jsp";
	}

}
