<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%-- 
<%@ page language="java" contentType="text/html; charset=iso-8859-1"%>
--%>
<%
	Date now = new Date();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 시간</title>
</head>
<body>

	현재 시간 =<%= now %>

</body>
</html>