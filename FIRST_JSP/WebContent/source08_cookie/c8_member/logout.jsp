<%@page import="util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// name이 AUTH인 쿠키의 유효 시간을 0으로 지정합니다.
	response.addCookie(Cookies.createCookie("AUTH", "", "/", 0));
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
</head>
<body>
	로그아웃 하셨습니다.
</body>
</html>