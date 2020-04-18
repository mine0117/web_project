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
  
 function area(area) {
	 alter(area);
	  var south = new Array('가로수길','강남역','관악/신림','구로','노량진','목동/강서','반포/서래마을','방배/사당','서초/교대', 
  			'신논현/영동시장','신사/잠원','압구정/청담','양재/도곡','선릉/삼성/대치','역삼','영등포/여의도','잠실/신천','천호/강동');
	  var north = new Array('서대문','응암/새절',
  			'광진/건대입구','광화문/시청','노원/도봉/미아','대학','동대문','부암동/평창동','마포','상암','서촌/경복궁','성동/성수','성북', 
  			'숙대/서울역','신촌/이대','안암/고대','연남동/연희동','연신내/불광','이촌동/용산','이태원/한남동','종로/인사','충무로/신당','홍대/상수/합정','회기');
      var Html = [];
      if(area=='south'){
      	for (var i = 100; i < 119; i++) {
    	Html[i]="<li><a class=location href=south.do?map_num="+i+">"+south[i-100]+"</a></li>"
          $("#map").append(Html.join(""));
          Html = [];
      	}
      }else{
    	for (var i = 100; i < 119; i++) {
   	    	Html[i]="<li><a class=location href=south.do?map_num="+i+">"+north[i-100]+"</a></li>"
 	          $("#map").append(Html.join(""));
 	          Html = [];
    	 }
      }
  }

</script>

</head>
<body>

  <section>
    <div  class="container" id="left-nav">
      <!-- 좌측 지역 nav -->
      <div class="seoul">
        <button class="map_gb on" onclick="area('north')">
        </button>
        <button class="map_gn" onclick="area('south')">
        </button>
      </div>
      <div class="red_container">
          <div class="inner-container">
            <div class="boxing"><span>강남</span></div>지역 맛집찾기
          </div>

          <div class="z">
            찾고자 하는 상세 지역명을 클릭해주세요
          </div>
      </div>
      <div class="location-select">
          <table id="map">            
                      		
              <li><a class="location" href="south.do?map_num=${list.map_num}">${list.map_name }</a> </li>            		
          
         
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
    
      $('.map_gn').click(function(){
        $('.map_gb').removeClass(' on');
        $('.map_gn').addClass(' on');
  
      })
      
    </script>

    <!-- 우측 nav start -->
  <div class="container2" id="detail-cont">
    <table>
    <c:forEach var="list" items="${list}" varStatus="num">
      <tr>
        <td width="400px">
          <img class="sp" src="image_main/number/one.png" alt="gg">${list.res_name } |
          <img class="sp" src="image_main/icon/hansik.gif">${list.line } 
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
          <p><strong>${list.res_addr }</strong></p>
          <hr>
          <p>${list.contents }</p>
          <hr>
          <a href="#" class="detail_btn">상세정보</a>
        </td>
      </tr>
 	</c:forEach> 

    </table>
  </div>
</section>
</body>
		
</html>
