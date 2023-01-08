<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useChoosetag</title>
</head>
<body>
<!-- java에 if-else문과 같다 when이 if else가 otherwise와 같은 기능 -->
	<ul>
		<c:choose>
			<c:when test="${param.name=='jangnara' }">
				<li>당신의 이름은 ${param.name }입니다.
			</c:when>
			<c:when test="${param.age>=21 }">
				<li>당신은 21세 이상입니다.
			</c:when>
			<c:otherwise>
				<li>당신은 'jangnara'가 아니고 21세 이상이 아닙니다.
			</c:otherwise>			
		</c:choose>
	</ul>
</body>
</html>