<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="common/common.css">
  <link rel="stylesheet" href="css/css_mypage/form_myres.css">
 <jsp:include page="../../../resources/common/nav/nav.jsp"></jsp:include>
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

    // function count_ck(obj){
    // 	var chkbox = document.getElementsByName("En_theme");
    // 	var chkCnt = 0;
    //
    // 	for(var i=0;i<chkbox.length; i++){
    // 		if(chkbox[i].checked){
    // 			chkCnt++;
    // 		}
    // 	}
    // 	if(chkCnt>4){
    //   alert("최대 선택개수를 초과하였습니다.");
    // 		obj.checked = false;
    // 		return false;
    // 	}
    // }
  </script>
  <script>
  		function register(){
  			alert("등록이 완료되었습니다")
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
              <p><a href="mypage_user_info.do">나의정보</a></p>
            </li>
          </span>
          <span class="active_tab">
            <li class="res icon_my" >
              <p><a href="mypage_user_myres.do">나의음식점</a></p>
            </li>
          </span>
           <span>
            <li class="res icon_res" >
              <p><a href="mypage_reservation_shop.do">음식점예약</a></p>
            </li>
          </span>
        </ul>
      </div>
		
      <!-- 탭컨텐츠 -->
      <div class="tab_content">
        <p class="first">등록접수</p>
          <div class="info">
            <form action="mypage_user_check.do?id=${id }" method="get" onsubmit="return register();">
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
                  <label for="res_addr">
                  <img claas="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 주소</label>
                  <input type="text" id="res_addr" name="res_addr">
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
                  <img claas="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 테마</label>
                   <div class="div_theme">
                     <label><input type="checkbox" onClick="count_ck(this);" name="theme" value="가족모임">
                       <span>가족모임</span></label>
                     <label><input type="checkbox" onClick="count_ck(this);"  name="theme"  value="연인과함께">
                       <span>연인과함께</span></label>
                     <label><input type="checkbox" onClick="count_ck(this);" name="theme"  value="친구와함께">
                       <span>친구와함께</span></label>
                     <label><input type="checkbox" onClick="count_ck(this);" name="theme" value="날씨에따라">
                       <span>날씨에따라</span></label><br>
                     <label><input type="checkbox" onClick="count_ck(this);" name="theme" value="치맥/피맥">
                       <span>치맥/피맥</span></label>
                     <label><input type="checkbox" onClick="count_ck(this);" name="theme" value="달콤후식">
                       <span>달콤후식</span></label>
                     <label><input type="checkbox" onClick="count_ck(this);" name="theme" value="건강식">
                       <span>건강식</span></label>
                     <label><input type="checkbox" onClick="count_ck(this);" name="theme" value="tv맛집">
                       <span>tv맛집</span></label><br>
                     <label><input type="checkbox" onClick="count_ck(this);"  name="theme" value="돼지고기">
                       <span>돼지고기</span></label>
                     <label><input type="checkbox" onClick="count_ck(this);" name="theme" value="소고기">
                       <span>소고기</span></label>
                     <label><input type="checkbox" onClick="count_ck(this);"  name="theme" value="닭">
                       <span>닭</span></label>
                     <label><input type="checkbox" onClick="count_ck(this);"  name="theme" value="해산물">
                       <span>해산물</span></label><br>
                     <label><input type="checkbox" onClick="count_ck(this);"  name="theme" value="면요리">
                       <span>면요리</span></label>
                     <label><input type="checkbox" onClick="count_ck(this);"  name="theme" value="분식/즉석">
                       <span>분식/즉석</span></label>
                     <label><input type="checkbox" onClick="count_ck(this);"   name="theme" value="무한뷔페">
                       <span>무한뷔페</span></label>
                     <label><input type="checkbox" onClick="count_ck(this);"   name="theme" value="무한리필">
                       <span>무한리필</span></label><br>
                   </div>
                </li>
                  <li class="li">
                  <label for="res_uid">                 
                  <input type="hidden" id="res_uid" name="res_uid" value="${id }">
                </li>
              </ul>
              <button type="submit">등록</button>
              <button type="reset">다시작성하기</button>
              <button type="button">취소</button>
            </form>
          </div><!-- //info  -->
      </div>
    </section>
  </div>
</body>
<jsp:include page="../../../resources/common/footer/footer.jsp"></jsp:include>
</html>