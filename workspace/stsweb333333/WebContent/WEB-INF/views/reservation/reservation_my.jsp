<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>나의예약</title>
  <link rel="stylesheet" href="common/common.css">
  <link rel="stylesheet" href="css/css_reservation/reservation_my.css">
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
            <tr>
              <td><p>1</p></td>
              <td><a href="">파스타짱</a></td>
              <td>
                <p>2018-06-01</p>
                <p>10 : 00</p>
              </td>
              <td><p>2명</p></td>
              <td><p>미방문</p></td>
              <td><a href="resv_detail.do">보기</a></td>
            </tr>
            <tr>
              <td><p>2</p></td>
              <td><a href="">파스타꽝</a></td>
              <td>
                <p>2018-06-02</p>
                <p>10 : 00</p>
              </td>
              <td><p>2명</p></td>
              <td><p>미방문</p></td>
              <td><a href="resv_detail.do">보기</a></td>
            </tr>

          </table>
        </div> <!-- //searchlist  -->
      </div>
    </section>

  </div>
</body>
</html>