<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>게시글 삭제</title>
</head>
<body>
<form action="delete.do" method="post">
<input type="hidden" name="no" value="${delReq.articleNumber}">
<p>
선택하신 게시글을 삭제하시겠습니까?
<br><br>
<input type="submit" value="글 삭제 진행">
<a href="list.do">[목록으로 돌아가기]</a>
</p>
</form>
</body>
</html>