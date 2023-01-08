<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 아래와 같이 함수를 정의한 태그 라이브러리를 지정합니다.
	태그 라이브러리에 대한 접두어를 "elfunc"로 지정합니다. -->
<%@ taglib prefix="elfunc" uri="/WEB-INF/tlds/el-function.tld" %>
<%
	//price 속성에 12345 값을 셋팅해 줍니다.
	request.setAttribute("price", 12345);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewNumber</title>
</head>
<body>
	<!-- EL 정적 static 함수 호출 viewNumber jsp 소스 코딩 활용 -->
	<!-- EL에서 prefix 값인 elfunc와 TLD파일의 name 태그에서
		지정한 formatNumber를 사용하여 속성과 값을 처리합니다. -->
	가격은 <b>${ elfunc:formatNumber(price,'#,##0dnjs')}</b> 입니다.


</body>
</html>