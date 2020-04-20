<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      <!-- 리뷰작성폼 -->
      <article id="reviewform">
        <div class="obj_section noline center_obj">
        			<div class="review">
        				<div class="title_area">
        					<h4 class="h_review_wrt"><strong class="blind">리뷰쓰기</strong></h4>
        					<a href="movielist.do" class="review_list"><em>목록보기</em></a><!-- N=a:rwr.list -->
        				</div>
        				<fieldset class="ipt_table" id="reviewFieldset">
        				<form id="rv" action="/reviewinsert.do" method="post">
        					<legend><span class="blind">리뷰입력 폼</span></legend>
        					<table summary="리뷰쓰기 테이블" class="wrt_board">
        					  <tbody>
            					<tr>
              					<th scope="row" class="frst_tr"><span class="subject1">영화</span></th>
              					<td class="frst_tr"><strong class="title">${vo.mname }</strong></td>
            					</tr>
            					<tr>
              					<th scope="row"><span class="subject2">
              					<label for="inputTitle" class="subject2">제목</label></span></th>
              					<td>
	               					 <input type="hidden" name="id" value="${loginUser.id }">
              						 <input type="hidden" name="mid" value="${vo.mid }">
                         			 <input type="text" class="form-control tx_field" placeholder="제목을 입력하세요" name="title" id="inputTitle">
                        		</td>
                      			</tr>
            					<tr>
              					<th scope="row" class="tr_star"><span class="subject3">별점</span></th>
                        <td class="tr_star">
                          <select name="score" class="form-control input_star" style="width:200px">
                            <option value="1">1 | ☆</option>
                            <option value="2">2 | ★</option>
                            <option value="3">3 | ★☆</option>
                            <option value="4">4 | ★★</option>
                            <option value="5">5 | ★★☆</option>
                            <option value="6">6 | ★★★</option>
                            <option value="7">7 | ★★★☆</option>
                            <option value="8">8 | ★★★★</option>
                            <option value="9">9 | ★★★★☆</option>
                            <option value="10">10 | ★★★★★</option>
                          </select>
        					      </td>
        					    </tr>
                      <tr>
                        <th scope="row" class="tr_star"><span class="subject5">내용</span></th>
                        <td class="tr_star">
                          <div class="editor_area">
                            <textarea name="content" class="form-control" rows="20" placeholder="리뷰를 입력하세요"></textarea>
                          </div>
                        </td>
                      </tr>
                    </tbody>
                  </table>

                  <div class="wrt_board_submit">
        						<a href="#" onclick="checkform();" title="확인" class="btn_confrm"><em class="blind">확인</em></a>
                    <a href="#" title="취소" class="btn_cncl"><em class="blind">취소</em></a><!-- N=a:rwr.cancel -->
                  </div>
                  
                  <script>
                  	function checkform(){
                  		var title = document.getElementById("inputTitle").value;

                  				if (title.length == 0){ 
                  					alert("제목을 입력하세요");	
                  	      		}else{
                  					document.getElementById('rv').submit();
                  				}
	
					}
                  </script>
                  		</form>
        				</fieldset>

        			</div>
        		</div>

      </article>
    </div>
</section>
<footer>
<jsp:include page="/common/footer.jsp"></jsp:include>
</footer>
</body>
</html>