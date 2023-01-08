<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = request.getParameter("memberId");
	String pw = request.getParameter("memberPw");
	if(id != null && id.equals("gamst") && pw.equals("1234")){
		response.sendRedirect("index.jsp");
	}else{
		


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 	잘못된 아이디 입니다.
</body>
</html>
<%
	}
%>