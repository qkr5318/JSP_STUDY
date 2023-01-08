<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// 세션의 로그아웃을 처리할 때에는 session.invalidate() 메서드를 사용합니다.
    	session.invalidate();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 세션 로그아웃을 처리하는 sessionLogout jsp 소스코딩 -->
	로그아웃 하셨습니다.
</body>
</html>