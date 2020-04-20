package jsp.action.movie;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import movie.controller.Action;
import movie.model.MemberDao;
import movie.vo.MemberVo;

public class LoginAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		MemberDao memdao = MemberDao.getInstance();
		MemberVo memvo = memdao.memberDetail(id);
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();

		if (memvo != null) {
			if (memvo.getPwd().equals(pwd)) {
				session.setAttribute("loginUser", memvo);
				session.setAttribute("dname", memvo.getDname());
				out.println("<script>loaction.href='main.do';</script>");
				//response.sendRedirect("main.do");
				return "login.jsp";
				
			} else {
				out.println("<script>alert('로그인'); history.go(-1);</script>");
				return null;
			}
		} else {
			out.println("<script>alert('로그인 실패'); history.go(-1);</script>");
			return null;
		}
//		if(resultNewEmp == 0){
//			return "dberror";
//		}else{
//			return "redirect:emplist.do";
//		}
//		return null;
	}

}
