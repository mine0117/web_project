package jsp.action.movie;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.controller.Action;
import movie.model.MovieDao;
import movie.vo.MovieSearchVo;
import movie.vo.MovieVo;
import movie.vo.PagingVo;

public class MovieListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		//리스트 목록 가져오기
		MovieDao m = MovieDao.getInstance();
		PagingVo pagingVO = new PagingVo();
		
		String orderValue = request.getParameter("orderValue");
		
		if(orderValue==null || orderValue.equals("")){
			orderValue="rday";
		}
		//System.out.println("movielistaction "+orderValue);
				
		//검색값 저장
		pagingVO.setOrderValue(orderValue);
		
		//게시물 총 건 수 
		int total = m.movieCount(pagingVO);
		pagingVO.setTotal(total);
		
		//검색처리한  리스트 조회
		ArrayList<MovieVo> mlist = m.movieSelect(pagingVO);
		
		//리스트정보를 저장하기
		request.setAttribute("mlist",mlist);
		request.setAttribute("total", total);
		//request.setAttribute("orderValue", orderValue);
		
		
		//int total = mlist.size();
		//리스트정보를 저장하기
		//request.setAttribute("total", total);
		//request.setAttribute("mlist", mlist);


		return "/movielist.jsp";
	}
	
}
