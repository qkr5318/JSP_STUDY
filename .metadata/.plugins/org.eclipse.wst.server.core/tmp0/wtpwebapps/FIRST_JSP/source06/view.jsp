<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view 소스 코딩 select.jsp와 연관</title>
</head>
<body>
	<%
		String code = request.getParameter("code");
		String viewPageURI = null;
		
		if(code.equals("A")){
			viewPageURI = "/source06/viewModule/a.jsp";
		} else if(code.equals("B")){
			viewPageURI = "/source06/viewModule/b.jsp";
		}else if(code.equals("C")){
			viewPageURI = "/source06/viewModule/c.jsp";
		}
	%>
		<jsp:forward page="<%= viewPageURI %>"/>
</body>
</html>