<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null && cookies.length > 0){
		for(int i = 0; i < cookies.length; i++){
			// name 쿠키인지 여부를 확인합니다. (name 쿠키의 존재 여부 확인)
			if(cookies[i].getName().equals("name")){
				// name 쿠키가 존재할 경우, 이름이 "name"인 Cookie 객체를
				// 새롭게 생성해서 응답 헤더에 추가해 줍니다.
				Cookie cookie = new Cookie("name", URLEncoder.encode("JSP 프로그래밍", "utf-8"));
				response.addCookie(cookie);
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>c3_modifyCookie jsp 소스 코딩</title>
</head>
<body>
		name 쿠키의 값을 변경합니다! <br>		
</body>
</html>


