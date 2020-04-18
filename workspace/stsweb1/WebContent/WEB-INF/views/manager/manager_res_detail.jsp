<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="common/common.css">
<link rel="stylesheet" href="css/css_mypage/mypage_user_myres.css">
<jsp:include page="../../../resources/common/nav/nav.jsp"></jsp:include>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
.menu td input{
	text-align:center;
}
.tab_menu{
	height:1600px;
}
</style>
 <script>
  	function deletechk(code,name,uid){
		var x = confirm("음식점 "+name+"("+code+")"+"를(을) 정말 삭제 하시겠습니까?");
		if(x==true){
			alert("삭제되었습니다.");
			location.href="manager_res_delete.do?res_code="+code+"&res_uid="+uid;
		}
	}
  	$(function(){
		$('div ul li a').removeClass('active_tab');
		$('div ul li:nth-child(4) a').addClass('active_tab');
	})

    $(function() {
    	var map_name = new Array('가로수길','강남역','관악/신림','구로','노량진','목동/강서','반포/서래마을','방배/사당','서초/교대', 
    			'신논현/영동시장','신사/잠원','압구정/청담','양재/도곡','선릉/삼성/대치','역삼','영등포/여의도','잠실/신천','천호/강동','서대문','응암/새절',
    			'광진/건대입구','광화문/시청','노원/도봉/미아','대학','동대문','부암동/평창동','마포','상암','서촌/경복궁','성동/성수','성북', 
    			'숙대/서울역','신촌/이대','안암/고대','연남동/연희동','연신내/불광','이촌동/용산','이태원/한남동','종로/인사','충무로/신당','홍대/상수/합정','회기');
        var Html = [];
        for (var i = 100; i < 142; i++) {
        	Html[i]="<option value="+i+">"+i+" : "+map_name[i-100]+"</option>";
            $("#map").append(Html.join(""));
            Html = [];
        }
    });

    $(function() {
        var Html = [];
        var values="";
        for (var i = 9; i < 22; i++) {
          for(var j = 0; j < 60; j=j+30){
            if(j==0){
              value=i+":0"+j+"";
            }else {
              value=i+":"+j+"";
            }
            Html[i]="<option value="+value+">"+value+"</option>";
            $("#selectTimeS").append(Html.join(""));
            $("#selectTimeS2").append(Html.join(""));

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
  <title>승인 음식점_정보수정</title>
</head>
<body>
  <div class="center">
     <section>
      <!-- 탭메뉴 -->
       <jsp:include page="../../../resources/common/nav/nav_manager.jsp"></jsp:include>
      <!-- 탭컨텐츠 -->
      <div class="tab_content">
        <p class="first">승인 음식점 정보수정</p>
          <div class="info">
            <form action="manager_res_update.do" method="get">
              <ul class="form">
                <li class="li">
                  <label for="Rname">
                    <img class="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 업체명</label>
                  <input type="hidden" id="res_code" name="res_code" value="${vo.res_code }">
                  <input type="text" id="Rname" name="res_name" value="${vo.res_name }">
                </li>
                <li class="li">
                  <label for="Uname">
                    <img class="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 업주</label>
               		<input type="text" id="Uname" name="res_uid" value="${vo.res_uid }">
                </li>
                <li class="li">
                  <label for="Rtype">
                    <img class="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 업종</label>
                  <input type="text" id="Rtype" name="line" value="${vo.line }" />
                </li>
                <li class="li">
		          <label for="address">
		          <img class="reddot" src="common/image/ico_reddot.gif" alt="reddot">우편번호</label>
		          <input type="text" name="res_postcode" id="sample6_postcode" value="${vo.res_postcode }" style="width:336px;">
				  <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" style="width:109px;padding:4px">
		        </li>
                <li class="li">
		          <label for="address">
		          <img class="reddot" src="common/image/ico_reddot.gif" alt="reddot">주소</label>
		          <input type="text" name="res_addr" id="sample6_address" value="${vo.res_addr }">
		          <input type="hidden" name="address2" id="sample6_address2" placeholder="상세주소" >
          		</li>
                <li class="li">
                  <label for="Rnumber">
                  <img class="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 전화번호</label>
                  <input type="text" id="Rnumber" name="res_tel" value="${vo.res_tel }">
                </li>
                <li class="li">
                  <label for="selectTimeS">
                  <img class="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 영업시간</label>
                  <select id="selectTimeS" name="res_hourS">
                  	<option value="${vo.res_hourS }" selected>${vo.res_hourS }</option>
                  </select>
                  
                  <label for="selectTimeS2">~</label>
                  <select id="selectTimeS2" name="res_hourE">
                  	<option value="${vo.res_hourE }" selected>${vo.res_hourE }</option>
                  </select>
                </li>
                <li class="li">
                  <label for="Rholiday">
                  <img class="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 휴일</label>
                  <input type="text" id="holiday" name="holiday" value="${vo.holiday}">
                </li>
             	<li class="li">
                  <label for="Rseats">
                  <img class="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 좌석</label>
                  <input type="text" id="Rseats" name="seats" value="${vo.seats }">
                </li>
                <li class="li">
                 <label >
                 <img class="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 예약정보</label>
                	<select name="information_bo" >
	                  	<option value="${vo.information_bo }" selected>${vo.information_bo }</option>
	                  	<option value="가능">예약 가능</option>
	                  	<option value="불가능">예약 불가능</option>
                	</select>
                </li>
                 <li class="li">
                 <label >
                 <img class="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 지역</label>
                	<select id="map" name="map_num" >
	                  	<option value="100" selected>${vo.map_num }</option>
	                </select>
                </li>
                <li class="li">
                  <label for="contents">
                  <img class="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 소개글</label>
                  <input type="text" id="contents" name="contents"  value="${vo.contents}">
                </li>
              	<li class="li">
                  <label for="lng">
                  <img class="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 경도</label>
                  <input type="text" id="lng" name="lng"  value="${vo.lng}">
                </li>
                <li class="li">
                  <label for="lat">
                  <img class="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 위도</label>
                  <input type="text" id="lat" name="lat" value="${vo.lat}">
                </li>
                <li class="li">
                  <label class="la_theme">
                  <img class="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 테마</label>
                   <div class="div_theme">
                     <label><input type="checkbox" name="theme" value="가족모임" 
                     <c:if test="${fn:indexOf(vo.theme,'가족모임')!=-1}">checked = "checked"</c:if>><span>가족모임</span></label>
                     <label><input type="checkbox"  name="theme"  value="연인과함께"
                      <c:if test="${fn:indexOf(vo.theme,'연인과함께')!=-1}">checked="checked"</c:if>><span>연인과함께</span></label>
                     <label><input type="checkbox" name="theme"  value="친구와함께"
                      <c:if test="${fn:indexOf(vo.theme,'친구와함께')!=-1}">checked="checked"</c:if>><span>친구와함께</span></label>    
                     <label><input type="checkbox" name="theme" value="날씨에따라"
                      <c:if test="${fn:indexOf(vo.theme,'날씨에따라')!=-1}">checked="checked"</c:if>><span>날씨에따라</span></label>
                     <label><input type="checkbox" name="theme" value="치맥/피맥"
                      <c:if test="${fn:indexOf(vo.theme,'치맥/피맥')!=-1}">checked="checked"</c:if>><span>치맥/피맥</span></label>     
                     <label><input type="checkbox" name="theme" value="달콤후식"
                      <c:if test="${fn:indexOf(vo.theme,'달콤후식')!=-1}">checked="checked"</c:if>><span>달콤후식</span></label>
                     <label><input type="checkbox" name="theme" value="건강식"
                      <c:if test="${fn:indexOf(vo.theme,'건강식')!=-1}">checked="checked"</c:if>><span>건강식</span></label>
                     <label><input type="checkbox" name="theme" value="tv맛집"
                      <c:if test="${fn:indexOf(vo.theme,'tv맛집')!=-1}">checked="checked"</c:if>><span>tv맛집</span></label>
                     <label><input type="checkbox"  name="theme" value="돼지고기"
                      <c:if test="${fn:indexOf(vo.theme,'돼지고기')!=-1}">checked="checked"</c:if>><span>돼지고기</span></label>
                     <label><input type="checkbox" name="theme" value="소고기"
                      <c:if test="${fn:indexOf(vo.theme,'소고기')!=-1}">checked="checked"</c:if>><span>소고기</span></label>
                     <label><input type="checkbox"  name="theme" value="닭"
                      <c:if test="${fn:indexOf(vo.theme,'닭')!=-1}">checked="checked"</c:if>><span>닭</span></label>    
                     <label><input type="checkbox"  name="theme" value="해산물"
                      <c:if test="${fn:indexOf(vo.theme,'해산물')!=-1}">checked="checked"</c:if>><span>해산물</span></label> 
                     <label><input type="checkbox"  name="theme" value="면요리"
                      <c:if test="${fn:indexOf(vo.theme,'면요리')!=-1}">checked="checked"</c:if>><span>면요리</span></label> 
                     <label><input type="checkbox"  name="theme" value="분식/즉석"
                      <c:if test="${fn:indexOf(vo.theme,'분식/즉석')!=-1}">checked="checked"</c:if>><span>분식/즉석</span></label>
                     <label><input type="checkbox"   name="theme" value="무한뷔페"
                      <c:if test="${fn:indexOf(vo.theme,'무한뷔페')!=-1}">checked="checked"</c:if>><span>무한뷔페</span></label>
                     <label><input type="checkbox"   name="theme" value="무한리필"
                      <c:if test="${fn:indexOf(vo.theme,'무한리필')!=-1}">checked="checked"</c:if>><span>무한리필</span></label>
                   </div>
                </li>
               
                 <li class="li">
                 <label>
                 <img class="reddot" src="common/image/ico_reddot.gif" alt="reddot">허가</label>
                	<select name="permission">
	                  	<option value="${vo.permission }" selected>${vo.permission }</option>
	                  	<option value="승인">승인</option>
	                  	<option value="미승인">미승인</option>
	           		</select>
                </li>
              </ul>
              <button type="submit">수정</button>
              <button type="button" onclick="deletechk(${vo.res_code },'${vo.res_name }','${vo.res_uid }')">삭제</button>
              <button type="button" onclick="location.href='manager_reslist.do'">취소</button>
            </form>
            <br>
            <ul>
             <li class="li">
               <label class="la_theme">
                 <img class="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 메뉴판</label>
                 <br><br>
                 <table class="menupan" >
                    <colgroup>
                      <col style="width:15%;">
                      <col style="width:15%;">
                      <col style="width:15%;">
                      <col style="width:15%;">
                      <col style="width:15%;">
                    </colgroup>
                    <tr>
                      <th>메뉴코드</th>
                      <th>분류</th>
                      <th>메뉴</th>
                      <th>가격</th>
                      <th> </th>
                    </tr>
                    <c:forEach var="list" items="${list }" varStatus="num">
                    <form action="manager_menu_update.do" method="get">
	                   <tr class="menu">   
	                     <td>
	                     <input type="hidden" id="res_code" name="res_code" value="${vo.res_code }">
	                     <input type="text" name="menu_code" value="${list.menu_code }" readonly></td>
	                     <td><input type="text" name="menu_cate" value="${list.menu_cate }"></td>
	                     <td><input type="text" name="menu_fname" value="${list.menu_fname }"></td>
	                     <td><input type="text" name="price" value="${list.price }"></td>
	                  	 <td><button class="change" type="submit">수정</button></td>
	                   </tr>
                  	</form>
            		</c:forEach>
                  </table> 
                </li>
            </ul>
          </div><!-- //info  -->
      </div>
    </section>
  </div>
</body>
</html>
