<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--<%
	request.setCharacterEncoding("utf-8");
%> 
jsp에서 요청 파라미터의 글자를 올바르게 처리하기 위한 캐릭터 인코딩 설정
jsp 페이지가 여러가지 일때 위 소스 코드를 추가해야하기 때문에 동일한 코드가 중복해서 들어가면
좋은 방법이 아니다. web.xml 파일 filter-name에   encodingFilter를 설정해주고
모든 페이지에 사용할 수 있게 url 패턴에 /*로 지정해주고 
경로를 CharacterEncodingFilter 클래스를 설정해 주면 모든 페이지에서 사용이 가능하여 위
소스코드를 기재하지 않아도 된다.
	-->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>c2_readParameterWithTry jsp 소스 코딩 : 파라미터 출력</title>
</head>
<body>

	name 파라미터 값 :
	<%
		try{
	%>
	<%= request.getParameter("name").toUpperCase() %>
	<%		
		} catch(Exception ex){
	%>
			name 파라미터가 올바르지 않습니다!
	<%
		}
	%>

</body>
</html>