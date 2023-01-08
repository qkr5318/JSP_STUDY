<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
 pageEncoding="UTF-8"%>
<%
 request.setCharacterEncoding("utf-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 파라미터 출력 JSP 소스 코딩</title>
</head>
<body>
	<b>request.getParmeter() 메서드 사용</b>
	<br>name 파라미터 =
	<%= request.getParameter("name") %>
	<br>address 파라미터 =
	<%= request.getParameter("address") %> <br>
	
	<b>request.getParameter() 메서드 사용</b> <br>
	<%-- values 복수 여러개를 담을때 getParameterValues() 사용
		<% %> 스크립트릿 자바코드를 사입하기 위한 태그 기존 자바언어를 사용할 수 있음 
		<%= %>표현식 변수 또는 메소드 결과값을 출력
			  자바 코드를 삽입하는 것보다 더 간단하게 출력가능
			  변수나 메소드를 사용할 때 세미콜론(;)을 사용하지 않음 
	 --%>
	<%
		String[] values = request.getParameterValues("pet");
		if(values != null){
			for(int i = 0; i < values.length; i++){
	%>
				<%= values[i] %>
	<%
			}
		}
	%>
	<br>
	<b>request.getParameterNames() 메서드 사용</b> <br>
	<%
		Enumeration paramEnum = request.getParameterNames();
		while(paramEnum.hasMoreElements()){
			String name = (String)paramEnum.nextElement();
			%>
			<%= name %>
	<%	
		}
	%>
	<br> <b>request.getParameterMap() 메서드 활용</b> <br>
	<%
		Map parameterMap = request.getParameterMap();
		String [] nameParam = (String [])parameterMap.get("name");
		if(nameParam != null){
	%>
			name =
			<%= nameParam[0] %>
	<%
		}
	%>

</body>
</html>