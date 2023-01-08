<%@page import="util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.addCookie(Cookies.createCookie("name", "장나라"));

	// -1 의미는 cookie.setMaxAge(-1); 와 같은 의미이며
	// maxAge 생존 주기 설정의 유효 시간을 -1로 설정 처리함.
	// 즉, 브라우저 닫기 전까지 쿠키 정보를 유지하다가
	// 브라우저를 닫으면 쿠키 정보를 초기화(삭제) 처리함.
	response.addCookie(Cookies.createCookie("id", "jangnara", "/source08_cookie", -1));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>c6_makeCookieUsingCookies jsp 소스 코딩</title>
</head>
<body>

	util 패키지에 있는 Cookies 클래스를 활용하여 쿠키를 생성했습니다!

</body>
</html>