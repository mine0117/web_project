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

  	function goPage(pages) {
		  var name = "${name}";
		  if(name.length==0){
			location.href = "manager_reslist.do?pages=" + pages;
		  }else{
			location.href = "mana_search.do?pages=" + pages+"&name=${name}&id=";
		  }    
	}
 
    function backPages(){
      var name = "${name}";
   	  if(name.length==0){
   		location.href ="manager_reslist.do?pages=" + 1
   	  }else{
   		location.href = "mana_search.do?pages=" + 1+"&name=${name}&id=";
   	  }
    }    
</script>
<style>
    input.search{
     border-style:none;border : 1px solid #cdcdcd;
     height: 28px;width:200px;
     position: relative;top:1px;
     margin-bottom: 10px;
    }
    .select{
      height: 30px;
      padding-bottom: 5px;
    }
    .form{
      margin-right:-74px;
      float: right;
    }
    .search_b{
      padding: 6px;
      position: relative;top:3px;
      border-style: none;
    }
</style>
</head>
<body>
  <section>
    <!-- 탭메뉴 -->
   	<jsp:include page="../../../resources/common/nav/nav_manager.jsp"></jsp:include>
      <div class="tab_content">
        <div class="ask_list">
          <p class="first">맛집 목록</p>
          
          <form action="mana_search.do" method="get">
	         <div class="form">
	           <select class="select">
	             <option value="res_name">업체명</option>
	           </select>
	           <input class="search" type="hidden" name="id" >
	           <input class="search" type="text" name="name" value="${name }">
	           <button class="search_b" type="submit">검색</button>
	         </div>
	      </form>
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
     <!-- 페이징  -->
     <jsp:include page="../../../resources/common/paging/paging.jsp"></jsp:include>
       </div> <!-- //ask_list  -->
    </div>
  </section>
</body>
<jsp:include page="../../../resources/common/footer/footer.jsp"></jsp:include>
</html>
