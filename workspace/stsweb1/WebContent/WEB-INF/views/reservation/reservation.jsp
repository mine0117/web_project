<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>예약맛집</title>
<link rel="stylesheet" href="common/common.css">
<link rel="stylesheet" href="css/css_reservation/reservation.css">
<jsp:include page="../../../resources/common/nav/nav.jsp"/>
<script type="text/javascript">
  $(function(){
      $('div ul li a').removeClass('active');
      $('div ul li:nth-child(3) a').addClass('active');
   });

  function goPage(pages) {
	if(pages ==0){
	}else{
		location.href="resv.do?pages="+pages;
	}
  }
  
  function backPages(){
	  location.href ="resv.do?pages="+1
  }
  function penaltyInquire(penalty,rescode){
	  if(penalty==3){
		  alert("패널티 누적으로 예약이 불가능합니다.");
	  }else{
		  location.href="resv_info.do?res_code="+ rescode;
	  }
  }
</script>

</head>
<body>
  <div class="center">
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

      <div class="tab_content">
        <p class="first">예약 맛집 찾기</p>
        <div class="search_res">
          <form action="resv_find.do" method="get">
            <div class="select">
              <label for="line" class="ml">업종</label>
              <select id="line" name="line" class="sd">
                <option value="" selected>--업종선택--</option>
                <option value="한식">한식</option>
                <option value="양식">양식</option>
                <option value="일식">일식</option>
                <option value="중식">중식</option>
              </select>
            </div>
            <div class="select">
              <label for="">테마</label>
              <select id="theme" name="theme" class="sd">
                <option value="" selected>--테마선택--</option>
                <option value="가족">가족모임</option>
                <option value="연인">연인과함께</option>
                <option value="친구">친구와함께</option>
                <option value="날씨">날씨에따라</optio분식n>
                <option value="치맥/피맥">치맥/피맥</option>
                <option value="후식">달콤후식</option>
                <option value="건강식">건강식</option>
                <option value="TV맛집">TV맛집</option>
                <option value="돼지">돼지고기</option>
                <option value="소">소고기</option>
                <option value="닭">닭</option>
                <option value="해산물">해산물</option>
                <option value="면요리">면요리</option>
                <option value="분식/즉석">분식/즉석</option>
                <option value="무한뷔페">무한뷔페</option>
                <option value="무한리필">무한리필</option>
              </select>
            </div>
            <div class="select">
              <label for="location">지역</label>
              <select id="location" name="location" class="sd">
                <option value="" selected>--지역선택--</option>
                <c:forEach var="region" items="${region }">
                	<option value="${region.map_num }" >${region.map_name }</option>
                </c:forEach>
              </select>

            </div>
            <div class="select">
              <label for="res_name">맛집이름</label>
              <input class="res_name" type="text" id="res_name" name="res_name" value="${res_name }">
            </div>
            <div class="select">
              <label for="res_addr">하위주소</label>
              <input class="addr" type="text" id="res_addr" name="res_addr" value="${res_addr }">
            </div>
            <script type="text/javascript">
            $('#line option[value=${line}]').prop('selected', 'selected').change();
            $('#theme option[value=${theme}]').prop('selected', 'selected').change();
            $('#location option[value=${location}]').prop('selected', 'selected').change();
            
            </script>
            <button class="sbutton" type="submit">검색</button>
          </form>
        </div>
        <div class="searchlist">
          <h5>예약가능 맛집 리스트</h5>
          <table >
            <colgroup>
              <col style="width:50%;">
              <col style="width:30%;">
              <col style="width:10%;">
              <col style="width:10%;">
            </colgroup>
        		<tr>
        			<th>상호/주소</th>
        			<th>영업시간/휴일</th>
              		<th>후기</th>
        			<th>선택</th>
        		</tr>
        		<c:set value="0" var="cont"/>
        		<c:forEach var="list" items="${lists}" varStatus="statusnum">
        		<tr>
	              <td>
	              
	                  <a href="/detail.do?res_code=${list.res_code }">
	                  	<img class="food_img" id="zeroimg_${cont }" src="" alt="음식점사진"></a>
	                  <a href="/detail.do?res_code=${list.res_code }" class="food_a">${list.res_name}</a>
	                  <p class="food_p">${list.res_addr}</p>
					
					<!-- 이미지 split --> 
				      <script type="text/javascript">
				        var strArray = "${list.pics}".split('/');
				        var str = strArray[0];
				        var text = "resImg/${list.res_code}/";
				        var result= text.concat(str);
				        document.getElementById("zeroimg_${cont}").src = result;
				      </script>
	              </td>
	              <td>
	                <p>${list.res_hourS}~${list.res_hourE}</p>
	                <p>${list.holiday}</p>
	              </td>
	              <c:set var="cntt" value="0"/>
	              <c:forEach var="review" items="${review }" varStatus="m" begin="0">
		              <c:if test="${list.res_code == review.res_code}">
		              	<c:set var="temp" target="cntt" value="${cntt=cntt+1}"/>
		              </c:if>
	              </c:forEach>
	              <td>${cntt }개</td>
	              <c:set var="cntt" value="0"/>
	              <td><a class="food_a_re" onclick="javascript:penaltyInquire(${mem.penalty},${list.res_code });">예약</a></td>
            	</tr>
            	<c:forEach var="z" begin="0" end="1">
			      	<c:if test="${z ne 1}">
			      		<c:set var="cont" value="${cont=cont+1}"/>
			      	</c:if>
			    </c:forEach>
            	</c:forEach>
      
      
          </table>
        </div>
        <!-- paging -->
   <jsp:include page="../../../resources/common/paging/paging.jsp"></jsp:include>
   
      </div><!-- //탭 컨탠츠 1-->
    </section>
  </div>
</body>
<jsp:include page="../../../resources/common/footer/footer.jsp"></jsp:include>
</html>