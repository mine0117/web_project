<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
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
           <li><a href="/manager_penalty.do">예약맛집</a></li>
           <li><a href="#">Q & A</a></li>
           <button type="button" class="login">로그인</button>
           <button type="button" class="login">회원가입</button>
         </ul>
       </div>
     </nav>
   </header>
