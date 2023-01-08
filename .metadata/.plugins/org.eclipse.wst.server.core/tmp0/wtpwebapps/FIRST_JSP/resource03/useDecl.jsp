<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 10 * 25 =<%= multiply(10, 25)  %>
</body>
</html>
<%-- 선언부는 어느 곳에 위치하든 상관이없다 --%>
<%!
	public int multiply(int a, int b){
	int c = a * b;
	return c;
}

%>