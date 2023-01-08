<%@page import="util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookies cookies = new Cookies(request);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginCheck</title>
</head>
<body>
	<!-- 로그인 여부 검사하는 loginCheck jsp 파일 소스 코딩 -->
<%
	if(cookies.exists("AUTH")){
%>
		
		아이디 "<%=cookies.getValue("AUTH") %>"로 로그인한 상태입니다.
<%
	} else{
%>
	로그인하지 않은 상태입니다.
<%
	}
%>
	
	
	
	
	
	
</body>
</html>