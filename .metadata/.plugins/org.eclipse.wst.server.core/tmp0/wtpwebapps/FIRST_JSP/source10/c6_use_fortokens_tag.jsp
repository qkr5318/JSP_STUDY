<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fortokens tag</title>
</head>
<body>
	콤마와 점을 구분자로 사용 : <br>
	<!-- 아래의 delims 의미는 구분자인 ,와 .을 제외한
	 	문자열 값을 token 변수에 담아줍니다. -->
	 	<c:forTokens items="빨강색, 주황색, 노란색, 초록색, 파랑색, 남색, 보라색" delims=",." var="token">
	 		${token}
	 	</c:forTokens>

</body>
</html>