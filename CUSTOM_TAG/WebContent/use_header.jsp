<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>use_header.jsp 소스 코딩</title>
</head>
<body>
	
	<tf:now/> <br> <hr>
	<tf:header title="텍스트 제목"/> <br> <hr>
	<tf:header title="level 2 표현입니다." level="2"/> <br> <hr>
	<tf:header title="${'EL 제목' }" level="3"/>
	<tf:header title='<%= "표현식 제목" %>'/>
	
	
</body>
</html>