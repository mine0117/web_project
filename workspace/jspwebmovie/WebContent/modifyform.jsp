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
<jsp:include page="/common/nav.jsp">
	<jsp:param name="dname" value="${memvo.dname }"/>
</jsp:include>
</header>
<section>
    <div class="content-wrap">
      <article id="joinform">
        <div class="join_content">
				  <div class="join_form">
            <form class="form-horizontal" id="join_form" method="post" action="/modify.do?id=${memvo.id }">
              <fieldset>
                <legend>내 정보</legend>
                  <div class="form-group">
                    <label for="inputID" class="col-sm-2 control-label">ID</label>
                    <div class="col-sm-10">
                      <input type="text" name="id" class="form-control" id="inputID" value="${memvo.id }" readonly>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 control-label">Password</label>
                    <div class="col-sm-10">
                      <input type="password" name="pwd" class="form-control" id="inputPassword" value="${memvo.pwd }">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Name</label>
                    <div class="col-sm-10">
                      <input type="text" name="dname" class="form-control" id="inputName" value="${memvo.dname }">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">E-mail</label>
                    <div class="col-sm-10">
                      <input type="email" name="email" class="form-control" id="inputEmail" value="${memvo.email }">
                    </div>
                  </div>
                  <button type="submit" class="btn btn-default btn-lg btn-block">수정하기</button>
                  <button onclick="location.href='delete.do?id=${memvo.id }'" class="btn btn-default btn-lg btn-block">탈퇴하기</button>
                </fieldset>
              </form>
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