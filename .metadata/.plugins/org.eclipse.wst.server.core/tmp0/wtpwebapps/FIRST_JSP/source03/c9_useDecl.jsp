<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--선언부(declaration) --%>
<%!
	public int multiply(int a, int b){
	int c = a * b;
	return c;
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언부를 사용한 두 정수값의 곱  표현</title>
</head>
<body>
	10 * 25 =
	<%--표현식 --%>
	<%= multiply(10, 25) %>
	입니다.


</body>
</html>