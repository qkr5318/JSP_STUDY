<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>    
<jsp:useBean id="memberInfo" class="source07.member.MemberInfo"/>
<jsp:setProperty property="*" name="memberInfo"/>
<%-- 
<jsp:setProperty property="password" name="memberInfo" value="<%=memberInfo.getId()%>"/>
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="400" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td>아이디</td>
		<td><jsp:getProperty property="id" name="memberInfo"/></td>
		<td>암호</td>
		<td><jsp:getProperty property="password" name="memberInfo"/></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><jsp:getProperty property="name" name="memberInfo"/></td>
		<td>이메일</td>
		<td><jsp:getProperty property="email" name="memberInfo"/></td>
	</tr>
	</table>

</body>
</html>