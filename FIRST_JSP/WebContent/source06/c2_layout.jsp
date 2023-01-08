<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>layout</title>
</head>
<body>
	<table width="400" border="1" cellpadding = "0" cellspacing="0">
	<tr>
	 	<td colspan="2">
	 		<jsp:include page="/source06/module/top.jsp" flush="false"/>
	 	</td>
	</tr>
		<td width="100" valign="top">
			<jsp:include page="/source06/module/left.jsp" flush="false"/>
		</td>
		<td width="200" valign="top">
		<!--  내용 부분 : 시작  -->
		레이아웃1
		<br> <br> <br>
		<!--  내용 부분 : 끝  -->
		</td>
	<tr>
	<td colspan="2">
			<jsp:include page="/source06/module/bottom.jsp" flush="false"/>
	</td>			
	</table>

</body>
</html>