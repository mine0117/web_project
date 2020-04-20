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
      <!-- 리뷰리스트 -->
      <article id="reviewlist">
        <div class="old_layout old_community">
          <h4 class="tlt"><img src="images/tlt_review_movie.gif" alt="영화 리뷰" width="65" height="15"></h4>
          <h5 class="sub_tlt"><img src="${blist.mname }" alt="전체 리스트" width="59" height="13">
            <div class="h5_right_txt">총 <strong class="c_88 fs_11">${rtotal }</strong>개의 리뷰가 있습니다</div>
          </h5>

          <table cellspacing="0" summary="게시물 목록" class="list_table_1 list_h48">
              <colgroup><col width="83"><col width="*"><col width="73"><col width="72"></colgroup>
            <thead>
              <tr>
                <th scope="col">영화</th>
                <th scope="col">제목</th>
                <th scope="col" class="al">글쓴이·날짜</th>
                <th scope="col" class="al" style="padding-left:20px;">별점</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach var="blist" items="${blist }">
              <tr>
                <td class="movie"><a href="moviedetail.do?mid=${blist.mid }">${blist.mname }</a></td>
                <td class="title"><a href="reviewdetail.do?num=${blist.num }">${blist.title }</a></td>
                <td class="author num"><a href="">${blist.id }</a><br><fmt:formatDate value="${blist.reg_date }" pattern="YY-MM-dd" /></td>
                <td>
                  <div class="point_type_1 fl">
                    <div class="mask" style="width:${blist.score*10}%"><img src="images/point_type_1_bg_on.gif" width="59" height="11" alt="${blist.score }점">
                    </div>
                  </div>
                </td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
          
          
			<div class="pagewrap">
				<c:if test="${rtotal !=0 }">
					<jsp:include page="common/paging.jsp"></jsp:include>
				</c:if>
			</div>


          <fieldset class="form_board_search pt_18">
            <form name="searchListForm" method="get">
              <select size="1" name="keyWord" class="select_type_1">
                <option value="b.title">제목</option>
                <option value="b.id">글쓴이</option>
                <option value="m.mname">영화</option>
              </select>
              <input type="hidden" name="mcode" value="">
              
              <input name="keyValue" type="text" style="width:145px; ime-mode:active;" title="검색어입력" class="input_type_text_4">
              <button type="submit">검색</button>
            </form>
          </fieldset>
        </div>


      </article>
    </div>
</section>
<footer>
<jsp:include page="/common/footer.jsp"></jsp:include>
</footer>
</body>
</html>