<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("name", "장나라");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ELObject 소스코드</title>
</head>
<body>

	 요청 URI : ${pageContext.request.requestURI } 
	 <br>
	 request의 name 속성 : ${requestScope.name}
	 <br>
	 code 파라미터 : ${param.code }

</body>
</html>