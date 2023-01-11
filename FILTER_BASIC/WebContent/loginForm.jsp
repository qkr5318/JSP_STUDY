<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>loginForm.jsp 소스 코딩</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/login.jsp" method="get">
		아이디 <input type="text" name="memberId">
		암호 <input type="password" name="password">
		<input type="submit" value="로그인">
	</form>
</body>
</html>