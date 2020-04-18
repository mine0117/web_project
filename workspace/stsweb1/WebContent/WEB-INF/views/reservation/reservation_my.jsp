<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>나의예약</title>
<link rel="stylesheet" href="common/common.css">
<link rel="stylesheet" href="css/css_reservation/reservation_my.css">
<jsp:include page="../../../resources/common/nav/nav.jsp"/>
<script type="text/javascript">
$(function(){
    $('div ul li a').removeClass('active');
    $('div ul li:nth-child(3) a').addClass('active');
 });
  function goPage(pages) {
		var pages;
		if(pages ==0){
		}else{	
		location.href = "resv_my.do?pages=" + pages;
		}
	}
  function backPages(pages) {
		location.href = "resv_my.do?pages=" + 1;
	}
  </script>
<style>
/* 지울거임 */
footer{
     border-top: 1px solid #e0e0e0;
     min-width: 1000px;
     line-height: 25px;
     padding: 35px 0;
     text-align: center;
     position: relative;
     bottom: 0;
     font-size: 12px;
     color: #808080;
     margin: 63px auto 0px auto;
     
   }
</style>
</head>
<body>
  <div class="center">

    <section>
      <!-- 탭메뉴 -->
      <div class="tab_menu">
        <ul>
          <span class="">
            <li class="res icon_res" onclick="location.href='resv.do'">
              <p><a href="resv.do">예약하기</a></p>
            </li>
          </span>
          <span class="active_tab">
            <li class="res icon_my" onclick="location.href='resv_my.do'">
              <p><a href="resv_my.do">나의예약</a></p>
            </li>
          </span>
        </ul>
      </div> <!-- //탭메뉴  -->

      <div class="tab_content">
        <div class="searchlist">
          <p class="first">나의 예약 내역</p>
          <table class="reserv_list"  >
            <colgroup>
              <col style="width:10%;">
              <col style="width:20%;">
              <col style="width:20%;">
              <col style="width:10%;">
              <col style="width:10%;">
              <col style="width:10%;">
            </colgroup>
            <tr>
              <th>예약번호</th>
              <th>상호</th>
              <th>예약일/시간</th>
              <th>인원</th>
              <th>처리결과</th>
              <th>상세</th>
            </tr>
            <c:forEach var="list" items="${lists }">
            
	            <tr>
	              <td><p>${list.bo_code }</p></td>
	              <td>
	              <c:forEach var="res" items="${res }" >
	              <a href="/detail.do?res_code=${res.res_code }">
              		<c:if test="${list.res_code == res.res_code }">${res.res_name }
              		</c:if>
              		</a>
	              </c:forEach>
	              	</td>
	              <td>
	                <p>${list.bo_date }</p>
	                <p>${list.bo_time }</p>
	              </td>
	              <td><p>${list.bo_member }</p></td>
	              <c:choose>
	              	<c:when test="${list.bo_conf=='처리완료' }">
	              		<td><p>미방문</p></td>
	              	</c:when>
	              	<c:otherwise>
	              		<td><p>방문</p></td>
	              	</c:otherwise>
	              </c:choose>
	              <td><a href="resv_detail.do?bo_code=${list.bo_code }">보기</a></td>
	            </tr>
            </c:forEach>
          </table>
        </div> <!-- //searchlist  -->
        <!-- paging -->
       <jsp:include page="../../../resources/common/paging/paging.jsp"></jsp:include>
      </div>
    </section>
  </div>
</body>
<jsp:include page="../../../resources/common/footer/footer.jsp"></jsp:include>
</html>