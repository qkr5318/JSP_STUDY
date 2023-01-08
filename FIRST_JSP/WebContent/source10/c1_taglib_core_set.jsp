<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
	<c:set> 태그는 JSTL에서 제공하는 태그이며,
	EL에서 사용할 수 있는 변수를 생성해 주는 기능을 제공합니다.
 --%>
 <%--
 	<c:set> 태그 기본 사용 방법
  --%>
  <c:set var="name1" value="장나라" />
  ${name1}
  <br> <hr>
  <c:set var="name2">김희선</c:set>
  ${name2 }
  <br> <hr>
  <c:set var="num1" value="5"/>
  <c:set var="num2" value="${2}"/>
  <c:set var="num3">5.2</c:set>
  합은 ${num1 + num2 + num3}
  <br> <hr>
</body>
</html>