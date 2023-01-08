<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>uploadForm jsp 소스 코딩</title>
</head>
<body>
	<!-- 파일 업로드 창에서 파일을 업로드 할 때 <form> 태그의 encType 속성은
		반드시 multipart/form-data로 지정해야 합니다.  -->
	<!--  upload.do는 서블릿에 요청해 파일을 업로드합니다. -->
	<form action="${contextPath}/upload.do" method="post" enctype="multipart/form-data">
		파라미터1 : <input type="text" name="param1"><br><hr>
		파일1 : <input type="file" name="file1"><br><hr>
		
		파라미터2 : <input type="text" name="param2"><br><hr>
		파일2 : <input type="file" name="file2"><br><hr>
		<input type="submit" value="쿼카!">
	</form>
</body>
</html>