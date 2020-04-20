<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

        <!-- 무비차트 -->
        <article id="movie">
          <div class="slide">
            <div class="mv_main">
              <div class="flick_view_area flick-view">
                <div class="flick-container">
                  <ul class="flick-ct home_list">
                  <!-- 무비정보 -->
                  
                  <c:forEach var="mlist" items="${mlist}" begin="1" end="20" step="1">
                    <li class="item1">
                      <div class="obj_off">
                        <a href="moviedetail.do?mid=${mlist.mid }">
                          <span class="ico_rating_${mlist.rank_css}">${mlist.rank}</span>
                          <span class="mask"></span>
                          <img src="images/poster/${mlist.mid}.jpg" alt="${mlist.mname}" width="125" height="179" onerror="this.src='/images/dft_img125x179.png'">
                          <span class="baseplate r">
                          <c:set var="TextValue" value="${mlist.str_star}"/>
                            <span class="rank_star l"><span class="star_off"><em>별점 - 총 10점 중</em></span><span class="star_on" style="width:${mlist.str_star*10 }%"><em>${mlist.str_star } 점</em></span></span>
                            <strong class="l"><span class="char sc_num${fn:substring(TextValue,0,1) }"><em>${fn:substring(TextValue,0,1) }</em></span><span class="char sc_dot"><em>.</em></span><span class="char sc_num${fn:substring(TextValue,2,3) }"><em>${fn:substring(TextValue,2,3) }</em></span><span class="char sc_num${fn:substring(TextValue,3,4) }"><em>${fn:substring(TextValue,3,4) }</em></span></strong>
                          </span>
                        </a><!-- N=a:run.da,r:1,i:162249 -->
                      </div>
                    </li>
                    </c:forEach>
                    
                  </ul>
                </div>
              </div>
            </div>
            <button class="prev">
              <i class="fa fa-chevron-left" aria-hidden="true"></i>
              <span class="skip">이전</span>
            </button>
            <button class="next">
              <i class="fa fa-chevron-right" aria-hidden="true"></i>
              <span class="skip">다음</span>
            </button>
          </div>
        </article>

        <script>

        slidetimer();
        // var current=0;
        var $interval;
        function slidetimer(){
          var $interval=setInterval(function(){slide()},3000);
          }
        function slide(){
          $("#movie ul").animate({left:"-=125px"},800,function(){
            $(this).css({"left":"0"});
            $("#movie ul").children("li").eq(9).after( $("#movie ul").children("li").eq(0) );
            $("#movie ul").children("li").eq(19).after( $("#movie ul").children("li").eq(10) );
            $("#movie ul").children("li").eq(29).after( $("#movie ul").children("li").eq(20) );
          });
         // current++;
         // if(current==5)current=0;
        }
        function slideprev(){
          $(document).on("click",".prev",function(){
            //$("#movie ul").animate({left:"0"});
            //$(this).css({"left":"0"});
            $("#movie ul").children("li").eq(0).before( $("#movie ul").children("li").eq(9) );
            $("#movie ul").children("li").eq(10).before( $("#movie ul").children("li").eq(19) );
            $("#movie ul").children("li").eq(20).before( $("#movie ul").children("li").eq(29) );
            //$("#movie li").appendTo("#movie ul");
            //$("#movie li").append( $("#movie ul").children("#movie li").eq(0) );
            //$( $("#movie ul").children("#movie li").eq(0) ).appendTo("#movie ul")
            //$("#movie ul").append( $("#movie ul").children("#movie li").eq(0) );
            //current++;
            //if(current==5)current=0;
          });
        }
        slideprev();

        function slidenext(){
			$(document).on("click",".next",function(){
           //$("#movie ul").animate({left:"0"});
          //$(this).css({"left":0});
          $("#movie ul").children("li").eq(9).after( $("#movie ul").children("li").eq(0) );
          $("#movie ul").children("li").eq(19).after( $("#movie ul").children("li").eq(10) );
          $("#movie ul").children("li").eq(29).after( $("#movie ul").children("li").eq(20) );
  /*         $("li").appendTo("ul");
          $("li").append( $("ul").children("li").eq(0) );
          $( $("ul").children("li").eq(10) ).prependTo("ul")
          $("ul").append( $("ul").children("li").eq(0) ); */
          //current++;
          //if(current==5)current=0;
        });
        }
        slidenext();

        </script>