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

<!-- ajax로 JSON 데이터를 가져온 후 서블릿에서 각각의 배열에 대해
	지정한 배열 이름을로 회원정보와 플라워 정보를 가져와서 화면으로 출력 처리합니다. -->
<script type="text/javascript">
	$(function() {
		$("#checkJson").click(function() {
			$.ajax({
					type: "post",
					async: false,
					url:"${contextPath}/json3",
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
						
						var flowerInfo = "플라워 정보<br>";
						flowerInfo += "===============================<br>";
						
						// 배열 이름 flowers로 플라워 정보르 출력 처리합니다
						for ( var i in jsonInfo.flowers) {
							flowerInfo += "제목 : " + jsonInfo.flowers[i].title + "<br>";
							flowerInfo += "작가 : " + jsonInfo.flowers[i].writer + "<br>";
							flowerInfo += "가격 : " + jsonInfo.flowers[i].price + "<br>";
							flowerInfo += "장르 : " + jsonInfo.flowers[i].genre + "<br>";
							
							
							// 이미지 URL을 구해서, img 태그의 src 속석ㅇ에 설정합니다.
							imageURL = jsonInfo.flowers[i].image;
							flowerInfo += "<img src=" + imageURL +" />" + "<br> <hr>";
						}
						
						$("#output").html(memberInfo + "<br>" + flowerInfo);
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
	<a id="checkJson" style="cursor:pointer">텍스트를 클릭하시면 서버의 Console 화면에 회원 정보와 플라워 정보를  (전송) 출력하고, 데이터 수신 회원 정보와 플라워 정보를 웹페이지 화면에 표시합니다.</a>
	<br> <hr>
	<div id="output"></div>
</body>
</html>