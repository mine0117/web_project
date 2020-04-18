<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="common/common.css">
  <link rel="stylesheet" href="css/css_mypage/mypage_reservation_shop.css">
  <jsp:include page="../../../resources/common/nav/nav.jsp"></jsp:include>
</head>
<body>
	 <div class="center">
    <section>
      <!-- 탭메뉴 -->
      <div class="tab_menu">
        <ul>
          <span>
            <li class="res icon_res" >
              <p><a href="mypage_user_info.do">나의정보</a></p>
            </li>
          </span>
          <span class="">
            <li class="res icon_my" >
              <p><a href="mypage_user_myres_path.do">나의음식점</a></p>
            </li>
          </span>
          <span class="active_tab">
            <li class="res icon_my" >
              <p><a href="#">음식점예약</a></p>
            </li>
          </span>
        </ul>
      </div><!--//탭메뉴 -->


      <div class="tab_content">
        <div class="searchlist">
          <p class="first">(음식점) 예약 내역</p>
          <table class="reserv_list"  >
            <colgroup>
              <col style="width:10%;">
              <col style="width:15%;">
              <col style="width:20%;">
              <col style="width:10%;">
              <col style="width:10%;">
              <col style="width:15%;">
            </colgroup>
            <tr>
              <th>예약번호</th>
              <th>예약자</th>
              <th>예약일/시간</th>
              <th>인원</th>
              <th>처리결과</th>
              <th>보기</th>
            </tr>
       	<c:forEach var="lists" items="${lists }">
            <tr>
              <td><p>${lists.bo_code }</p></td>
              <td>${lists.bo_name }</td>
              <td>
                <p>${lists.bo_date }</p>
                <p>${lists.bo_time }</p>
              </td>
              <td><p>${lists.bo_member }</p></td>
              <td><p>${lists.bo_conf }</p></td>
              
              <td><a href="reservation_shop_detail.do?bo_code=${lists.bo_code}">자세히보기</a></td>
            </tr>
        </c:forEach>

          </table>
        </div> <!-- //searchlist  -->
      </div>
    </section>

  </div>
</body>
<jsp:include page="../../../resources/common/footer/footer.jsp"></jsp:include>
</html>