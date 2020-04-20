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
    <article id="joinform">
        <div class="join_content">
		  <div class="join_form">
            <form class="form-horizontal" id="join_form" method="post" action="/login.do">
              <fieldset>
                <legend>로그인</legend>
                  <div class="form-group">
                    <label for="inputID" class="col-sm-2 control-label">ID</label>
                    <div class="col-sm-10">
                      <input type="text" name="id" class="form-control" id="inputID" placeholder="아이디를 입력하세요">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 control-label">Password</label>
                    <div class="col-sm-10">
                      <input type="password" name="pwd" class="form-control" id="inputPassword" placeholder="비밀번호를 입력하세요">
                    </div>
                  </div>
                  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <a href="joinform.do">회원가입</a>
				    </div>
			 	 </div>
                  <button type="submit" class="btn btn-default btn-lg btn-block">로그인</button>
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