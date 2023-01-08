<%@page import="java.util.TimeZone"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간대 목록 표시 listTimezones</title>
</head>
<body>
	
	<c:forEach var="id" items="<%=TimeZone.getAvailableIDs() %>">
		${id} <br>
	</c:forEach>



</body>
</html>