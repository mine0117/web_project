<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="common/common.css">
  <link rel="stylesheet" href="css/css_reservation/reservation_info.css">

  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
  <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
  <script>


    function render_mailchk() {
    var x = document.getElementById("mySelect").value;
    document.getElementById("myselect").value = x;
    }
    
    function bookingOK(){
    	var resOK = confirm("ㄹㅇ루 예약?");
    	if(resOK==true){
    		document.getElementById("boooking").submit();
    	}else if(resOK == false){
    		return;
    	}
    }

   $(function() {
     $("#datepicker").datepicker({
     dateFormat: 'yymmdd',
     monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNamesMin: ['일','월','화','수','목','금','토'],
      changeMonth: true, //월변경가능
        changeYear: true, //년변경가능
      showMonthAfterYear: true, //년 뒤에 월 표시
     });
  });

  $(function() {
      var Html = [];
      var values="";
      for (var i = 10; i < 22; i++) {
        for(var j = 0; j < 60; j=j+10){
          if(j==0){
            value=i+"시 0"+j+"분";
          }else {
            value=i+"시 "+j+"분";
          }
          Html[i]="<option value="+value+">"+value+"</option>";
          $("#selectTimeS").append(Html.join(""));
          Html = [];
        }
      }
  });

  $(function() {
      var Html = [];
      var values="";
      for (var i = 1; i < 21; i++) {
          value=i
          Html[i]="<option value="+value+">"+value+"</option>";

      }
      $("#selectTimeC").append(Html.join(""));
  });
</script>
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

      <!-- 탭컨텐츠 -->
      <div class="tab_content">
        <p class="first">예약정보작성</p>
        <form action="reservation.do" method="get" id="boooking">
          <div class="info">
            <div class="info_div">
           	 <!-- 라벨 네글자로 바꿀거면 라벨 넓이 지정하고하셈ㅋ -->
              <label for="name_res">음식점</label>
              <input class="info_input" type="text" id="name_res" name="bo_name" value="동네맛집" readonly>
            </div>
            <div class="info_div">
              <label for="id">예약자</label>
              <input class="info_input" type="text" id="id" value="zionT" name="bo_id" readonly>
            </div>
            <div class="info_div">
              <label for="datepicker">예약일</label>
              <input class="info_input" type="text" id="datepicker" name="bo_date" value=""/>
            </div>
            <div class="info_div">
              <label for="selectTimeS">예약시간</label>
              <select id="selectTimeS" class="info_select" name="bo_time" value="">
              </select>
            </div>
            <div class="info_div">
              <label for="selectTimeC">예약인원</label>
              <select id="selectTimeC" class="info_select" name="bo_human" value="">
              </select>
            </div>
            <div class="info_div">
              <label for="phone">핸드폰</label>
              <input class="info_input" type="text" id="phone" name="bo_tel" value="">
            </div>
            <div class="info_div">
              <label for="email">이메일</label>
              <input class="info_input" type="text" id="email" name="bo_email" value="">
              @ 
              <input class="info_input_2" type="text" id="myselect">

              <select class="info_select" id="mySelect" name="myselect" onchange="render_mailchk();">
  						  <option value="">직접입력</option>
  		       	  <option value="naver.com">naver.com</option>
                <option value="nate.com">nate.com</option>
                <option value="daum.net">daum.net</option>
                <option value="gmail.com">gmail.com</option>
                <option value="hanmail.net">hanmail.net</option>
  				  	</select><br>
            </div>

            <button type="button" class="info_bt" onclick="bookingOK();">예약</button>
            <!-- 경고창 띄우고 , 예약되면 예약되었습니다 띄우고 reservation_my.html으로 이동 -->
            <button type="button" class="info_bt" onclick="href.location='resv.do'">취소</button>
            <button type="reset" class="info_bt">다시작성하기</button>

          </div>
        </form>
      </div>
    </section>
  </div>
</body>
</html>