<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select 소스 코딩</title>
</head>
<body>
	* 웹 어플리케이션 컨텍스트 경로 : <%= request.getContextPath() %>
	<br>
	<br>
	<form action="<%=request.getContextPath()%>/source06/view.jsp">
	보고 싶은 페이지 선택 :
	<select name="code">
		<option value="A">A 페이지 </option>
		<option value="B">B 페이지 </option>
		<option value="C">C 페이지 </option>
	</select>
	<input type="submit" value="이동">
	</form>
</body>
</html>