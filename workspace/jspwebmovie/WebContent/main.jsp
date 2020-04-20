<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <!-- 무비차트 -->
		<jsp:include page="/main2movie.jsp"></jsp:include>

        <!-- 리뷰 -->
        <jsp:include page="/main3review.jsp"></jsp:include>
    </div>


</section>
<footer>
<jsp:include page="/common/footer.jsp"></jsp:include>
</footer>
</body>
</html>