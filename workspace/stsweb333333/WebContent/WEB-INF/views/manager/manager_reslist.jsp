<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="common/common.css">
<link rel="stylesheet" href="css/css_mypage/mypage_manager.css">
<jsp:include page="../../../resources/common/nav/nav.jsp"></jsp:include>
 <title>관리자_맛집목록</title>
 <script>
$(function(){
	$('div ul li a').removeClass('active_tab');
	$('div ul li:nth-child(4) a').addClass('active_tab');
})
</script>
</head>
<body>
  <section>
    <!-- 탭메뉴 -->
   	<jsp:include page="../../../resources/common/nav/nav_manager.jsp"></jsp:include>
      <div class="tab_content">
        <div class="ask_list">
          <p class="first">맛집 목록</p>
          <table class="reserv_list">
            <colgroup>
              <col style="width:15%;">
              <col style="width:15%;">
              <col style="width:25%;">
              <col style="width:15%;">
              <col style="width:10%;">
              <col style="width:10%;">

            </colgroup>
            <tr>
              <th>업체코드</th>
              <th>업주</th>
              <th>업체명</th>
              <th>업종</th>
              <th>상태</th>
              <th>상세</th>
            </tr>
            <c:forEach var="list" items="${list }" varStatus="num">
            <tr>
              <td>${list.res_code }</td>
              <td>${list.res_uid }</td>
              <td>${list.res_name }</td>
              <td>${list.line }</td>
              <td>${list.permission }</td>
              <td><a href="manager_res_detail.do?res_code=${list.res_code }">보기</a></td>
            </tr>
            </c:forEach>
          </table>
       </div> <!-- //ask_list  -->
    </div>
  </section>
</body>
<jsp:include page="../../../resources/common/footer/footer.jsp"></jsp:include>
</html>
