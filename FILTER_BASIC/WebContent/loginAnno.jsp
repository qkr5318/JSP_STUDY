<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberId =request.getParameter("memberId");
	session.setAttribute("MEMBER", memberId);
%>    

<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>login.jsp 소스 코딩</title>
</head>
<body>
	   <!-- 
      	아이디를 입력하지 않고, 암호만 입력하고 로그인 버튼을 누르거나
	         또는 아이디와 암호를 넣지 않고 로그인 버튼을 누를 경우
	         즉, session에 'MEMBER' 속성이 존재하지 않을 경우 loginForm으로 넘어감.
	     
	         만약에 아이디가 입력되어 있다면(암호 없을 경우에도)
	     session에 'MEMBER' 속성이 존재하게 되기 때문에 boardList 내용이 나타남.
        -->
        
        <a href="<%= request.getContextPath()%>/boardAnno/boardListAnno.jsp">
        	지금 보이는 텍스트를 입력하시기 바랍니다.
        </a>

</body>
</html>