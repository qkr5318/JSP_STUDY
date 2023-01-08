<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie cookie = new Cookie("oneh", "1time");
	// 60초(1분) * 60 = 1시간으로 유효시간을 셋팅 처리함
	cookie.setMaxAge(60*60);
	response.addCookie(cookie);
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>c5_makeCookieWithMaxAge jsp 소스 코딩</title>
</head>
<body>
	유효시간이 1시간인 oneh 쿠키를 생성했습니다!
</body>
</html>