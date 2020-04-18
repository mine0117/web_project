<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/common/common.css">
<jsp:include page="../../resources/common/nav/nav.jsp"></jsp:include>
<script>
    function fn_list_chgImg(chgimg,loc){
      document.getElementById(loc).src = chgimg;
    }

 	function goPage(pages) {
		location.href = "search.do?pages="+pages+"&res_name=${res_name}";
	}

	function backPages(){
		location.href ="search.do?pages="+1+"&res_name=${res_name}";
	}
</script>
<style>
	.all{width: 100%;}
	section{
	width: 750px;
	margin:50px auto;
	}

	#container{
  		box-sizing: border-box;
		padding : 10px 20px;
		width:500px;
		height: 90px;
		margin-bottom:63px;
	}
	
    /* 음식점 zoom이미지 */
    .zoom{
      float: left;
      margin: 5px;
    }



  /* 상세정보 */
  .detail_btn{
    background-color: #a70101;
    border: none;
    color: white;
    padding: 10px 8px;
    text-align: center;
    font-size: 16px;
    margin: 6px 2px;
    cursor: pointer;
    float: right;
    border-radius:3px;
  }
  img.res_img{
  	width:180px;height:180px;
  	border-radius:4px;
  }
  td.td{
    overflow:hidden;
  	padding-right:30px;
  }
  
  span.res_name{
  	font-weight:bold;
  	font-size : 15px;
  }
  
  tr{
  	height:220px;
  	border : 1px solid #000;
  }
  
  a.addr{
  color:#000;}
  
  a.addr:hover{
  	border-bottom : 1px solid #000;
  }
  
  
  img.sp{
  position: relative;
  top:3px;
  }
/* pagination */
.pagination {
  margin-top: 50px;
  text-align: center;
}
.pagination li a{
    color: black;
    padding: 8px 16px;
    transition: background-color .3s;
}

.pagination li.active a{
    background-color: #a70101;
    color: white;
}
.pagination a:hover:not(.active) {background-color: #ddd;}
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
     
     margin: 74px auto 0px auto;
   }

</style>
</head>
<body>
  <div class="all">
  <section>
   <div id="detail-cont">
    <table>
    <c:set value="0" var="co"/>
    <c:if test="${fn:length(list) eq 0 }">
    	<h3>'${res_name }'과(와) 일치하는 검색결과가 없습니다.<br><br>
    	검색어를 다시 입력해주세요.
    	</h3>
    </c:if>
    <c:if test="${count > 0}">
     <h4>검색어 '${res_name }'과(와) 일치하는 음식점은 총 ${count}개 입니다.<br><br></h4>
    </c:if>
    <c:forEach var="list" items="${list}" begin="0" end="${count }">
      <tr class="allTd">
        <td class="td">
          <div class="zoom">
 			<img class="res_img" src="resImg/${list.res_code }/${piclist[co] }" alt="음식점 사진">   
 		  </div>
        </td>
        <td class="td"> 
        	<img class="sp" src="image_main/icon/hansik.gif">
	        <a class="addr" href="/detail.do?res_code=${list.res_code }">
	          <span class="res_name">
	          
	          ${list.res_name } |
	          </span> 
	          ${list.res_addr }
	        </a></br>
	        <div id="container">
	          <p>${list.contents }</p>
	        </div>
        </td>
      </tr> 
      <c:forEach var="z" begin="0" end="2">
      	<c:if test="${z ne 1}">
      		<c:set var="co" value="${co+1}"/>
      	</c:if>
      </c:forEach>
 	</c:forEach> 
    </table>
  	</div> 
	</section>
  </div>
	<!-- 페이징  -->
  <jsp:include page="../../resources/common/paging/paging.jsp"></jsp:include>
  
</body>
<jsp:include page="../../resources/common/footer/footer.jsp"></jsp:include>

</html>