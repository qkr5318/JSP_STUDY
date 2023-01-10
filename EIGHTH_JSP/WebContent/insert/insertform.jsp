<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>item과 item_detail 테이블 레코드 정보 삽입 insertForm.jsp 소스 코딩</title>
</head>
<body>
	<form action="insert.jsp" method="post">
		<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="memberID" size="10"> </td>
			<td>암호</td>
			<td><input type="text" name="password" size="10"> </td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" size="10"> </td>
			<td>이메일</td>
			<td><input type="text" name="email" size="10"> </td>
		</tr>
		<tr>
			<td colspan="4"> <input type="submit" value="레코드 정보 삽입"> </td>
		</tr>
		</table>
	</form>
</body>
</html>