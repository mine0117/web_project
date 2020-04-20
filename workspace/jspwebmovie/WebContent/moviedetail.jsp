<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
      <!-- 무비상세 -->
      <article id="moviedetail">

        <div class="mv_info_area" style="display: block;">
          <div class="mv_info">
            <h3 class="h_movie"><a href="#">${vo.mname }</a></h3>
            <strong class="h_movie2" title="${vo.mname_e }, <fmt:formatDate value="${vo.rday}" pattern="yyyy" />">${vo.mname_e }, <fmt:formatDate value="${vo.rday}" pattern="yyyy" /></strong>
            <div class="main_score">
              <div class="score score_left">
                <div class="uio_ntz_btn">
                  <span class="ntz">
                    <em class="blind">네티즌 평점</em><a href="#" class="help" id="pointHelpButtonBasic" title="네티즌 평점 도움말 보기">네티즌 평점 도움말</a>
                  </span>
                  <div class="ly_ntz" id="pointHelpBasic" style="display:none" z-index="20">
                    <span></span>
                    <strong class="blind">네티즌 평점 도움말</strong>
                    국내 개봉작입니다. 관람하신 영화에 대한<br> 평점을 남겨주세요. 140자평 뿐 아니라 블<br>로그 영화 리뷰작성 시 등록한 별점도 함께<br> 반영됩니다.
                    <button type="button" class="btn_close" id="pointHelpCloseButtonBasic"><em>닫기</em></button>
                </div>
                <div class="ly_count" id="pointNetizenCountBasic" style="display:none">
                  <span></span>
                  참여 <em>${vo.rcount }</em>명
                </div>
              </div>
                <div class="star_score ">
                  <a href="#" id="pointNetizenPersentBasic">
                  	<span class="st_off"><span class="st_on" style="width:${vo.str_star*10}%"></span></span>
                  	<c:set var="TextValue" value="${vo.str_star}"/>
                  		<em class="num${fn:substring(TextValue,0,1) }">${fn:substring(TextValue,0,1) }</em><em class="dot">.</em><em class="num${fn:substring(TextValue,2,3) }">${fn:substring(TextValue,2,3) }</em><em class="num${fn:substring(TextValue,3,4) }">${fn:substring(TextValue,3,4) }</em>
                  </a>
                </div>
              </div>
            </div>

            <dl class="info_spec">
              <dt class="step1"><em>개요()</em></dt>
              <dd>
                <p>
                  <span>${vo.genre }</span>
                  <span>${vo.country }</span>
                  <span>${vo.rtime }분 </span>
                  <span>${vo.rday } 개봉</span>
                </p>
              </dd>
              <dt class="step2"><em>감독</em></dt>
              <dd><p>${vo.director }</p></dd>
              <dt class="step3"><em>출연</em></dt>
              <dd><p>${vo.cast }</p></dd>
              <dt class="step4"><em>등급</em></dt>
              <dd>
                <p>[국내]<a href="#">${vo.rank }</a></p>
              </dd>
            </dl>
          </div>
          <!-- 포스터 -->
          <div class="poster">
            <a href="#"><img src="images/poster/${vo.mid }.jpg" alt="${vo.mname }" width="203" height="290" onerror="this.src='images/dft_img203x290.png'"><span>포스터 크게보기</span></a>
          </div>
          <!-- //포스터 -->
        </div>

        <div class="sub_tab_area">
          <!-- [D] on, off로 컨트롤 -->
          <ul id="movieEndTabMenu" class="end_sub_tab">
            <!-- <li><a href="#" title="리뷰" class="tab06_on"><em>리뷰</em></a></li> -->
          </ul>
        </div>
        <div class="section_group section_group_frst">
          <div class="obj_section">
            <div class="ifr_module2" id="reviewTab">
              <div class="ifr_area">
                <div class="review">
                  <div class="title_area">
                    <h4 class="h_review"><strong class="blind">리뷰</strong></h4>
                    <!-- 로그인을 했을 경우 --> 
					<c:if test="${loginUser ne null}">
                    <a href="reviewform.do?mid=${vo.mid }" class="wrt_review"><em>리뷰쓰기</em></a>
                    </c:if>
                  </div>
                  <div class="top_behavior">
                    <span class="cnt">총<em>${rtotal }</em>건</span>
                  </div>
                  
                  
                  <ul class="rvw_list_area">
                  <c:forEach var="blist" items="${blist }">
                    <li>
                      <a href="reviewdetail.do?num=${blist.num }"><strong>${blist.mname }| ${blist.title }</strong></a>
                      <span class="user"><a href="#">${blist.id }</a> <em>${blist.reg_date }</em></span>          
   					</li>
   					</c:forEach>
                  </ul>
                  
                  
                 
					<%--
 					<div class="pagewrap">
						<c:if test="${total !=0 }">
							<jsp:include page="common/paging.jsp"></jsp:include>
						</c:if>
					</div> 
					--%>
					
                  </div>
                </div>
              </div>
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