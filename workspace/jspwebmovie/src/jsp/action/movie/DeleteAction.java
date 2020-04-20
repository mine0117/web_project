package jsp.action.movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.controller.Action;
import movie.model.MemberDao;
import movie.vo.MemberVo;

public class DeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		
		MemberVo memvo = new MemberVo();
		memvo.setId(request.getParameter("id"));
		
		MemberDao memdao = MemberDao.getInstance();
		
		int result = memdao.deleteMem(id);
		if(result==1){
			return "main.do";
		}else{
			return "/modifyform.do?id="+id;
		}

	}

}
