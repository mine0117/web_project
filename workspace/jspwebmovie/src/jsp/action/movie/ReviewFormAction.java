package jsp.action.movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.controller.Action;
import movie.model.MovieDao;
import movie.vo.MovieVo;

public class ReviewFormAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		//리스트 목록 가져오기
		MovieDao m = MovieDao.getInstance();
		MovieVo vo = m.reviewform(request.getParameter("mid"));
		
		//리스트정보를 저장하기
		request.setAttribute("vo", vo);
		System.out.println(vo);
		
		return "/reviewform.jsp";
	}

}
