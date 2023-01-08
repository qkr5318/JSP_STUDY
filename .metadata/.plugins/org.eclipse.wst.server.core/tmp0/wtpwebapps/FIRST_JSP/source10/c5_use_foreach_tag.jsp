<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%
	HashMap<String, Object> mapData = new HashMap<>();
	mapData.put("name", "장나라");
	mapData.put("today", new Date());
%>
<c:set var="intArray" value="<%=new int[]{1, 2, 3, 4, 5} %>" />
<c:set var="map" value="<%= mapData %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>foreach tag</title>
</head>
<body>

	<h4>1부터 100까지 홀수의 합</h4>
	<c:set var="sum" value="0"/>
	<!-- 변수 i의 값을 1부터 100까지 2씩 증가 처리합니다. 
		즉, i값은 1 ,3 ,5, ....,97, 98, 99가 됩니다.-->
		<c:forEach var="i" begin="1" end="100" step="2">
			<c:set var="sum" value="${sum +i }"/>
		</c:forEach>
		결과 = ${sum }
		
		<h4>구구단 : 4단</h4>
		<ul>
			<!-- 변수 i의 값을 1부터 9까지 1씩 증가 처리합니다. -->
			<c:forEach var="i" begin="1" end="9">
				<li>4*${i}  = ${4*i}
			</c:forEach>
		</ul>
		<h4>int형 배열</h4>
		<!-- 배열 intArray의 인덱스 2부터 4까지의 요소의 값을 변수 i에 저장 처리합니다.
			루프 상태의 변수 status에 저장 처리합니다.
			varStatus는 루프 상태를 저장할 EL변수 이름의 속성을 나타냅니다. -->
			<c:forEach var="i" items="${intArray}" begin="2" end="4" varStatus="status">
				${status.index} - ${status.count} - [${i}] <br>
			</c:forEach>
			
			<h4>Map 데이터 화면 출력</h4>
			<!-- Map의 각 원소를 나타내는 Map.Entry를 i에 저장 처리합니다. -->
			<c:forEach var="i" items="${map}">
				${i.key} = ${i.value} <br>
			
			</c:forEach>
			

</body>
</html>