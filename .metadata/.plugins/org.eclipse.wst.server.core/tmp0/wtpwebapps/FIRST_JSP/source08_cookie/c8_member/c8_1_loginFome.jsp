<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소스코딩</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/source08_cookie/c8_member/login.jsp" method="get">
	아이디 : <input type="text" name="id" size="10">
	암호 : <input type="password" name="password" size="10">
	<input type="submit" value="로그인">
	</form>


</body>
</html>