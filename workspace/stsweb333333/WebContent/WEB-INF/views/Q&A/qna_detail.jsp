<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="common/common.css">
  <link rel="stylesheet" href="css/Q&A-detail.css">

  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
  <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
  <title>Q&A_detail</title>
	<script>
    function delqna(q_num){
    var delok=confirm("선택한게시물을 삭제하시겠습니까?");
    if(delok==true){
    	location.href="qna_delete.do?q_num="+q_num;
    }else{
    	alert("게시물을 삭제하지않겠습니다.");
    }

  }
  </script>
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
            <li><a href="#">예약맛집</a></li>
            <li><a class="active" href="#">Q & A</a></li>
            <button type="button" class="login">로그인</button>
            <button type="button" class="login">회원가입</button>
          </ul>
        </div>
      </nav>
    </header>
    <section>
      <!-- 탭메뉴 -->
      <div class="p">
        <h3>Q&A</h3>
      <!-- 탭컨텐츠 -->
      <div class="tab_content">
      <form action="" method="">
        <table class="Q_table">
          <colgroup>
            <col style="width:20%">
            <col style="width:40%">
          </colgroup>
          <tr class="Q_first">
            <th>SUBJECT</th>
            <td colspan="3" >${list.q_title }</td>
          </tr>
          <tr>
            <th>NAME</th>
            <td colspan="3">${list.q_id }</td>
          </tr>
          <tr>
            <th>DATE</th>
            <td>${list.q_date }</td>
            <th>VIEW</th>
            <td>${list.q_hits }</td>
          </tr>
          <tr>
            <td  colspan="4">
              ${list.q_contents }
          </tr>
        </table>
        <button type="button" class="Q_button" onclick="location.href='qna.do'">글목록</button>
        <button type="button" class="Q_button" onclick="location.href='qna_modify.do?num=${list.q_num }'">글수정</button>
        <button type="button" class="Q_button" onclick="location.href='javascript:delqna(${list.q_num });'">글삭제</button>
        <button type="button" class="Q_button" id="btn_master">답글달기</button>
      </form>
    </div>
  </div>
</section>
</div>
</body>
</html>