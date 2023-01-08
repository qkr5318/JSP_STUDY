<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String  memberId = (String)session.getAttribute("MEMBERID");
	boolean login = memberId == null ? false : true;
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionLoginCheck</title>
</head>
<body>
	<!-- 로그인 여부를 검사하는 sessionLoginCheck jsp 소스 코딩 -->
	<%
		if(login){
	%>		
			아이디"<%= memberId %>"로 로그인한 상태입니다.
	<%			
		} else{
	%>		
			로그인하지 않은 상태입니다.
	<%		
		}
	%>
</body>
</html>