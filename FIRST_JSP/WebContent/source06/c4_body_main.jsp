<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>body main</title>
<!-- 
   &#60;jsp&#58;param&#62; 액션 태그를 사용할 때 주의할 점은
   &#60;jsp&#58;param&#62; 액션 태그로 추가한 파라미터는
   &#60;jsp&#58;param&#62; 액션 태그로 포함하는 페이지에서만 유효하다는 점입니다.
 -->
</head>
<body>
	include 전 name 파라미터 값 : <%= request.getParameter("name") %>
	<hr>
	<jsp:include page="body_sub.jsp" flush="false">
		<jsp:param value="장나라" name="name"/>
	</jsp:include>
	include 후 name 파라미터 값 : <%= request.getParameter("name") %>
</body>
</html>