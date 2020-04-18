<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="common/common.css">
<link rel="stylesheet" href="css/css_mypage/mypage_manager.css">
<jsp:include page="../../../resources/common/nav/nav.jsp"></jsp:include>
<title>나의페이지_관리자_예약관리</title>
<script>

	function addPenalty(bo_uid){
		var ok=confirm(bo_uid+"에 패널티를 추가하시겠습니까?");
		if(ok==true){
			alert("패널티 추가 후 '처리완료' 되었습니다.")
			location.href="addPenalty.do?bo_uid="+bo_uid;
		}else{
			alert("취소합니다.");
		}
	}
	
	$(function(){
		$('div ul li a').removeClass('active_tab');
		$('div ul li:nth-child(1) a').addClass('active_tab');
	})
	
</script>
</head>
<body>
	<div class="center">
	  <section>
	   <jsp:include page="../../../resources/common/nav/nav_manager.jsp"></jsp:include>
	     <div class="tab_content">
	        <div class="ask_list">
	          <p class="first">미방문 고발  목록</p>
	          <table class="reserv_list">
	            <colgroup>
	              <col style="width:25%;">
	              <col style="width:25%;">
	              <col style="width:25%;">
	              <col style="width:25%;">
	            </colgroup>
	            <tr>
	              <th>업체코드</th>
	              <th>방문자</th>
	              <th>패널티부여</th>
	              <th>처리결과</th>
	            </tr>
	            <c:forEach var="list" items="${list }" varStatus="num">
	            <tr>
	              <td>${list.res_code }</td>
	              <td>${list.bo_uid }</td>
	              <td><button class="bt_pa" type="button" onclick="addPenalty('${list.bo_uid }')">추가</button></td>
	             
	              <td>${list.bo_conf }</td>
	            </tr>
	            </c:forEach>
	          </table>
	        </div> <!-- //asklist  -->
	      </div><!--//tab_content-->
	    </section>
	 </div><!--//center-->
</body>
<jsp:include page="../../../resources/common/footer/footer.jsp"></jsp:include>
</html>