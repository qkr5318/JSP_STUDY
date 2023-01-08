<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		java.util.Calendar cal = java.util.Calendar.getInstance(); 
	%>
	
	오늘은
	<%= cal.get(java.util.Calendar.YEAR) %> 년
	<%= cal.get(java.util.Calendar.MONTH) + 1 %> 년
	<%= cal.get(java.util.Calendar.DATE) %> 년



</body>
</html>