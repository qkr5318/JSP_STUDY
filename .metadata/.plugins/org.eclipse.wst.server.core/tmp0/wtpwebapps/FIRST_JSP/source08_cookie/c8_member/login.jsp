<%@page import="util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    
    if(id.equals(password)){
    	// ID와 암호가 같으면 로그인에 성공한 것으로 처리합니다.
    	// -1 의미는 cookie.setMaxAge(-1);와 같은 의미이며
    	// maxAge 생존 주기 설정의 유효 시간을 -1로 설정 처리함
    	// 즉, 브라우저 닫기 전까지 쿠키 정보를 유지하다가
    	// 브라우저를 닫으면 쿠키 정보를 초기화(삭제) 처리함
    	response.addCookie(Cookies.createCookie("AUTH", id, "/", -1));
    	%>
    	
    	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	로그인에 성공했습니다.
</body>
</html>
<% 
    } else{
    	//로그인 실패시
 %>   	
 
 		<script>
    	alert("로그인에 실패했습니다.");
    	history.go(-1);// 처음화면으로 이동시켜줌
    	</script>

<%
    }
%>