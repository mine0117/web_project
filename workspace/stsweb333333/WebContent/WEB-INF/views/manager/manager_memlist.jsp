<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="../../common/common.css">
<link rel="stylesheet" href="../../css/css_mypage/mypage_manager.css">
<jsp:include page="../../../resources/common/nav/nav.jsp"></jsp:include>  
  <title>관리자_회원목록</title>
  <script>
  $(function(){
		$('div ul li a').removeClass('active_tab');
		$('div ul li:nth-child(2) a').addClass('active_tab');
  })
  </script>
</head>

<body>
    <section>
    <!-- 탭메뉴 -->
    <jsp:include page="../../../resources/common/nav/nav_manager.jsp"></jsp:include>
      <div class="ask_list">
        <div class="tab_content">
        <p class="first">회원 목록</p>
        <table class="reserv_list">
    	  <colgroup>
          <col style="width:20%;">
          <col style="width:20%;">
          <col style="width:25%;">
          <col style="width:25%;">
          <col style="width:10%;">
          </colgroup>
           <tr>
            <th>아이디</th>
            <th>이름</th>
            <th>패널티</th>
            <th>맛집보유</th>
            <th>상세</th>
           </tr>
           <c:forEach var="list" items="${list }" varStatus="num">
               <tr>
	            <td>${list.uid }</td>
	            <td>${list.name }</td>
	            <td>${list.penalty }</td>
	            <td>${list.enroll }</td>
	            <td><a href="manager_mem_detail.do?uid=${list.uid }">보기</a></td>
	           </tr>
           </c:forEach>
          </table>
        </div> <!-- //tab_content  -->
      </div> <!-- //ask_list  -->
    </section>
</body>
</html>
