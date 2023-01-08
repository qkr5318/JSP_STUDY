<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>date tag</title>
</head>
<body>
	<c:set var="now" value="<%= new Date() %>"/>
	<fmt:formatDate value="${now}" type="date" dateStyle="full"/>
	<br> <hr>
	<fmt:formatDate value="${now}" type="date" dateStyle="short"/>
	<br> <hr>
	<fmt:formatDate value="${now}" type="time"/>
	<br> <hr>
	<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/>
	<br> <hr>
	<fmt:formatDate value="${now}" pattern="z a h : mm"/>
	<br> <hr>
</body>
</html>