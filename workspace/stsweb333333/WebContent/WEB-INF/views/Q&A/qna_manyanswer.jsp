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
  <title>qna_manyanswer</title>
	<script>
/*     function delqna(q_num){
    var delok=confirm("선택한게시물을 삭제하시겠습니까?");
    if(delok==true){
    	location.href="qna_delete.do?q_num="+q_num;
    }else{
    	alert("게시물을 삭제하지않겠습니다.");
    }

  } */
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
      <form action="qna_manyanswer.do" method="get">
        <table class="Q_table">
          <colgroup>
            <col style="width:20%">
            <col style="width:40%">
          </colgroup>
          <tr class="Q_first">
            <th>SUBJECT</th>
            <td colspan="3" >자주하는 질문</td>
          </tr>
          <tr>
            <th>NAME</th>
            <td colspan="3">관리자</td>
          </tr>
          <tr>
            <th>DATE</th>
            <td>날짜</td>
            <th>VIEW</th>
            <td>0</td>
          </tr>
          <tr>
            <td  colspan="4">
             	안녕하세요 저희 메뉴판닷컴을 찾아주셔서 감사합니다 
             	하도 질문을 씨부리길래 추려서 정리해보았습니다<br>
             	----------------------------------
             	<br>
             	▶뭐하는페이지인가요?<br>
             	음식점등록도 무료 예약도 무료 그러나 예약하고 쌩까면 패널티<br>
             	▶창희오빠가 오전에오는걸 본적이없다?<br>
             	친구들이랑 술먹고 점심이후에 슬금슬금 나타난다
          </tr>
        </table>
        <button type="button" class="Q_button" onclick="location.href='qna.do'">글목록</button>
       <%--  <button type="button" class="Q_button" onclick="location.href='javascript:delqna(${list.q_num });'">글삭제</button --%>
        <!-- <button type="button" class="Q_button" id="btn_master">답글달기</button> -->
      </form>
    </div>
  </div>
</section>
</div>
</body>
</html>