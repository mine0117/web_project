<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>예약맛집</title>
  <link rel="stylesheet" href="common/common.css">
  <link rel="stylesheet" href="css/css_reservation/reservation.css">

</head>
<body>
  <div class="center">
    <header class="header ">
      <div class="top">
        <!-- 로고와 제목 -->
        <div class="title">
          <img class="logo" src="common/image/logo.gif" alt="logo">
          <h2>서울맛집찾기</h2>
        </div>

        <!-- 검색창 -->
        <div class="search">
            <input class="searchtext" type="text"/>
            <button type="button">검색</button>
        </div>
      </div>
      <!-- 공통 네비게이션 -->
      <nav>
        <div class="nav">
          <ul class="">
            <li><a href="#">지역별맛집</a></li>
            <li><a href="#">테마별맛집</a></li>
            <li><a class="active" href="#">예약맛집</a></li>
            <li><a href="#">Q & A</a></li>
            <button type="button" class="login">로그인</button>
            <button type="button" class="login">회원가입</button>
          </ul>
        </div>
      </nav>
    </header>


    <section>
      <!-- 탭메뉴 -->
      <div class="tab_menu">
        <ul>
          <span class="active_tab">
            <li class="res icon_res" onclick="location.href='resv.do'">
              <p><a href="resv.do">예약하기</a></p>
            </li>
          </span>
          <span class="">
            <li class="res icon_my" onclick="location.href='resv_my.do'">
              <p><a href="resv_my.do">나의예약</a></p>
            </li>
          </span>
        </ul>
      </div>

      <div class="tab_content">
        <p class="first">예약 맛집 찾기</p>
        <div class="search_res">
          <form action="resv_find.do" method="get">
            <div class="select">
              <label for="foodcode" class="ml">업종</label>
              <select id="foodcode" name="foodcode" class="sd">
                <option value="none" selected>--업종선택--</option>
                <option value="ko_food">한식</option>
                <option value="us_food">양식</option>
                <option value="jp_food">일식</option>
                <option value="cn_food">중식</option>
              </select>
            </div>
            <div class="select">
              <label for="">테마</label>
              <select id="themacode" name="themacode" class="sd">
                <option value="none" selected>--테마선택--</option>
                <option value="no">--</option>
              </select>
            </div>
            <div class="select">
              <label for="locationcode">지역</label>
              <select id="locationcode" name="locationcode" class="sd">
                <option value="none" selected>--지역선택--</option>
                <option value="no" >--</option>
              </select>

            </div>
            <div class="select">
              <label for="mat_name">맛집이름</label>
              <input class="res_name" type="text" id="fl_name">
            </div>
            <div class="select">
              <label for="mat_loca">하위주소</label>
              <input class="addr" type="text" id="mat_loca">
            </div>
            <button class="sbutton" type="submit">검색</button>
          </form>
        </div>
        
        
        <div class="searchlist">

          <h5>예약가능 맛집 리스트</h5>
          <table >
            <colgroup>
              <col style="width:50%;">
              <col style="width:30%;">
              <col style="width:10%;">
              <col style="width:10%;">
            </colgroup>
        		<tr>
        			<th>상호/주소</th>
        			<th>영업시간/휴일</th>
              		<th>후기</th>
        			<th>선택</th>
        		</tr>
        		<c:forEach var="list" items="${list}">
        		<tr>
		              <td>
		                  <a href=""><img class="food_img" src="image_reservation/food/food.jpg" alt="음식점사진"></a>
		                  <a class="food_a">${list.res_name}</a>
		                  <p class="food_p">${list.res_addr}</p>
		              </td>
		              <td>
		                <p>${list.res_hour}</p>
		                <p>${list.holiday}</p>
		              </td>
		              <td>3개</td>
		              <td><a class="food_a_re" href="resv_info.do">예약</a></td>
            	</tr>
            	</c:forEach>
          </table>
        </div>

      </div><!-- //탭 컨탠츠 1-->



    </section>


  </div>
</body>
</html>