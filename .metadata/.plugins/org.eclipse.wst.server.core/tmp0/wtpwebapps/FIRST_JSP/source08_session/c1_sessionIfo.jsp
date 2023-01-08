<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  세션을 사용한다고 지정합니다. session 속성의 기본값은 true이므로
아래 코드를 생략해도 세션을 사용합니다. 세션이 존재하지 않으면 새로 생성합니다. -->
<%@ page session="true" %>
<%
	Date time = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionInfo</title>
</head>
<body>
	<!-- 세션 ID를 화면으로 출력합니다. -->
	세션 ID : <%= session.getId() %>
	<br>
	<%
		// 세션의 생성 시간을 Date 객체인 time에 저장합니다.
		time.setTime(session.getCreationTime());
	%>
	<!-- 세션의 생성 시간을 화면으로 출력합니다. -->
	세션 생성 시간 : <%= formatter.format(time) %>
	<br>
	<%
		time.setTime(session.getLastAccessedTime());
	%>
	<!-- 세션의 마지막 접근 시간을 화면으로 출력합니다. -->
	최근의 세션에 접근한 시간 : <%= formatter.format(time) %>
	<br>


</body>
</html>