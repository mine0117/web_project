<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/common/common.css">
<link rel="stylesheet" href="/css/css_mypage/mypage_user.css">
<jsp:include page="../../../resources/common/nav/nav.jsp"></jsp:include>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

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
	function cancel(){
		alert("취소하였습니다.");
		location.href="mypage_user_info.do";
	}
	
	function deleteUser(){
		if(confirm("회원을 탈퇴하시겠습니까?")){
			alert("회원을 탈퇴했습니다.");
			location.href="deleteUser.do?uid=${uid}";
		}else{
			alert("회원 탈퇴를 취소하였습니다.");
			return false;
		}
	}
	
	function no(){
		alert("아이디는 수정할 수 없습니다.");
	}
	/* 주소검색 */
    function execDaumPostcode(){
          new daum.Postcode({
              oncomplete: function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var fullAddr = ''; // 최종 주소 변수
                  var extraAddr = ''; // 조합형 주소 변수

                  // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                      fullAddr = data.roadAddress;

                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                      fullAddr = data.jibunAddress;
                  }

                  // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                  if(data.userSelectedType === 'R'){
                      //법정동명이 있을 경우 추가한다.
                      if(data.bname !== ''){
                          extraAddr += data.bname;
                      }
                      // 건물명이 있을 경우 추가한다.
                      if(data.buildingName !== ''){
                          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                      }
                      // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                      fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                  }

                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                 
                  document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                 
                  document.getElementById('sample6_address').value = fullAddr;

                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById('sample6_address2').focus();
              }
          }).open();
      }

	
  </script>
 <style>
footer{
     border-top: 1px solid #e0e0e0;
     min-width: 1000px;
     line-height: 25px;
     padding: 35px 0;
     text-align: center;
     position: relative;
     bottom: 0;
     font-size: 12px;
     color: #808080;
     margin: 63px auto 0px auto;
   }
</style>
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
              <p><a href="mypage_reservation_shop.do?uid=${uid }">음식점예약</a></p>
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
              <input class="info_input" type="text" id="uid" name="uid"  value="${list.uid }" readonly="readonly" onclick="no();">
            </li>
            <li class="myli">
              <label for="name">이름</label>
              <input class="info_input" type="text" id="name" name="name" value="${list.name }">
            </li>
            <li class="myli">
              <label for="pw">비밀번호</label>
              <input class="info_input" type="text" id="pw" name="pw" value="${list.pw }">
            </li>
            <li class="myli">
              <label for="tel">전화번호</label>
              <input class="info_input" type="text" id="tel" name="tel" value="${list.tel }">
            </li>
            <li class="myli">
             <label for="address">우편번호</label>
             <input class="info_input" type="text" name="postcode" id="sample6_postcode" value="${list.postcode }">
			 <input class="" type="button" onclick="execDaumPostcode()" value="우편번호 찾기" style="width:109px;padding:4px">
            </li>
            <li class="myli">
             <label for="address">주소</label>
             <input class="info_input" type="text" name="address" id="sample6_address" value="${list.address }" style="width:461px;">
         	<!--  <input class="info_input" type="hidden" name="address2" id="sample6_address2" placeholder="상세주소" > -->
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
            <c:if test="${list.enroll=='미등록' }">
              <label for="enroll">등록상태</label>
              <input class="info_input" type="text" id="enroll" name="enroll" readonly value="미등록">
            </c:if>
            <c:if test="${list.enroll =='등록' }">
              <label for="enroll">등록상태</label>
              <input class="info_input" type="text" id="enroll" name="enroll" readonly value="등록">
            </c:if>
            </li>
            <li class="myli">
              <label for="penalty">패널티 횟수</label>
              <input class="info_input" type="number" id="penalty" name="penalty" readonly value="${list.penalty }">
            </li>
          </ul>

          <div class="bt">
            <button type="submit" class="info_bt">수정하기</button>
            <button type="button" class="info_bt" onclick="cancel();">취소</button>
            <button type="button" class="info_bt" onclick="deleteUser();">삭제</button>
          </div>
        
        </form>
      </div>
 
    </section>
</body>
<jsp:include page="../../../resources/common/footer/footer.jsp"></jsp:include>
</html>