package jsp.action.movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.controller.Action;
import movie.model.BoardDao;
import movie.vo.BoardVo;

public class ReviewDetailAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		
		//리스트 목록 가져오기
		BoardDao b = BoardDao.getInstance();
		//String Num = request.getParameter("num");
		BoardVo bvo = b.reviewdetail(Integer.parseInt(request.getParameter("num")));
		System.out.print(Integer.parseInt(request.getParameter("num")));
		//리스트정보저장하기
		request.setAttribute("bvo", bvo);
		
		return "/reviewdetail.jsp";
	}

}
