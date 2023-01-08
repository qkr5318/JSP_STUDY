<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="org.slf4j.Logger"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>log4j 테스트를 위한 logtest jsp 소스 코딩</title>
</head>
<body>
	<div align="center">
		<h2>logtest.jsp</h2>
		<hr>
		로그 테스트 화면입니다. 콘솔 메세지와 C드라이브에 tmp 폴더 dailyout.log 파일에 
		로그가 생성 됩니다. 여기서, C드라이브에 tmp 폴더 dailyout.log 파일 경로는
		src 폴더에 있는 log4j.xml 파일에 있는 경로입니다.
		<%
			// 시스템 기본 로그를 통해 처리합니다.
			application.log("logtest.jsp:테스트 로그 메시지...", new IOException());
			Logger log = LoggerFactory.getLogger(this.getClass());
			log.info("info-jsp 파일에서 처리한 로그");
			log.warn("warn-jsp 파일에서 처리한 로그");
			
		%>
	</div>
</body>
</html>