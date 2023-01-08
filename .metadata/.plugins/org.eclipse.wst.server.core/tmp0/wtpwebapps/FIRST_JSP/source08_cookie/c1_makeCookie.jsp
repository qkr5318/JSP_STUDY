<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 추가할 쿠키 정보를 담고 있는 Cookie 객체를 생성합니다.
	// URLEncoder 클래스를 사용해서 쿠키 값을 인코딩합니다.
	Cookie cookie = new Cookie("name", URLEncoder.encode("장나라", "utf-8"));
	// 응답 데이터에 쿠키를 추가합니다.
	response.addCookie(cookie);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>c1_makeCookie jsp 소스 코딩</title>
</head>
<body>

	<%= cookie.getName() %> 쿠키의 값 = "<%= cookie.getValue() %>"

</body>
</html>