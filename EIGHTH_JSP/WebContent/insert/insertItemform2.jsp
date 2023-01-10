<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>MEMBER 테이블 레코드 정보 삽입 insertForm.jsp 소스 코딩</title>
</head>
<body>
	<form action="insertItem.jsp" method="post">
		<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" size="10" placeholder="숫자형의  id값을 입력해 주시기 바랍니다"> </td>
		
		</tr>
		
		<tr>
			<td colspan="4"> <input type="submit" value="아이디 정보 삽입"> </td>
		</tr>
		</table>
	</form>
</body>
</html>