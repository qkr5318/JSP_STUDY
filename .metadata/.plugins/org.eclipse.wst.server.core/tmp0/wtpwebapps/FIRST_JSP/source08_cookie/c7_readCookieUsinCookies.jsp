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
<title>c7_readCookieUsinCookies jsp 소스 코딩</title>
</head>
<body>

	name 쿠키 = <%= cookies.getValue("name") %>
	<br>
	<%
		if(cookies.exists("id")){
	%>
			id 쿠키 = <%= cookies.getValue("id") %>
			<br>
	<%
		}
	%>

</body>
</html>

