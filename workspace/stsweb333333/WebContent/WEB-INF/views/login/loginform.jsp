<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="common/common.css">
  <link rel="stylesheet" href="css/loginform.css">

  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
  <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
  <script>
  function popupFindidpw(){
    var popURL = "findidpw.html";
    var popOption = "width=300px,height=200px,derectories=no,status=no,left=800px,top=400px;";
    window.open(popURL,"",popOption);
  }
</script>
<style media="screen">
.loginf_content{
  width:600px;
  margin: 60px 0 0 150px;
  height: 400px;
  padding: 60px;
  border: 2px solid #e7e7e7;
}
</style>
  <title>예약정보</title>
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
            <li><a href="#">Q & A</a></li>
            <button type="button" class="login">로그인</button>
            <button type="button" class="login">회원가입</button>
          </ul>
        </div>
      </nav>
    </header>

    <section>

      <!-- 탭컨텐츠 -->
      <div class="loginf_content">
        <p class="first">로그인</p>
         <form action="login.do" method="post">
          <div class="loginf">
            <div class="loginf_div">
              <label for="id">아이디 &nbsp;&nbsp;</label>
              <input class="loginf_input" type="text" id="id" >
            </div>
            <div class="loginf_div">
              <label for="pw">비밀번호</label>
              <input class="loginf_input" type="password" id="pw"/>
            </div>

            <div class="logindivbtn">
              <button type="submit" class="login_bt">로그인</button>
              <button type="#" class="login_bt">회원가입</button>
              <button type="button" class="login_bt" onclick="javascript:popupFindidpw()">ID/PW 찾기</button>
          </div>
          </div>
        </form>
      </div>
    </section>
  </div>
</body>
</html>
