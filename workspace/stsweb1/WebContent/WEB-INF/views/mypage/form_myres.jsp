<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="common/common.css">
  <link rel="stylesheet" href="css/css_mypage/form_myres.css">
 <jsp:include page="../../../resources/common/nav/nav.jsp"></jsp:include>
 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script>

    function render_mailchk() {
      var x = document.getElementById("mySelect").value;
      document.getElementById("myselect").value = x;
    }
    
     $(function(){
    	var ok = confirm("새로운 음식점을 등록하시겠습니까?");
    	if(ok==true){
    		
    	}else{
    		alert("등록을 취소하셨습니다.")
    		location.href="mypage_user_info.do";
    	}
    }); 

    $(function() {
        var Html = [];
        var values="";
        for (var i = 0; i < 25; i++) {
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


  		function register(){
  			var r=document.reg;
  			if(r.res_name.value==""){
  				alert("업체명을 입력해 주세요");
  				return false;
  			}else if(r.line.value==""){
  				alert("업종을 입력해 주세요");
  				return false;
  			}else if(r.res_addr.value==""){
  				alert("주소을 입력해 주세요");
  				return false;
  			}else if(r.res_tel.value==""){
  				alert("전화번호를 입력해 주세요");
  				return false;
  			}else if(r.res_hourS.value=="" || r.res_hourE==""){
  				alert("영업시간을 입력해 주세요");
  				return false;
  			}else if(r.holiday.value==""){
  				alert("휴일을 입력해 주세요");
  				return false;
  			}else if(r.seats.value==""){
  				alert("좌석을 입력해 주세요");
  				return false;
  			}else if(r.contents.value==""){
  				alert("소개를 입력해 주세요");
  				return false;
  			}else if(r.information_bo.value==""){
  				alert("예약정보를 입력해 주세요");
  				return false;
  			}/* else if(r.theme.value==""){
  				alert("테마를을 체크해 주세요");
  				return false;
  			}
  			 */
  			
  			alert("등록이 완료되었습니다")
  			return true
  		}
  		
  		function cancel(){
  			alert("취소했습니다.");
  			location.href="mypage_user_info.do";
  		}
  		
  		function info(){
  			if(confirm("나의정보로 돌아가시겠습니까?")){
  				location.href="mypage_user_info.do";
  			}else{
  				alert("취소하였습니다.");
  			}
  			
  		}
  		
  		function back(){
  			alert("음식점 등록을 완료해주세요");
  		}
  		function reg(){
  			alert("음식점 등록을 완료해주세요");
  			
  		}
  		
  	   function checkAll2(){
  	        if( $("#theme").is(':checked') ){
  	          $("input[name=theme]").prop("checked", false);
  	        }else{
  	          $("input[name=theme]").prop("checked", true);
  	        }
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
  <title>음식점 등록</title>
</head>
<body>
		<div class="center">
    <section>
      <!-- 탭메뉴 -->
      <div class="tab_menu">
        <ul>
          <span>
            <li class="res icon_res" >
              <p><a href="javascript:info();">나의정보</a></p>
            </li>
          </span>
          <span class="active_tab">
            <li class="res icon_my" >
              <p><a href="javascript:reg();">나의음식점</a></p>
            </li>
          </span>
           <span>
            <li class="res icon_res" >
              <p><a href="javascript:back();">음식점예약</a></p>
            </li>
          </span>
        </ul>
      </div>
		
      <!-- 탭컨텐츠 -->
      <div class="tab_content">
        <p class="first">등록접수</p>
          <div class="info">
            <form action="mypage_user_check.do" method="get" onsubmit="return register();" name="reg">
              <ul class="form">
                <li class="li">
                  <label for="res_name">
                    <img claas="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 업체명</label>
                  <input type="text" id="res_name" name="res_name">
                </li>
                <li class="li">
                  <label for="line">
                    <img claas="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 업종</label>
                  <input type="text" id="line" name="line" />
                </li>
                 <li class="li">
	             <label for="postcode">
	             <img claas="reddot" src="common/image/ico_reddot.gif" alt="reddot">우편번호</label>
	             <input class="info_input" type="text" name="postcode" id="sample6_postcode" value="${list.postcode }">
				 <input class="" type="button" onclick="execDaumPostcode()" value="우편번호 찾기" style="width:109px;padding:4px">
	            </li>
                <li class="li">
                  <label for="res_addr">
                  <img claas="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 주소</label>
                  <input type="text" id="sample6_address" name="res_addr" style="width:461px;">
                  <input class="info_input" type="hidden" name="address2" id="sample6_address2" placeholder="상세주소" >
                </li>
                <li class="li">
                  <label for="res_tel">
                  <img claas="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 전화번호</label>
                  <input type="text" id="res_tel" name="res_tel">
                </li>
                <li class="li">
                  <label for="selectTimeSE">
                  <img claas="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 영업시간</label>
                  <select id="selectTimeS" name="res_hourS">                 
                  </select>
                  <label for="selectTimeS2">~</label>
                  <select id="selectTimeS2" name="res_hourE">                 
                  </select>
                </li>
                <li class="li">
                  <label for="holiday">
                  <img claas="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 휴일</label>
                  <input type="text" id="holiday" name="holiday" >
                </li>
                <li class="li">
                  <label for="seats">
                  <img claas="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 좌석</label>
                  <input type="text" id="seats" name="seats" >
                </li>
                <li class="li">
                  <label for="contents">
                  <img claas="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 소개</label>
                  <input type="text" id="contents" name="contents" >
                </li>
                <li class="li">
                 <label >
                 <img claas="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 예약정보</label>
                   <select name="information_bo">                      
                        <option value="가능">예약 가능</option>
                        <option value="불가능">예약 불가능</option>
                   </select>
                </li>
              <li class="li">               
                  <label class="la_theme">
                  <img class="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 테마</label>                
                   <div class="div_theme">                  
                     <label><input type="checkbox" name="theme" id="theme" value="가족모임" 
                     <c:if test="${fn:indexOf(vo.theme,'가족모임')!=-1}">checked = "checked"</c:if>><span>가족모임</span></label>
                     <label><input type="checkbox"  name="theme" id="theme"  value="연인과함께"
                      <c:if test="${fn:indexOf(vo.theme,'연인과함께')!=-1}">checked="checked"</c:if>><span>연인과함께</span></label>
                     <label><input type="checkbox" name="theme" id="theme" value="친구와함께"
                      <c:if test="${fn:indexOf(vo.theme,'친구와함께')!=-1}">checked="checked"</c:if>><span>친구와함께</span></label>    
                     <label><input type="checkbox" name="theme" id="theme" value="날씨에따라"
                      <c:if test="${fn:indexOf(vo.theme,'날씨에따라')!=-1}">checked="checked"</c:if>><span>날씨에따라</span></label>
                     <label><input type="checkbox" name="theme" id="theme" value="치맥/피맥"
                      <c:if test="${fn:indexOf(vo.theme,'치맥/피맥')!=-1}">checked="checked"</c:if>><span>치맥/피맥</span></label>     
                     <label><input type="checkbox" name="theme" id="theme" value="달콤후식"
                      <c:if test="${fn:indexOf(vo.theme,'달콤후식')!=-1}">checked="checked"</c:if>><span>달콤후식</span></label>
                     <label><input type="checkbox" name="theme" id="theme" value="건강식"
                      <c:if test="${fn:indexOf(vo.theme,'건강식')!=-1}">checked="checked"</c:if>><span>건강식</span></label>
                     <label><input type="checkbox" name="theme" id="theme" value="tv맛집"
                      <c:if test="${fn:indexOf(vo.theme,'tv맛집')!=-1}">checked="checked"</c:if>><span>tv맛집</span></label>
                     <label><input type="checkbox"  name="theme" id="theme" value="돼지고기"
                      <c:if test="${fn:indexOf(vo.theme,'돼지고기')!=-1}">checked="checked"</c:if>><span>돼지고기</span></label>
                     <label><input type="checkbox" name="theme" id="theme" value="소고기"
                      <c:if test="${fn:indexOf(vo.theme,'소고기')!=-1}">checked="checked"</c:if>><span>소고기</span></label>
                     <label><input type="checkbox"  name="theme" id="theme" value="닭"
                      <c:if test="${fn:indexOf(vo.theme,'닭')!=-1}">checked="checked"</c:if>><span>닭</span></label>    
                     <label><input type="checkbox"  name="theme" id="theme" value="해산물"
                      <c:if test="${fn:indexOf(vo.theme,'해산물')!=-1}">checked="checked"</c:if>><span>해산물</span></label> 
                     <label><input type="checkbox"  name="theme" id="theme" value="면요리"
                      <c:if test="${fn:indexOf(vo.theme,'면요리')!=-1}">checked="checked"</c:if>><span>면요리</span></label> 
                     <label><input type="checkbox"  name="theme" id="theme" value="분식/즉석"
                      <c:if test="${fn:indexOf(vo.theme,'분식/즉석')!=-1}">checked="checked"</c:if>><span>분식/즉석</span></label>
                     <label><input type="checkbox"   name="theme" id="theme" value="무한뷔페"
                      <c:if test="${fn:indexOf(vo.theme,'무한뷔페')!=-1}">checked="checked"</c:if>><span>무한뷔페</span></label>
                     <label><input type="checkbox"   name="theme" id="theme" value="무한리필"
                      <c:if test="${fn:indexOf(vo.theme,'무한리필')!=-1}">checked="checked"</c:if>><span>무한리필</span></label>
                      <label class="total">
                      <p><input type="checkbox" name="theme" id="theme" onclick="checkAll2();"  value="전체선택/해제"/><span>전체선택/해제</span></p>
                      </label>                                                             
                   </div>
                    	
                </li>   
                  <li class="li">
                  <label for="res_uid">                 
                  <input type="hidden" id="res_uid" name="res_uid" value="${uid }">
                </li>
              </ul>
              <button type="submit">등록</button>
              <button type="reset">다시작성하기</button>
              <button type="button" onclick="cancel();">취소</button>
            </form>
          </div><!-- //info  -->
      </div>
    </section>
  </div>
</body>
<jsp:include page="../../../resources/common/footer/footer.jsp"></jsp:include>
</html>