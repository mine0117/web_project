<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import = "java.sql.*" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>영화</title>
<jsp:include page="/common/head.jsp"></jsp:include>
</head>
<body>
<header>
<jsp:include page="/common/nav.jsp"></jsp:include>
</header>
<section>
    <div class="content-wrap">
      <article id="reviewdetail">
        <div class="old_layout old_community">
          <!-- Content Body -->
          <div id="cbody" class="type_1">
            <div id="old_content">
              <!-- view -->
              <div class="read_type_1">
                <h4 class="title_line">
                  ${bvo.title }
                  <div class="pt_3"></div>
                  <div class="fl point_type_1"><div class="mask" style="width:${bvo.score *10}%"><img src="https://ssl.pstatic.net/imgmovie/2007/img/common/point_type_1_bg_on.gif" width="59" height="11" alt="${bvo.score }점"></div></div><span class="txt_star"></span>
                </h4>
                <form id="reportForm" name="reportForm1"></form>
                <div class="autor_time">
                  <span class="log">${bvo.id }님
                    <a href="list.nhn?st=nickname&amp;sword=4621554">모든리뷰보기</a>
                  </span>
                  <span id="readcnt2" style="display:none;"></span>
                  <span class="time"><span class="date"><fmt:formatDate value="${bvo.reg_date}" pattern="YY-MM-dd" /></span>&nbsp;&nbsp;<fmt:formatDate value="${bvo.reg_date}" pattern="HH:mm" /></span>
                </div>
                <div class="text_area">
			        ${bvo.content }
                </div>
              </div>
              <!-- //view -->

              <div class="btn_group pt_8 pb_35">
                <button type="button" class="btn btn-info" onclick="location.href='reviewlist.do'">목록</button>

                <c:if test="${loginUser.id eq bvo.id }">
                <button type="submit" class="btn btn-info" onclick="location.href='revieweditform.do?num=${bvo.num }'">수정</button>
                <button type="button" class="btn btn-info" id="btn_del">삭제</button>
                </c:if>
              </div>
         
         
         <!-- 댓글  시작 -->     
              
                <div class="u_cbox_write_wrap">
    <div class="u_cbox_write_box u_cbox_type_logged_out">
      
      
      
      <form id="rv" action="/commentwrite.do" method="post">
        <fieldset>
          <legend class="u_vc">댓글 쓰기</legend>
          <div class="u_cbox_write">
            <div class="u_cbox_write_inner">
              <div class="u_cbox_write_area">

                <div class="u_cbox_inbox">
                ${comment.comment_content }
                  <textarea id="cbox_module__write_textarea" class="u_cbox_text" rows="3" cols="30"></textarea>
                </div>
              </div>
             
               
                 <div id="btn">
                   <p><a href="#" onclick="writeCmt()">댓글등록</a></p>    
                    </div>



                  <div class="u_cbox_head">
                  <button type="reset" class="u_cbox_btn_refresh" data-action="count#refresh" data-log="RPO.refresh">
                    <span class="u_cbox_ico_refresh"></span>
                    <span class="u_cbox_txt_refresh">새로고침</span>
                  </button>
              </div>
            </div>
          </div>
    
              
             <!--댓글 끝 --> 
            
            
            
            
            
              
              <script>
				var btn_del = document.getElementById("btn_del");
				btn_del.onclick = function(){
					if(confirm('삭제하시겠습니까?')){
						//확인 버튼을 눌렀을 때 진짜 삭제처리를 위해 delete.jsp로 이동
						location.href='reviewdelete.do?num=${bvo.num }';
					}else{
						//취소 버튼을 눌렀을 때 알림창만 닫기
						return false;
					}
				}
				
				
				/* 댓글 함수 */
				
				 var form = document.getElementById("btn");
				 btn.onclick = function writeCmt()
        {
          
            
          
            if(form.length == 0)
            {
                alert("내용을 입력하세요.");
               
            }
            else  {    
            	document.getElementById('rv').submit();
            }
        }
        



				
				
				
				
				
			</script>
              
              
              
            </fieldset>
      </form>
    </div>
  </div>
              
                    
			</div>
		</div>
		<!-- end Content Body -->
		</div>
      </article>
    </div>
</section>
<footer>
<jsp:include page="/common/footer.jsp"></jsp:include>
</footer>
</body>
</html>