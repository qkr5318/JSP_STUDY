<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>이름 변경 폼 updateForm.jsp 소스 코딩</title>
</head>
<body>
	<form action="update.jsp" method="get">
		<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="MEMBERID" size="10"> </td>
			<td>이름</td>
			<td><input type="text" name="NAME" size="10"> </td>
		</tr>
		<tr>
			<td colspan="4"> <input type="submit" value="변경"> </td>
		</tr>
		</table>
	</form>
</body>
</html>