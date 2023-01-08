<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>basic 기본 문법</title>
</head>
<body>
<%
	String name = "장나라";
%>
	<%=name %>
	<br>
	<%
		request.setAttribute("name", "김다미");
	%>
	${name}
	<br>
	${"10"+ 1}
	<br>
	<%
		request.setAttribute("title","JSP프로그래밍");
	%>
	${"문자"+= "열" += "연결" }
	<br>
	${"제목: " += title }
	<br>
	<%= 10 + "은 정수, " + 10.1 + "은 실수" %>
	<br>
	${10}은 정수, ${10.1}은 실수
	<br>
	<%= "숫자 = " + 10 %>
	<br>
	${"숫자= " += 10}
	<br>
	<!-- 비교 선택 연산자 -->
	<br>
	${(10>5) ? 5 : 7}
	<br>
	${(10<5) ? 5 : 7}
</body>
</html>