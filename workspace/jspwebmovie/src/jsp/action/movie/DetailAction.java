package jsp.action.movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.controller.Action;
import movie.model.MemberDao;
import movie.vo.MemberVo;

public class DetailAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		
		MemberDao memdao = MemberDao.getInstance();
		MemberVo memvo = memdao.memberDetail(request.getParameter("id"));
		
		request.setAttribute("memvo", memvo);
		
		return "/modifyform.jsp";
	}

}
