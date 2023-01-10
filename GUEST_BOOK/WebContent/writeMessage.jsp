<%@page import="guestbook.service.WriteMessageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	 request.setCharacterEncoding("utf-8");
%>

<!--  Message 객체를 생성하고 요청 파라미터의 값을 Message 객체의 프로퍼티에 저장한다  -->

<jsp:useBean id="message" class="guestbook.model.Message">

	<jsp:setProperty name="message" property="*" />

</jsp:useBean>

<%

	WriteMessageService writeService = WriteMessageService.getInstance();
	// writeService.write() 메서드를 실행해서 사용자가 입력한 정보를 저장한다.
    writeService.write(message);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 메시지 남김</title>
</head>
<body>
<!-- writeService.write() 메서드가 정상적으로 실행되면 메시지를 남겼다는 안내 문구를 표현한다.ㅏ -->
방명록에 메시지를 정상적으로 남기셨습니다. 좋은 하루 보내세요~ ^^
<br>
<!-- 목록 화면으로 이동할 수 있는 링크를 화면 출력한다. -->
<a href="list.jsp">[목록보기]</a>

</body>
</html>