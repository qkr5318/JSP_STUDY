<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>multipart_form</title>
</head>
<body>
	<!-- 웹 브라우저 파일 업로드 시 multipart/form-data 인코딩 방식의 데이터를
		웹 서버에 전송 처리해 줍니다. -->
		<form action="upload" method="post" enctype="multipart/form-data">
			text1 : <input type="text" name="text1"> <br> <hr>
			file1 : <input type="file" name="file1"> <br> <hr>
			file2 : <input type="file" name="file2"> <br> <hr>
			<input type="submit" value="전송">		
		</form>
</body>
</html>