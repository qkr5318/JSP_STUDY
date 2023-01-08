<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 다운로드 요청하는 웹 페이지인 first jsp 소스코딩</title>
</head>
<body>
	<form action="result.jsp" method="post">
		<!--  다운로드할 파일 이름을 매개변수로 전달합니다. -->
		<input type="hidden" name="param1" value="flower_01.jpg">
		<br>
		<input type="hidden" name="param2" value="flower_02.jpg">
		<br>
		<input type="submit" value="쿼카!">
	</form>
	
</body>
</html>