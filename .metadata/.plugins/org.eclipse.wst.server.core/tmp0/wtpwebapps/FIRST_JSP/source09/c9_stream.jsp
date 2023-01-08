<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ;'' 객체 표현 안함 -->
	${list = [1, 2, 3, 4, 5];'' }
	<br> <br> <hr>
	${list = [1, 2, 3, 4, 5]}
	<br> <br> <hr>
	${list.stream().sum()}
	
</body>
</html>