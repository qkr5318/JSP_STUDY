<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = (String) session.getAttribute("NAME");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getMemberInfo 소스코딩</title>
</head>
<body>
	<!-- 섹션 속성 정보를 읽어오는 getMemberInfo 소스 코딩 -->
	회원명 : <%= name %>
</body>
</html>