<%@page import="source09.Thermometer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Thermometer 객체를 생성하고,
	// EL에서 사용할 수 있도록 request의 속성으로 추가합니다.
	Thermometer thermometer = new Thermometer();
	request.setAttribute("t", thermometer);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온도 변환기 예시 : thermometer</title>
</head>
<body>
	<!--EL의 메서드 호출 지원 확인-->
	${t.setCelsius('서울', 27.3) }
	서울 온도 : 섭씨 ${t.getCelsius('서울')}도 / 화씨${t.getFahrenheit('서울') }
	<br>
	정보 : ${t.getInfo() }
	<br>
	<!-- t.info는 getInfo() 메서드의 결과를 값으로 출력합니다. -->
	정보 : ${t.info}	
	
</body>
</html>