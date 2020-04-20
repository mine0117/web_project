package jsp.action.movie;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.controller.Action;
import movie.model.BoardDao;
import movie.vo.BoardVo;

public class ReviewInsertAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id");
		String mid = request.getParameter("mid");
		
		BoardVo bvo = new BoardVo();
		bvo.setTitle(request.getParameter("title"));
		bvo.setScore(Integer.valueOf(request.getParameter("score")));
		bvo.setContent(request.getParameter("content"));
		bvo.setId(request.getParameter("id"));
		bvo.setMid(request.getParameter("mid"));
		
		PrintWriter out = response.getWriter();
		
		BoardDao bdao = BoardDao.getInstance();

		//이미등록된 리뷰가 있는지 검색합니다.
		int result = bdao.checkReview(bvo);
		if(result!=0){
			out.println("<script>alert('이미 등록된 리뷰가 있습니다'); history.go(-1);</script>");
			return null;
		}else{
			bdao.insertReview(bvo);
			return "/reviewlist.do";
		}
	}

}
