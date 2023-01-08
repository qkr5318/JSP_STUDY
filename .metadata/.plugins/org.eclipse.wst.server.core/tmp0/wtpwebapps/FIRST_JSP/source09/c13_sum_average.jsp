<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${
		vals = [1, 2, 3, 4, 5];
		vals.stream()
			.sum()
	 }
	<br> <hr>
	<!-- average() 함수는 optional 타입 : get() 메서드 필용함 -->
	${
		vals = [1, 2, 3, 4, 5];
		vals.stream()
			.average()
			.get()
	 }
	 <br> <hr>
	 ${
	 	vals = [];
	 	vals.stream()
	 		.average()
	 		.orElse('없음')
	  }
	  <br> <hr>
	  ${
	  	vals = [2, 4];
	  	vals.stream()
	  		.average()
	  		.orElse('없음')
	   }


</body>
</html>