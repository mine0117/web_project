<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import = "java.sql.*" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>영화</title>
<jsp:include page="/common/head.jsp"></jsp:include>
</head>
<body>
<header>
<jsp:include page="/common/nav.jsp"></jsp:include>
</header>
<section>
    <div class="content-wrap">
      <article id="searchresult">
        <div id="content">
          <div class="article">
            <div class="old_layout">
              <!-- Content Body -->
              <div id="cbody" class="type_2 cbody_type_2">
                <div id="old_content" class="search_all">
                  <!--검색결과헤더-->
                  <p class="search_keyword">'<strong>${keyvalue }</strong>'에 대한 영화 통합검색결과 입니다.</p>
                  <!-- 영화 검색결과 -->
                  <div class="search_header first-child">
            				<span class="num">총 ${total }건</span>
          			  </div>
          			<!--//검색결과헤더-->
          			<!--검색결과-->
          			<ul class="search_list_1">
          			<c:forEach var="list" items="${list}">
          				<li>
          					<p class="result_thumb">
          						<a href="/moviedetail.do?mid=${list.mid }"><img src="images/poster/${list.mid }.jpg" width="67" height="95" alt=""></a>
          					</p>
          					<dl>
          						<dt><a href="/moviedetail.do?mid=${list.mid }"><strong>${list.mname }</strong></a>
									${list.mname_e }
								</dt>
          						<dd class="point b_star">
          							<span class="star"><em class="view_star" style="width:${list.star *10 }%"></em></span><em class="num">${list.str_star }</em> <em class="cuser_cnt">(참여 ${list.rcount }명)</em>
          						</dd>
          						<dd class="etc">${list.genre }
                        <span class="vr">|</span>
                        <em>${list.country }</em>
                        <span class="vr">|</span>${list.rtime }분<span class="vr">|</span>
                        <fmt:formatDate value="${list.rday}" pattern="yyyy" />
                      </dd>
          						<dd class="etc">
                        감독 : ${list.director }<span class="vr">|</span>
                        출연 : ${list.cast }
                      </dd>
                      
							<!--                       
          						<dd class="etc_btn">
          								<a href="/movie/bi/mi/reserve.nhn?code=136315" target="_blank"><img src="https://ssl.pstatic.net/static/movie/2013/07/btn_reserve.png" alt="예매" width="40" height="21"></a>
          						</dd>
          					 -->
          						
          					</dl>
          				</li>
          				</c:forEach>
        			</ul>
        			<!--//검색결과 -->






        						</div>
        						<img src="https://ssl.pstatic.net/imgmovie/2007/img/common/blank.gif" alt="" class="clear">
        					</div>
        					<!-- //Content Body -->

        				</div>
        			</div>
        		</div>

      </article>
    </div>
</section>
<footer>
<jsp:include page="/common/footer.jsp"></jsp:include>
</footer>
</body>
</html>