<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>catch tag</title>
</head>
<body>
	<c:catch>
	name 파라미터의 값 = <%= request.getParameter("name") %>
	<br>
	<%if(request.getParameter("name").equals("test")){
	%>	
		${param.name}라는 test입니다.
   <%		
	}
	%>
	</c:catch>
	<c:if test="${ex != null }">
		익셉션이 발생했습니다 : <br>
		${ex}
	</c:if>

</body>
</html>