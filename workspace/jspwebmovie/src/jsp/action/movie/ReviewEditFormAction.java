package jsp.action.movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.controller.Action;
import movie.model.BoardDao;
import movie.vo.BoardVo;

public class ReviewEditFormAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		
		//리스트 목록 가져오기
		BoardDao bdao = BoardDao.getInstance();
		BoardVo bvo = bdao.reviewdetail(Integer.valueOf(request.getParameter("num")));

		request.setAttribute("bvo", bvo);

		return "/revieweditform.jsp";
	}

}
