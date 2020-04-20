package jsp.action.movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.controller.Action;
import movie.model.BoardDao;
import movie.vo.BoardVo;

public class ReviewDeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		String num = request.getParameter("num");
		
		BoardVo bvo = new BoardVo();
		bvo.setNum(Integer.valueOf(request.getParameter("num")));
		
		BoardDao bdao = BoardDao.getInstance();
	
		int result = bdao.deleteReview(Integer.valueOf(num));
		if(result==1){
			return "reviewlist.do";
		}else{
			return "/rivewdetail.do?num="+num;
		}
	}

}
