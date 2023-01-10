<%@page import="guestbook.service.InvalidPasswordException"%>
<%@page import="guestbook.service.DeleteMessageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	int messageId = Integer.parseInt(request.getParameter("messageId"));
	String password = request.getParameter("password");
	boolean invalidPassword = false;
	try{
		DeleteMessageService deleteService = DeleteMessageService.getInstance();
		deleteService.deleteMessage(messageId, password);
	} catch(InvalidPasswordException ex){
		invalidPassword = true;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 메시지 삭제 처리</title>
</head>
<body>

<% if(!invalidPassword) { %>
OK~! 메시지를 삭제했습니다.

<% } else { %>
입력한 암호가 올바르지 않습니다. 암호를 확인해 주시기 바랍니다. ㅠ.ㅠ
<% } %>
<br>
<a href="list.jsp">[목록보기]</a>

</body>
</html>