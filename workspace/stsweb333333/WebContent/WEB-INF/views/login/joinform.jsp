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
<link rel="stylesheet" href="css/joinform.css">
<link rel="stylesheet" href="common/common.css">
<title>회원가입</title>
<script>
    var jenderid;
    function checkGen(jenderid){
      if(jenderid=="manlb"){
        document.getElementById("manlb").className="on";
        document.getElementById("womanlb").className=" ";
        document.getElementById(jenderid).checked=true;
      }
      if(jenderid=="womanlb"){
        document.getElementById("womanlb").className="on";
        document.getElementById("manlb").className=" ";
        document.getElementById(jenderid).checked=true;
      }

    }

	function checkid(){
		var id = document.getElementById("inputID").value;
		location.href="checkid.do?id="+uid;
	}

	function checkid(){
		var uid = document.getElementById("inputID").value;
		location.href="checkid.do?uid="+uid;
	}
	
     var uidcheckRS = document.getElementById("uidcheckResult").value;
            	
	btn_insert.onclick = function(){
        if(uidcheckRS != "0"){
        alert("아이디를 확인하세요");
   }
}
</script>
</head>
<body>
  <header class="header" style="margin-bottom:50px;">
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
            <li><a class="" href="#">예약맛집</a></li>
            <li><a href="#">Q & A</a></li>
            <button type="button" class="login">로그인</button>
            <button type="button" class="login">회원가입</button>
          </ul>
        </div>
      </nav>
    </header>

    <section>
      <div class="join_content">
        <h2>회원가입 작성하기</h2>
        <form action="join.do" method="post">
          <div class="join_form">
              <!--아이디-->
              <div class="join_row">
                <span class="ps_box">
                  	<input class="allinput" type="text" name="uid" id="inputID" value="${uid}" maxlength="20" autocomplete="off" placeholder="아이디를 입력해주세요.">
                 		<span class="input-group-btn"><button type="button" class="btn btn-default" onclick="checkid();">중복체크</button></span>
                		<input type="hidden" name="uidcheckResult" id="uidcheckResult" value="${uid }" required>
                </span>
                <div class="error" style="display:none">필수 정보입니다.</div>
              </div>
              <!--비밀번호-->
              <div class="join_row">
                <span class="ps_box">
                  <input class="allinput" type="password" name="pw" value maxlength="30" autocomplete="off" placeholder="비밀번호를 입력해주세요.">
                </span>
                <div class="error" style="display:none">필수 정보입니다.</div>
              </div>

              <!--이름-->
              <div class="join_row">
                <span class="ps_box">
                  <input class="allinput" type="text" name="name" maxlength="30" autocomplete="off" placeholder="이름을 입력해주세요.">
                </span>
                <div class="error" style="display:none">필수 정보입니다.</div>
              </div>

              <!--성별-->
              <div id="genderdiv" class="join_row_gender">
                <span class="gender">
                  <span class="jender">
                    <input type="radio" id="man" name="gender" value="남자" onclick="checkGen('manlb')">
                    <label id="manlb" for="man" class=" ">남자</label>
                  </span>
                  <span class="jender">
                    <input type="radio" id="woman" name="gender" value="여자" onclick="checkGen('womanlb')">
                    <label id="womanlb" for="woman" class=" ">여자</label>
                  </span>
                </span>
                <span id="genderMsg" class="error" style="display:none">필수 정보입니다.</span>
              </div>
              <!--생년월일-->
              <div class="birdiv">
                <span>
                  <input class="allinput" type="text" name="birthday" maxlength="6" value="" placeholder="생년월일(6자리)">
                </span>
                <span  class="error" style="display:none">필수 정보입니다.</span>
              </div>
              <!--이메일-->
              <div  class="join_row">
                <span class="ps_box_email">
                  <input class="allinput" type="text" id="email" name="email" maxlength="50" value="" placeholder="이메일을 입력해주세요.">
                </span>
                <div class="emailMsg" class="error" style="display:none">필수 정보입니다.</div>
              </div>
              <!--전화번호-->
              <div class="join_row">
                <span>
                  <input class="allinput" type="text" name="tel" id="hpnum" maxlength="11" placeholder="핸드폰번호(-없이입력해주세요 )">
                </span>
              </div>
              <!--주소-->
              <div class="join_row">
                <span>
                  <input class="allinput" type="text" name="address" id="addr" maxlength="100" placeholder="주소를 입력해주세요.">
                </span>
              </div>
          </div>

          <span class="btn_join">
            <input type="submit" id="btnSubmit" value="회원가입" alt="회원가입" class="joinbtn">
          </span>
        </form>

      </div>
  </section>


</body>
</html>
