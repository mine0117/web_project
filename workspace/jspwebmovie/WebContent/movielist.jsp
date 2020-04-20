<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      <article id="list">
        <div class="obj_section">
          <h3 class="tit_t1"><img src="images/tit_movie1.png" width="120" height="24" alt="현재 상영영화"></h3>
          <div class="tab_t1">
          	<ul class="tab_s1">
          		<!-- <li class="on"><a href="" class="item1">상영영화</a></li>
          		<li><a href="./current.nhn?view=list&tab=singleTheater&order=open" class="item2">단관개봉</a></li> -->
          	</ul>
          	<ul class="sorting_t1 sort">
          		<li class="on"><a href="/movielist.do?orderValue=rday" class="item1" title="개봉순 정렬">개봉순</a><!-- N=a:now.day --></li>
          		<li><a href="/movielist.do?orderValue=staravg" class="item3" title="평점순 정렬">평점순</a><!-- N=a:now.star --></li>
          	</ul>
          </div>
          
          <script>
          
          $('.sort li a').click(function(){
        	  $('.sort li').removeClass('on');
        	  $(this).parent().addClass('on');
          });
          
          
          </script>
          			

			
          <div class="lst_wrap">
          	<ul class="lst_detail_t1">
          	<c:forEach var="mlist" items="${mlist}">
          		<li>
          			<div class="thumb">
                	<a href=""><img src="images/poster/${mlist.mid}.jpg" width="99" height="141" alt="${mlist.mname}" onerror="this.src='images/dft_img99x141.png'"></a>
                </div>
          			<dl class="lst_dsc">
          				<dt class="tit">
                    <span class="ico_rating_${mlist.rank_css }">${mlist.rank}</span>
                    <a href="moviedetail.do?mid=${mlist.mid}">${mlist.mname}</a>
          						<!-- N=a:nol.title,r:1,i:162249 -->
          				</dt>
                	<dd class="star">
                    <dl class="info_star">
          						<dt class="tit_t1">네티즌</dt>
          						<dd>
          							<div class="star_t1">
          								<a href=""><span class="st_off"><span class="st_on" style="width:${mlist.str_star*10 }%"></span></span><span class="num">${mlist.str_star }</span><span class="num2">참여 <em>${mlist.rcount }</em> 명</span></a><!-- N=a:nol.urating -->
          							</div>
                      	<span class="split">|</span>
                      </dd>
                    </dl>
          				</dd>
          				<dd>
          					<dl class="info_txt1">
          						<dt class="tit_t1">개요</dt>
          						<dd>
          							<span class="link_txt">${mlist.genre}</span>
          							<span class="split">|</span>
          								${mlist.rtime}분
                        <span class="split">|</span>
          								${mlist.rday}개봉
          						</dd>
          						<dt class="tit_t2">감독</dt>
          						<dd>
          							<span class="link_txt">
          								${mlist.director}
          							</span>
          						</dd>
          						<dt class="tit_t3">출연</dt>
          						<dd>
          							<span class="link_txt">
          								${mlist.cast}
          							</span>
          						</dd>
          					</dl>
          				</dd>
          				<!-- 로그인을 했을 경우 --> 
						<c:if test="${loginUser ne null}">
                 		 <dd class="info_t1">
						   <div class="btn_area">
                      		<span class="btn_t1">
                        		<a href="reviewform.do?mid=${mlist.mid}" class="item6">리뷰쓰6</a>
							</span>
						 	</div>
        				</dd>
        				</c:if>
          			</dl>

          		</li>
			</c:forEach>
            </ul>
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