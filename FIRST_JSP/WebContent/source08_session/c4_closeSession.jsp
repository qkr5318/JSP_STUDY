<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션을 유지할 필요가 없어지면 session.invalidate() 메서드를 사용해서
	// 세션을 종료합니다. 세션을 종료하면  현재 사용중인 session 기본 객체를
	// 삭제하고, session 기본 객체에 저장했던 속성 목록도 함께 삭제 처리합니ㅏㄷ.
	session.invalidate();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>close Session</title>
</head>
<body>
 	<!-- 세션 종료를 처리하는 closeSession.jsp 소스코딩 -->
 	세션을 종료했습니다.
</body>
</html>