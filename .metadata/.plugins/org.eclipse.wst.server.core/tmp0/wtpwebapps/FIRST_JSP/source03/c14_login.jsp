<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--
     폼을 따로 만들 필요 없이 주소창에 ?memberId=jananara&memberPw=1234입력하고 페이지 너머 가는거 확인후 나중에 폼을 만들어도 된다
    예) http://localhost:9005/FIRST_JSP/source03/c14_login.jsp?memberId=jangnara&memberPw=1234 --%>
<%
	String id = request.getParameter("memberId");
	String pw = request.getParameter("memberPw");
	if(id != null && id.equals("jangnara") && pw.equals("1234")){
		response.sendRedirect("index.jsp");
	}else{
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인에 실패 화면 표현</title>
</head>
<body>
	잘못된 아이디 입니다.
</body>
</html>
<% 
	}
%>	