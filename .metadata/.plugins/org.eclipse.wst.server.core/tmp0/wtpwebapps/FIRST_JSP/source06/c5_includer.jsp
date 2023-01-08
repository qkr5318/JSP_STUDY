<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>includer 소스코딩</title>
</head>
<body>
	<%
		int number = 10;
	%>
	<%@ include file="/source06/include.jspf"	 %>
	
	공통변수 DATAFOLDER = "<%=dataFolder %>"
</body>
</html>