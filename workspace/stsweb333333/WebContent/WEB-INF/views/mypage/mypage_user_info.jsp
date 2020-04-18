<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="/common/common.css">
  <link rel="stylesheet" href="/css/css_mypage/mypage_user.css">
<jsp:include page="../../../resources/common/nav/nav.jsp"></jsp:include>
<script>
    function render_mailchk() {
    var x = document.getElementById("mySelect").value;
    document.getElementById("myselect").value = x;
    }
	
    function updateresult(){
    	var ok=confirm("수정을 완료하겠습니까?");
    	if(ok==true){
    		alert("수정이 완료되었습니다");
    	}else{
    		alert("수정을 취소했습니다");
    		return false;
    	}
    }

  </script>

</head>
<body>
     

    <section>
      <!-- 탭메뉴 -->
      <div class="tab_menu">
        <ul>
          <span class="active_tab">
            <li class="res" >
              <p><a href="mypage_user_info.do">나의정보</a></p>
            </li>
          </span>
          <span class="">
            <li class="res" >
              <p><a href="mypage_user_myres.do?uid=${uid }">나의음식점</a></p>
            </li>
          </span>
          <span class="">
            <li class="res icon_my" >
              <p><a href="mypage_reservation_shop.do">음식점예약</a></p>
            </li>
          </span>
        </ul>
      </div>

	
      <div class="tab_content">
        <form class="" action="mypage_user_info2.do" method="get" onsubmit="return updateresult();">     
          <p class="first">나의 정보 수정</p>
          <ul class="info">
           <li class="myli">
              <label for="id">아이디</label>
              <input class="info_input" type="text" id="uid" name="uid"  value="${list.uid }">
            </li>
            <li class="myli">
              <label for="name">이름</label>
              <input class="info_input" type="text" id="name" name="name" value="${list.name }">
            </li>
            <li class="myli">
              <label for="pw">비밀번호</label>
              <input class="info_input" type="password" id="pw" name="pw" value="${list.pw }">
            </li>
            <li class="myli">
              <label for="tel">전화번호</label>
              <input class="info_input" type="text" id="tel" name="tel" value="${list.tel }">
            </li>
            <li class="myli">
              <label for="address">주소</label>
              <input class="info_input" type="text" id="address" name="address" value="${list.address }">
            </li>
            <li class="myli">
              <label  class="email" for="email">이메일</label>
              <input class="info_input_2" type="text" id="email" name="email" value="${list.email }">
              @ <input class="info_input_2" type="text" id="myselect" name="email2" value="${email2 }">
              <select class="info_select" id="mySelect"  onchange="render_mailchk();">
                <option value="" selected>직접입력</option>
                <option value="naver.com">naver.com</option>
                <option value="nate.com">nate.com</option>
                <option value="daum.net">daum.net</option>
                <option value="gmail.com">gmail.com</option>
                <option value="hanmail.net">hanmail.net</option>
              </select><br>
            </li>
            <li class="myli">
              <label for="enroll">등록상태</label>
              <input class="info_input" type="number" id="enroll" name="enroll" readonly value="${list.enroll }">
            </li>
            <li class="myli">
              <label for="penalty">패널티 횟수</label>
              <input class="info_input" type="number" id="penalty" name="penalty" readonly value="${list.penalty }">
            </li>
          </ul>

          <div class="bt">
            <button type="submit" class="info_bt">수정하기</button>
            <button type="button" class="info_bt">취소</button>
          </div>
        
        </form>
      </div>
 
    </section>
</body>
<jsp:include page="../../../resources/common/footer/footer.jsp"></jsp:include>
</html>