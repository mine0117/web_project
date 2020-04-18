<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="common/common.css">
<link rel="stylesheet" href="css/mainpage.css">
<jsp:include page="../../resources/common/nav/nav.jsp"></jsp:include>
<title>메인페이지</title>
<script>

/* 	$(function(){
	 $('nav ul li a').removeClass('active');
	 $('nav ul li:nth-child(1) a').addClass('active');
	})
 */
  var chgimg; //바뀔 이미지 주소
  var loc;    //zoom될 위치
  function fn_list_chgImg(chgimg,loc){
    document.getElementById(loc).src = chgimg;
  }
</script>

</head>
<body>

  <section>
    <div  class="container" id="left-nav">
      <!-- 좌측 지역 nav -->
      <div class="seoul">
        <button class="map_gb on" onclick="location.href='north.do'">
        </button>
        <button class="map_gn" onclick="location.href='south.do'">
        </button>
      </div>
      <div class="red_container">
          <div class="inner-container">
            <div class="boxing"><span>강북</span></div>지역 맛집찾기
          </div>

          <div class="z">
            찾고자 하는 상세 지역명을 클릭해주세요
          </div>
      </div>
      <div class="location-select">
          <table>            
            <c:forEach var="list" items="${southlist}" >            		
              <li><a class="location" href="main.do?map_num=${list.map_num}"> ${list.map_name}</a> </li>            		
            </c:forEach> 
          </table>
      </div>
    </div>
    <!-- 좌측 nav end -->
    <script>
    // 스크롤 따라가기
     var nav = $('.container');
     $(window).scroll(function () {
         if ($(this).scrollTop() > 180) {
             nav.addClass("f-nav");
         } else {
             nav.removeClass("f-nav");
         }
     });
    </script>
    <script type="text/javascript">
      $('.map_gb').click(function(){
        $('.map_gn').removeClass(' on');
      /*   $('.map_gb').addClass(' on');
        var gb="강북";
        $.ajax({
        	url : "/main.do",
        	type : 'POST',
        	dataType: "String",
        	data:gb,
        	success : alert("성공");
      }); */
      $('.map_gn').click(function(){
        $('.map_gb').removeClass(' on');
        $('.map_gn').addClass(' on');
   /*      var gn="강남";
        $.ajax({
        	url : "/main.do",
        	type : 'POST',
        	dataType: "String",
        	data:gn,
        	success : alert("성공");
      }); */
      })
      
    </script>

    <!-- 우측 nav start -->
  <div class="container2" id="detail-cont">
    <table>
      <tr>
        <td width="400px">
          <img class="sp" src="image_main/number/one.png" alt="">
          수엔부 |
          <img class="sp" src="image_main/icon/hansik.gif">
          한식 | (031)250-3305
        </td>
      </tr>
      <tr>
        <td>
          <div class="zoom">
            <img id="zoomimg_01" src="image_main/snb01.jpg" width="200">
          </div>
          <ul class="zoomimg_list">
            <div class="box1">
              <li>
                <a href="javascript:;" onmouseover="fn_list_chgImg('image_main/snb01.jpg', 'zoomimg_01')">
                <img src="image_main/snb01.jpg" width="60"></a>
              </li>
              <li>
                <a href="javascript:;" onmouseover="fn_list_chgImg('image_main/snb02.jpg', 'zoomimg_01')">
                <img src="image_main/snb02.jpg" width="60"></a>
              </li>
              <li>
                <a href="javascript:;" onmouseover="fn_list_chgImg('image_main/snb03.jpg', 'zoomimg_01')">
                <img src="image_main/snb03.jpg" width="60"></a>
              </li>
            </div>
            <div class="box2">
              <li>
                <a href="javascript:;" onmouseover="fn_list_chgImg('image_main/snb04.jpg', 'zoomimg_01')">
                <img src="image_main/snb04.jpg" width="60"></a>
              </li>
              <li>
                <a href="javascript:;" onmouseover="fn_list_chgImg('image_main/snb05.jpg', 'zoomimg_01')">
                <img src="image_main/snb05.jpg" width="60"></a>
              </li>
              <li>
                <a href="javascript:;" onmouseover="fn_list_chgImg('image_main/snb06.jpg', 'zoomimg_01')">
                <img src="image_main/snb06.jpg" width="60"></a>
              </li>
            </div>

         </ul>
        </td>
        <td>
          <p><strong>경기 수원시 팔달구 매산로2가 97-5 2층</strong></p>
          <hr>
          <p>수원역에 위치한 인도 네팔요리 전문점 '수엠부' 네팔 현지의 맛을 그대로 재현한다! 네팔 현지인이 직접 운영하고,현지 주방장이 만들어 내는 그 특별한 네팔 요리의 향연. 더욱이 저렴한 가격에 푸짐한 현지의 깊은 맛을 경험할 수 있어 많..</p>
          <hr>
          <a href="#" class="detail_btn">상세정보</a>
        </td>
      </tr>

      <tr>
        <td >
          <img class="sp" src="image_main/number/two.png" alt="">
          수엔부 |
          <img class="sp" src="image_main/icon/hansik.gif">
          한식 | (031)250-3305
        </td>
      </tr>
      <tr>
        <td>
          <div class="zoom">
            <img id="zoomimg_02" src="image_main/snb01.jpg" width="200">
          </div>
          <ul class="zoomimg_list">
            <div class="box1">
              <li>
                <a href="javascript:;" onmouseover="fn_list_chgImg('image_main/snb01.jpg', 'zoomimg_02')">
                <img src="image_main/snb01.jpg" width="60"></a>
              </li>
              <li>
                <a href="javascript:;" onmouseover="fn_list_chgImg('image_main/snb02.jpg', 'zoomimg_02')">
                <img src="image_main/snb02.jpg" width="60"></a>
              </li>
              <li>
                <a href="javascript:;" onmouseover="fn_list_chgImg('image_main/snb03.jpg', 'zoomimg_02')">
                <img src="image_main/snb03.jpg" width="60"></a>
              </li>
            </div>
            <div class="box2">
              <li>
                <a href="javascript:;" onmouseover="fn_list_chgImg('image_main/snb04.jpg', 'zoomimg_02')">
                <img src="image_main/snb04.jpg" width="60"></a>
              </li>
              <li>
                <a href="javascript:;" onmouseover="fn_list_chgImg('image_main/snb05.jpg', 'zoomimg_02')">
                <img src="image_main/snb05.jpg" width="60"></a>
              </li>
              <li>
                <a href="javascript:;" onmouseover="fn_list_chgImg('image_main/snb06.jpg', 'zoomimg_02')">
                <img src="image_main/snb06.jpg" width="60"></a>
              </li>
            </div>
         </ul>
        </td>
        <td>
          <p><strong>경기 수원시 팔달구 매산로2가 97-5 2층</strong></p>
          <hr>
          <p>수원역에 위치한 인도 네팔요리 전문점 '수엠부' 네팔 현지의 맛을 그대로 재현한다! 네팔 현지인이 직접 운영하고,현지 주방장이 만들어 내는 그 특별한 네팔 요리의 향연. 더욱이 저렴한 가격에 푸짐한 현지의 깊은 맛을 경험할 수 있어 많..</p>
          <hr>
          <a href="#" class="detail_btn">상세정보</a>
        </td>
      </tr>

    </table>
  </div>
</section>
</body>
		
</html>
