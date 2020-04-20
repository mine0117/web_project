package movie.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.action.movie.CommentWriteAction;
import jsp.action.movie.DeleteAction;
import jsp.action.movie.DetailAction;
import jsp.action.movie.JoinAction;
import jsp.action.movie.LoginAction;
import jsp.action.movie.LogoutAction;
import jsp.action.movie.MovieDetailAction;
import jsp.action.movie.MovieListAction;
import jsp.action.movie.MovieMainAction;
import jsp.action.movie.MovieSearchAction;
import jsp.action.movie.MyreviewAction;
import jsp.action.movie.ReviewDeleteAction;
import jsp.action.movie.ReviewDetailAction;
import jsp.action.movie.ReviewEditFormAction;
import jsp.action.movie.ReviewFormAction;
import jsp.action.movie.ReviewInsertAction;
import jsp.action.movie.ReviewListAction;
import jsp.action.movie.ReviewUpdateAction;
import jsp.action.movie.UpdateAction;

public class HomeController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	/* GET 諛⑹떇�씪 寃쎌슦 doGet() */
    public void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
            doProcess(request,response);
    }      
        
    /* POST 諛⑹떇�씪 寃쎌슦 doPost() */
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
            doProcess(request,response);
    }    
    
    public void doProcess(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	
		String requestURI = request.getRequestURI();
		int cmdIdx = requestURI.lastIndexOf("/")+1;
		String command = requestURI.substring(cmdIdx);
		// URI, command �솗�씤
		//System.out.println("requestURI : "+requestURI);
		//System.out.println("command : "+command);
		
        Action action = null;
        String view = null;
        
       try {
    	   
    	   
           // �솕硫댁쟾�솚
           if(command.equals("index.do")){view = "index.jsp";}
           // 硫붿씤�솕硫� �씠�룞
           //if(command.equals("main.do")){view = "main.jsp";}
           if(command.equals("main.do")){action = new MovieMainAction(); view= action.execute(request, response);}
           //�떎�뒿�뀒�뒪�듃�럹�씠吏�
           if(command.equals("hello.do")){view = "hello.jsp";}
        	//�쁺�솕紐⑸줉�뤌
           if(command.equals("movielist.do")){action = new MovieListAction();view = action.execute(request, response);}
           //�쁺�솕�긽�꽭�뤌
           if(command.equals("moviedetail.do")){action = new MovieDetailAction();view = action.execute(request, response);}
           //�쁺�솕寃��깋寃곌낵
           if(command.equals("searchresult.do")){action = new MovieSearchAction();view = action.execute(request, response);}
           //由щ럭紐⑸줉
           if(command.equals("reviewlist.do")){action = new ReviewListAction();view = action.execute(request, response);}
           //由щ럭�긽�꽭
           if(command.equals("reviewdetail.do"))
           {action = new ReviewDetailAction();view = action.execute(request, response);}
           	//由щ럭�벑濡앺뤌
           if(command.equals("reviewform.do"))
           {action = new ReviewFormAction();view = action.execute(request, response);}
           //由щ럭�벑濡�
           if(command.equals("reviewinsert.do"))
           {action = new ReviewInsertAction();view = action.execute(request, response);}
           //由щ럭�닔�젙�뤌
           if(command.equals("revieweditform.do")){action = new ReviewEditFormAction(); view = action.execute(request, response);}
           //由щ럭�닔�젙
           if(command.equals("reviewupdate.do")){action = new ReviewUpdateAction(); view = action.execute(request, response);}
           //由щ럭�궘�젣
           if(command.equals("reviewdelete.do")){action = new ReviewDeleteAction(); view = action.execute(request, response);}
       		
           //댓글 등록
           if(command.equals("commentwrite.do")){action = new CommentWriteAction(); view = action.execute(request, response);}
           
           
           //�굹留뚯쓽由щ럭蹂닿린
           if(command.equals("Myreviewlist.do")){action = new MyreviewAction(); view = action.execute(request, response);}
           
           //�쉶�썝媛��엯�뤌
           if(command.equals("joinform.do"))
           {view ="joinform.jsp";}
           //�쉶�썝媛��엯�벑濡�
           if(command.equals("join.do")){action = new JoinAction();view = action.execute(request, response);}
           //�궡�젙蹂댁닔�젙�뤌
           if(command.equals("modifyform.do")){action = new DetailAction();view = action.execute(request, response);}
           //�궡�젙蹂댁닔�젙�벑濡�
           if(command.equals("modify.do")){action = new UpdateAction();view = action.execute(request, response);}
           //�깉�눜
           if(command.equals("delete.do")){action = new DeleteAction(); view = action.execute(request, response);}
           //濡쒓렇�씤�뤌
           if(command.equals("loginform.do")){view="loginform.jsp";}
           //濡쒓렇�씤
           if(command.equals("login.do"))
           {action = new LoginAction();
           	view = action.execute(request, response);}
           //濡쒓렇�븘�썐
           if(command.equals("logout.do"))
           {action = new LogoutAction(); view = action.execute(request, response);}
           
       } catch (Throwable e) {
           e.printStackTrace();
       }
       
       RequestDispatcher dispatcher = request.getRequestDispatcher(view);
       dispatcher.forward(request, response);
   } 	// end doProcess


}
