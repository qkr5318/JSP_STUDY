<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// Cookie 클래스는 쿠키를 삭제하는 기능을 별도로 제공하지 않습니다.
	// 대신, 유효시간을 0으로 지정해 준 후 응답 헤더에 추가하면,
	// 웹 브라우저가 관련 쿠키를 삭제하게 됩니다.
	Cookie[] cookies = request.getCookies();
	if(cookies != null && cookies.length > 0){
		for(int i = 0; i < cookies.length; i++){
			if(cookies[i].getName().equals("name")){
				Cookie cookie = new Cookie("name", "");
				cookie.setMaxAge(0); // 유효 시간을 0으로 지정해 줌
				response.addCookie(cookie);
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>c4_deleteCookie jsp</title>
</head>
<body>
		name 쿠키를 삭제합니다!
</body>
</html>
