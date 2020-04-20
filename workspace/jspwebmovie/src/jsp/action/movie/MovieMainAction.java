package jsp.action.movie;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.controller.Action;
import movie.model.BoardDao;
import movie.model.MovieDao;
import movie.vo.BoardVo;
import movie.vo.MovieVo;

public class MovieMainAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		//영화리스트 목록 가져오기
		MovieDao m = MovieDao.getInstance();
		ArrayList<MovieVo> mlist = m.selectmovie();
		//영화리스트정보를 저장하기
		request.setAttribute("mlist", mlist);
		
		//리뷰리스트 목록 가져오기
		BoardDao bdao = BoardDao.getInstance();
		ArrayList<BoardVo> rlist = bdao.selectreview();
		//립리스트 정보 저장하기
		request.setAttribute("rlist",rlist);


		return "/main.jsp";
	}

}
