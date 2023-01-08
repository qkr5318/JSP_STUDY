<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" scope="request" class="source07.member.MemberInfo"></jsp:useBean>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>makeObject 소스 코딩</title>
</head>
<body>
<%
	member.setId("jangnara");
	member.setName("jangnara");
%>
<jsp:forward page="/source07/useObject.jsp"></jsp:forward>
</body>
</html>