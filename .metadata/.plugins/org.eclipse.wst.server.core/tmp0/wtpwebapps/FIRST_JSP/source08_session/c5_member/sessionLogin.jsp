<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session 기본 객체의 속성에 로그인 성공 정보를 저장하는 sessionLogin 소스 코딩을 합니다.
	String  id = request.getParameter("id");
	String password = request.getParameter("password");
	//만약에(if) id와 password 값이 같다면 로그인에 성공하게 처리해 주고,
	// 그러지 않으면 (else) 로그인에 실패하게 처리해 줍니다.
	// session 기본 객체의 MEMBERID 속성을 사용해서 id 파라미터의 고르인 상태를 저장합니다.
	if(id.equals(password)){
		session.setAttribute("MEMBERID", id);
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionLogin.jsp 소스코딩</title>
</head>
<body>
	로그인에 성공했습니다.
</body>
</html>
<%
	} else{
		//로그인 실패 시
		
%>    
	<Script>
		alert("로그인에 실패했습니다.")
		history.go(-1)// 처음 화면으로 이통시켜 줍니다.
	</Script>

<%
}
%>