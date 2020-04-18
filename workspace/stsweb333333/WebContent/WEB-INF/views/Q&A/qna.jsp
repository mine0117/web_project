<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="/common/common.css">
  <link rel="stylesheet" href="/css/Q&A.css">

  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
  <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
 
  <title>Q&A</title>
</head>
<body>
<div class="center">
    <header class="header ">
      <div class="top">
        <!-- 로고와 제목 -->
        <div class="title">
          <img class="logo" src="common/image/logo.gif" alt="logo">
          <h2>서울맛집찾기</h2>
        </div>

        <!-- 검색창 -->
        <div class="search">
            <input class="searchtext" type="text"/>
            <button type="button">검색</button>
        </div>
      </div>
      <!-- 공통 네비게이션 -->
      <nav>
        <div class="nav">
          <ul class="">
            <li><a href="#">지역별맛집</a></li>
            <li><a href="#">테마별맛집</a></li>
            <li><a href="#">예약맛집</a></li>
            <li><a class="active" href="#">Q & A</a></li>
            <button type="button" class="login">로그인</button>
            <button type="button" class="login">회원가입</button>
          </ul>
        </div>
      </nav>
    </header>

    <section>
      <!-- 탭메뉴 -->
      <div class="p">
      <form action="qnasearch.do" method="get">
        <div class="Q_search">
          <select name="stype">
            <option value="q_title">제목</option>
            <option value="q_id">작성자</option>
          </select>
          <input type="text" name="id" id="id">
          <button type="submit">검색</button>
        </div>
       </form>
	
        <div class="Q_btndiv">
          <button class="Q_btn" onclick="location.href='qna_write.do'">글작성</button>
        </div>
      <!-- 탭컨텐츠 -->
      <div class="tab_content">
        <table class="Q_table">
          <colgroup>
            <col style="width:10%">
            <col style="width:60%">
            <col style="width:10%">
            <col style="width:10%">
            <col style="width:10%">
          </colgroup>
          <tr>
            <th>No</th>
            <th>SUBJECT</th>
            <th>NAME</th>
            <th>DATE</th>
            <th>VIEW</th>
          </tr>
          <tr class="T_notice">
            <td></td>
            <td class="Q_left" onclick="location.href='qna_manyanswer.do'">자주하는질문</td>
            <td>관리자</td>
            <td>2007-05-17</td>
            <!--이거 안나온다 조회수  -->
            <td><c:out value="${q_hits }"/></td>
          </tr>
          <c:choose>
	          <c:when test="${fn:length(list )>0}">
		          <c:forEach var="list" items="${list }" varStatus="num">
			          <tr>
			            <td>${list.q_num }</td>
			            <td class="Q_left" onclick="location.href='qna_detail.do?q_num=${list.q_num }'">${list.q_title }</td>
			            <td>${list.q_id }</td>
			            <td>${list.q_date }</td>
			            <td><c:out value="${list.q_hits }"/></td>
			          </tr>
		          </c:forEach>
	          </c:when>
	          <c:otherwise>
	          	<tr>
	          		<td colspan="5" rowspan="5">조회된결과가없습니다.</td>
	          	</tr>
	          </c:otherwise>
          </c:choose>
          </form>
          <!-- <tr>
            <td>1</td>
            <td class="Q_left"><img src="image_detail/icon_re.png"><a href="Q&A_detail.html">학생1님 답변드립니다</td>
            <td>관리자</td>
            <td>2015-03-01</td>
            <td>200</td>
          </tr>
         
          <tr>
            <td>1</td>
            <td class="Q_left">이거는어떻게해야하나요</td>
            <td>학생1</td>
            <td>2015-03-01</td>
            <td>200</td>
          </tr>
          <tr>
            <td>1</td>
            <td class="Q_left"><img src="image_detail/icon_re.png">학생1님 답변드립니다</td>
            <td>관리자</td>
            <td>2015-03-01</td>
            <td>200</td>
          </tr>
          <tr>
            <td>1</td>
            <td class="Q_left">이거는어떻게해야하나요</td>
            <td>학생1</td>
            <td>2015-03-01</td>
            <td>200</td>
          </tr>
          <tr>
            <td>1</td>
            <td class="Q_left"><img src="image_detail/icon_re.png">학생1님 답변드립니다</td>
            <td>관리자</td>
            <td>2015-03-01</td>
            <td>200</td>
          </tr>
          <tr>
            <td>1</td>
            <td class="Q_left"><a href="">이거는어떻게해야하나요</a></td>
            <td>학생1</td>
            <td>2015-03-01</td>
            <td>200</td>
          </tr> -->
        </table>
        <div class="pagination">
          <a href="#">&laquo;</a>
          <a href="#" class="active">1</a>
          <a href="#">2</a>
          <a href="#">3</a>
          <a href="#">4</a>
          <a href="#">5</a>
          <a href="#">&raquo;</a>
        </div>
    </div>
  </div>
</section>
</div>
</body>
</html>