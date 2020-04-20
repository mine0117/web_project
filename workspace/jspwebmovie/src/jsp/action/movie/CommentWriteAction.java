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
		
		
		// �ĸ����� ���� �����´�.
		int comment_board = Integer.parseInt(request.getParameter("comment_board")); //�Խñ� ��ȣ
		String comment_id = request.getParameter("comment_id"); //��� �ۼ���
		String comment_content = request.getParameter("comment_content");	//��� ����
		
		
		CommentVo comment = new CommentVo();
		comment.setComment_num(dao.getSeq());	// ��� ��ȣ�� ������������
		comment.setComment_board(comment_board);
		comment.setComment_id(comment_id);
		comment.setComment_content(comment_content);
		
		boolean result = dao.insertComment(comment);

		if(result){
			
			PrintWriter out = response.getWriter();
			System.out.println("���"+result);
			
			out.close();
		}else
			dao.insertComment(comment);
			
		return "reviewdetail.do";
	}
}
