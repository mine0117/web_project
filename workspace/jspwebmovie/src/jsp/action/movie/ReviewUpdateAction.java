package jsp.action.movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.controller.Action;
import movie.model.BoardDao;
import movie.vo.BoardVo;

public class ReviewUpdateAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		
		String num = request.getParameter("num");
		
		BoardVo bvo = new BoardVo();
		bvo.setNum(Integer.valueOf(request.getParameter("num")));
		bvo.setTitle(request.getParameter("title"));
		bvo.setScore(Integer.valueOf(request.getParameter("score")));
		bvo.setContent(request.getParameter("content"));
		
		BoardDao bdao = BoardDao.getInstance();
		bdao.updateReview(bvo);
		
		int result = bdao.updateReview(bvo);
		if(result==1){
			return "reviewlist.do";
		}else{
			return "/revieweditform.do?num="+num;
		}
	}

}
