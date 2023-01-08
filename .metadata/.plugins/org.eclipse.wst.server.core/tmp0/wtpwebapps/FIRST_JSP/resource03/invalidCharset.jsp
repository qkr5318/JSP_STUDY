<%@page import="java.util.Date"%>
<%-- 
<%@ page language="java" contentType="text/html; charset=iso-8859-1"%>
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Date now = new Date();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	현재 시간 : <%= now %>
</body>
</html>