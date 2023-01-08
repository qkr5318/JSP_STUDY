<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" scope="request" class="source07.member.MemberInfo"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useObject 소스 코딩</title>
</head>
<body>
	<%= member.getName()%> (<%= member.getId() %>) 회원님! 
	 안녕하세요
</body>
</html>