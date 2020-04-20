package jsp.action.movie;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.controller.Action;
import movie.model.CommentDAO;
import movie.vo.CommentVo;



public class CommentWriteAction implements Action
{
	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		CommentDAO dao = CommentDAO.getInstance();
		
		
		// 파리미터 값을 가져온다.
		int comment_board = Integer.parseInt(request.getParameter("comment_board")); //게시글 번호
		String comment_id = request.getParameter("comment_id"); //댓글 작성자
		String comment_content = request.getParameter("comment_content");	//댓글 내용
		
		
		CommentVo comment = new CommentVo();
		comment.setComment_num(dao.getSeq());	// 댓글 번호는 시퀀스값으로
		comment.setComment_board(comment_board);
		comment.setComment_id(comment_id);
		comment.setComment_content(comment_content);
		
		boolean result = dao.insertComment(comment);

		if(result){
			
			PrintWriter out = response.getWriter();
			System.out.println("결과"+result);
			
			out.close();
		}else
			dao.insertComment(comment);
			
		return "reviewdetail.do";
	}
}
