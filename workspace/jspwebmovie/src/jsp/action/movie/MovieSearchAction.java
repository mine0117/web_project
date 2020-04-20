package jsp.action.movie;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.controller.Action;
import movie.model.MovieDao;
import movie.vo.MovieSearchVo;
import movie.vo.MovieVo;
import movie.vo.PagingVo;

public class MovieSearchAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		//리스트 목록 가져오기
		MovieDao m = MovieDao.getInstance();
		//검색된리스트
		PagingVo pagingVO = new PagingVo();
		
		String keyValue = request.getParameter("query");
		String orderValue = request.getParameter("orderValue");
		//검색을 하기 위한 값이 null일 경우
		if(keyValue==null || keyValue.equals("")){
			keyValue="";
		}
		if(orderValue==null || orderValue.equals("")){
			orderValue="rday";
		}
		
		//검색값저장하기
		pagingVO.setKeyValue(keyValue);
		
		//게시물 총 건 수 
		int total = m.movieCount(pagingVO);
		pagingVO.setTotal(total);
		
		//검색처리한  리스트 조회
		List<MovieVo> list = m.movieSearch(pagingVO);
		
		//리스트 정보 저장하기
		request.setAttribute("keyvalue", keyValue);
		request.setAttribute("orderValue", orderValue);
		request.setAttribute("list", list);
		request.setAttribute("total", total);

		return "searchresult.jsp";
	}

}
