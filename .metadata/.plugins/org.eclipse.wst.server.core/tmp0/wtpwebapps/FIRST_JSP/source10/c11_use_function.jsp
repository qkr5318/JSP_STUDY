<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 함수 taglib 사용function</title>
</head>
<body>

	<c:set var="str1" value="Functions <태그>를 사용합니다."/>
	<c:set var="str2" value="사용"/>
	<c:set var="tokens" value="1,2,3,4,5,6,7,8,9,10" />
	
	length(str1) = ${fn:length(str1)} <br> <hr>
	toUpperCase(str1) = "${fn:toUpperCase(str1) }" <br> <hr>
	toLowerCase(str1) = "${fn:toLowerCase(str1) }" <br> <hr>
	substring(str1, 3, 6) = "${fn:substring(str1, 3, 6) }" <br> <hr>
	replace(str1, src, dest) = "${fn:replace(str1, " ", "-") }" <br> <hr>
	<%-- ${fn:indexOf("내용", "찾는 문자열"
		찾는 문자열이 내용에 있으면 문자열이 시작하는 index 값을 리턴해 줍니다.
		만약, 찾는 문자열이 없다면 -1 값을 리턴 처리해 줍니다. --%>
		indexOf(Str1, str2) = "${fn:indexOf(str1, str2) }" <br> <hr>
		startsWith(str1, str2) = "${fn:startsWith(str1, 'Fun') }" <br> <hr>
		endsWith(str1, str2) = "${fn:endsWith(str1, '합니다.') }" <br> <hr>
		contains(str1, str2) = "${fn:contains(str1, str2) }" <br> <hr>
		<c:set var="array" value="${fn:split(tokens, ',')}"/>
		join(array, "-") = "${fn:join(array, "-")}" <br> <hr>

</body>
</html>