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


<script type="text/javascript">
	$(function() {
		$("#checkJson").click(function() {
			$.ajax({
					type: "post",
					async: false,
					url:"${contextPath}/json2",
					// 매개변수 이름 jsonInfo로 JSON 데이터를 ajax로 전송 처리 합니다.

					success: function(data, textStatus) {
						// 서버에서 전송한 JSON 데이터를 파싱 처리 합니다.
						var jsonInfo = JSON.parse(data);
						var memberInfo = "회원 정보<br>";
						memberInfo += "============<br>"
						
						// 배열 이름 members로 각 배열 요소에 접근한 후
						// name으로 value 값으 출력합니다.
						for ( var i in jsonInfo.members) {
							memberInfo += "이름 : " + jsonInfo.members[i].name + "<br>";
							memberInfo += "나이 : " + jsonInfo.members[i].age + "<br>";
							memberInfo += "성별 : " + jsonInfo.members[i].gender + "<br>";
							memberInfo += "별명 : " + jsonInfo.members[i].nickname + "<br> <hr>";
						}
						$("#output").html(memberInfo);
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