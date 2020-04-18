<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<style>
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

.pagination li:hover:not(.active) a{background-color: #ddd;}

</style>
</head>
<body>
<nav>
	  <c:choose>
		<c:when test="${paging.numberOfRecords ne NULL and paging.numberOfRecords ne '' and paging.numberOfRecords ne 0}">
		<div class="text-center marg-top">
			<ul class="pagination">
				<c:if test="${paging.currentPageNo lt 6}">  											
					<li><a href="javascript:backPages();">&lt;</a></li>
				</c:if>
				<c:if test="${paging.currentPageNo gt 5}">  											
					<li><a href="javascript:goPage(${paging.prevPageNo})">&lt;</a></li>
				</c:if>
					<c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
		            <c:choose>
		                <c:when test="${i eq paging.currentPageNo}"> 
		                      <li class="active"><a href="javascript:goPage(${i})">${i}</a></li>
		                </c:when>
		                	<c:otherwise>
		                    <li><a href="javascript:goPage(${i})">${i}</a></li> 
							</c:otherwise>
						</c:choose>
					</c:forEach>
				<!-- 소수점 제거 =>-->
				<fmt:parseNumber var="currentPage" integerOnly="true" value="${(paging.currentPageNo-1)/5}"/>
				<fmt:parseNumber var="finalPage" integerOnly="true" value="${(paging.finalPageNo-1)/5}"/>
				<c:if test="${currentPage < finalPage}">
					<li><a href="javascript:goPage(${paging.nextPageNo})">></a></li>
				</c:if> 
			</ul>
		</div>
		</c:when>
	   </c:choose>
	  </nav>
</body>
</html>

 