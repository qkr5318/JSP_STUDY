<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<meta charset="UTF-8">
<title>JSON ajax 테스트</title>
<!-- jQuery는 파일 연계 방식 또는 CDN. 연계 방식으로 활용이 가능하며,
          여기서는 CDN 연계 방식으로 활용합니다. -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>  

<!--  자바스크립트에서 회원 정보를 JSON 객체로 만들어서
	매개변수 이름 jsonInfo로 ajax를 이용해서 서블릿으로 전송 처리 합니다. -->
<script type="text/javascript">
	$(function() {
		$("#checkJson").click(function() {
			//전송할 회원 정보를 JSON 형식을 만듭니다.
			var _jsonInfo = '{"name":"장나라", "age":"25", "gender":"여성", "nickname":"가수"}';
			$.ajax({
					type: "post",
					async: false,
					url:"${contextPath}/json",
					// 매개변수 이름 jsonInfo로 JSON 데이터를 ajax로 전송 처리 합니다.
					data: {jsonInfo: _jsonInfo},
					success: function() {
					},
					error: function() {
						alert("에러가 발생했습니다.")
					},
					complete: function() {
					}
			});	// end ajax
		});
	});
</script>

</head>
<body>
	<a id="checkJson" style="cursor:pointer">텍스트를 클릭하시면 서버의 Console 화면에 회원 정보를 (전송) 출력합니다.</a>
	<br> <hr>
	<div id="output"></div>
</body>
</html>