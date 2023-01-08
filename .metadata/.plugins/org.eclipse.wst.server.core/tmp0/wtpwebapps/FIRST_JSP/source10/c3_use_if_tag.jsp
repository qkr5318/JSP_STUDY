<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>use_if_tag</title>
</head>
<body>
	<c:if test="true">
	무조건 수행 <br> 
	</c:if>
	
	<c:if test="${param.name == 'jangnara' }">
	name 파라미터의 값이 ${param.name} 입니다. <br>
	</c:if>
	
	<c:if test="${21 <= param.age }">
	당신의 나이는 21세 이상입니다.
	</c:if>
	
	<c:if test="${21 > param.age }">
	당신의 나이는 21세 미만입니다.
	</c:if>

</body>
</html>