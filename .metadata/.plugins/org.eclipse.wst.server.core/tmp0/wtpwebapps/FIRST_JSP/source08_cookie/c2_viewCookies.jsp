<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>c2_viewCookies jsp 소스 코딩</title>
</head>
<body>
	쿠키 목록
	<br>
	<%
		// 쿠키 배열을 구합니다.
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length > 0){
			for(int i = 0; i < cookies.length; i++){
	%>
				<%= cookies[i].getName() %> =
				<%= // 앞서 인코딩해서 값을 저장했기 때문에 디코딩으로 값을 복호화 처리해 줍니다!
				    URLDecoder.decode(cookies[i].getValue(),"utf-8")%> <br>
	<%
			}
		} else {
	%>
			쿠키가 존재하지 않습니다!
	<%
		}
	%>

</body>
</html>