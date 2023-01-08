<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="file1" value="${param.param1}"/>
	<c:set var="file2" value="${param.param2}"/>
	<!-- 다운로드할 파일 이름을 가져옵니다! -->
</head>
<body>
	<!--  이미지 파일 표시창에서 img 태그의 src 속성에 다운로드를 요청할
	서블릿 이름을 download.do와 파일 이름을 GET방식으로 전달합니다.
	다운로드한 이미지 파일을 바로 img 태그에 표시하고, a태그로 클릭해
	서블릿에 다운로드를 요청하면 파일 전체를 로컬 PC에 다운로드 합니다. -->
	파라미터 1 : <c:out value="${file1}"/>
	<br>
	<c:if test="${not empty file1 }">
	<!--  파일 이름으로 서블릿에서 이미지를 다운로드해 표시합니다. -->
	<img alt="플라워 이미지" src="${contextPath}/download.do?fileName=${file1}" width="300" height="300"/> <br>
	</c:if>
	파일 내려받기(1) : <br>
	<!--  이미지를 파일로 다운로드 처리합니다. -->
	<a href="${contextPath}/donwload.do?fileName=${file1}"> 파일 내려받기</a>
	<br><br><br>
	
	
	파라미터 2 : <c:out value="${file2}"/>
	<br>
	<c:if test="${not empty file2}">
	<!--  파일 이름으로 서블릿에서 이미지를 다운로드해 표시합니다. -->
	<img alt="플라워 이미지" src="${contextPath}/download.do?fileName=${file2}" width="300" height="300"/> <br>
	</c:if>
	파일 내려받기(2) : <br>
	<!--  이미지를 파일로 다운로드 처리합니다. -->
	<a href="${contextPath}/donwload.do?fileName=${file2}"> 파일 내려받기</a>
	<br><br><br>
</body>
</html>