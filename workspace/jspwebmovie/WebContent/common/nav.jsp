<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <div class="navwarp">
      <nav>
        <h1 class="logo">LOGO</h1>
        <ul>
          <li><a href="main.do">영화홈</a></li>
          <li><a href="movielist.do">영화목록</a></li>
          <li><a href="reviewlist.do">리뷰</a></li>
        </ul>
      </nav>
      
      <script>
	    $('.navwarp li').click(function(){
	  	  $('.navwarp li').removeClass('active');
	  	  $(this).parent().addClass('active');
	    });
    </script>
      
      
      
      <div class="top-nav">

      <!-- 로그인을 하지 않았을 경우  --> 
      <c:if test="${loginUser eq null}">
      	<span class="gnb"><a href="loginform.do">로그인</a></span>
        </c:if>
                
		<!-- 로그인을 했을 경우 --> 
		<c:if test="${loginUser ne null}">

			
		<div class="dropdown" style="display: inline-block;">
			<a id="dLabel" data-target="#" href="http://example.com" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">
   				<b><%= session.getAttribute("dname").toString() %></b>님
  			</a>		
	         <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
	           <li role="presentation"><a href="modifyform.do?id=${loginUser.id}">내 정보 수정</a></li>
	           <li role="presentation"><a href="Myreviewlist.do?id=${loginUser.id}">내가 쓴 리뷰</a></li>
	           <li role="presentation" class="divider"></li>
	           <li role="presentation"><a href="logout.do">로그아웃</a></li>
	         </ul>
		</div>
		
		<script>
		$('.dropdown-toggle').dropdown()
		</script>


		</c:if>

      <div class="search">
        <div class="srch_field_on _view">
        	<form method="get" action="searchresult.do">
      			<span class="ipt_srch">
					<label for="ipt_tx_srch" id="search_placeholder" style="display: inline;">영화검색</label>
					<input type="text" id="ipt_tx_srch" class="ipt_tx_srch" name="query" maxlength="100" accesskey="s" style="ime-mode:active;" autocomplete="off">
					<span class="align"></span>
				</span>
				<button type="submit" title="검색" class="btn_srch"><span class="blind">검색</span></button>
			</form>
		</div>
      </div>
    </div>
    </div>
    
    

