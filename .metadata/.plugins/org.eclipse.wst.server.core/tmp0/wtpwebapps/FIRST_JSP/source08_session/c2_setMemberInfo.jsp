<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션에 값을 저장할 때는 속성을 사용합니다.
	// 속성에 값을 저장하려면 setAttribute() 메서드를 사용하고,
	// 속성값을 읽으려면 getAttribute() 메서드를 사용합니다.
	// 사용자 정보 중에 회원 아이디와 이름을 저장하는 jsp 소스 코딩을 해봅니다.
	session.setAttribute("MEMBERID", "jangnara");
	session.setAttribute("NAME", "장나라");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 세션에 속성 정보를 저장하는 setMemberInfo 소스 코딩 -->
	세션에 정보를 저장 했습니다.


</body>
</html>