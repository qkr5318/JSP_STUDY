<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("utf-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>output jsp 소스코딩</title>
</head>
<body>
	<!--표현식  -->
	<!-- 
	이름 :
	-->
	<%--
	 <%=request.getParameter("name") %>입니다. <br>
	 --%>
	 <!-- 
	취미 :
	 -->
	 <%-- 
	 <%=request.getParameter("hobby") %>입니다.
	 --%>
	 
	 <!-- EL표현언어 -->
	 이름 : ${param.name},
	 취미 : ${param.hobby} 입니다.
	
	
	
</body>
</html>