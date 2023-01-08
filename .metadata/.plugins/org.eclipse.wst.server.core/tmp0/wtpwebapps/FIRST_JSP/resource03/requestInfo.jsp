<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	요청 정보 프로토콜 = 
	<%= request.getProtocol() %>
	<br> 요청 정보 전송 방식 =
	<%= request.getMethod() %>
	<br> 요청 URI
	<%= request.getRequestURI() %>
	<br> 컨텍스트 경로 =
	<%= request.getContextPath() %>
	<br> 서버 이름 =
	<%= request.getServerName() %>
	<br> 서버 포트 =
	<%= request.getServerPort() %>


</body>
</html>