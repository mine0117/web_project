package jsp.action.movie;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.controller.Action;
import movie.model.BoardDao;
import movie.model.MovieDao;
import movie.vo.BoardVo;
import movie.vo.MovieVo;
import movie.vo.PagingVo;

public class MovieDetailAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		//영화리스트 목록 가져오기
		MovieDao m = MovieDao.getInstance();
		MovieVo vo = m.moviedetail(request.getParameter("mid"));
		String mname = vo.getMname();
		System.out.println("mname="+mname);
		
		//리스트정보를 저장하기
		request.setAttribute("vo", vo);

		//리뷰리스트 목록 가져오기
		BoardDao bdao = BoardDao.getInstance();
		PagingVo pagingVO = new PagingVo();
		
		
		String keyWord="m.mname";
		String keyValue= mname;
		System.out.println("keyValue="+keyValue);
		
		if(keyValue==null || keyValue.equals("")){
			keyValue="";
		}
		
		pagingVO.setKeyWord(keyWord);
		pagingVO.setKeyValue(keyValue);
		
		int rtotal = bdao.reviewCount(pagingVO);
		
		String pageNum_temp=request.getParameter("pageNum");
		
		pagingVO.setTotal(rtotal);
		pagingVO.setPageNum_temp(pageNum_temp);
		pagingVO=bdao.setPagingInfo(pagingVO);
		
		
		List<BoardVo> blist=bdao.boardSelect(pagingVO);
		
		StringBuffer search = new StringBuffer(request.getContextPath());
		search.append("/reviewlist.do?keyWord="+keyWord);
		search.append("&keyValue="+keyValue);
		search.append("&pageNum=");
		
		request.setAttribute("blist", blist);
		request.setAttribute("rtotal", rtotal);
		request.setAttribute("search", search);
		request.setAttribute("pageNum", pagingVO.getPageNum());
		request.setAttribute("pageBlock", pagingVO.getPageBlock());
		request.setAttribute("pageCount", pagingVO.getPageCount());
		request.setAttribute("endPage", pagingVO.getEndPage());
		request.setAttribute("startPage", pagingVO.getStartPage());
		request.setAttribute("rowNum", pagingVO.getRowNum());


		
		return "/moviedetail.jsp";
	}

}
