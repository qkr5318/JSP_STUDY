<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>c8_lambda jsp 소스 코딩</title>
</head>
<body>

	<!-- ;'' 객체 표현 안함 -->
	${greaterThan = (a, b) -> a > b ? true: false;''}
	<br> <br> <hr>
	${greaterThan = (a, b) -> a > b ? true: false}
	<br> <br> <hr>
	${greaterThan(3, 2)}
	<br> <br> <hr>
	
	<!-- ;'' 객체 표현 안함 -->
	${factorial = (n) -> n == 1 ? 1 : n*factorial(n-1);''}
	<br> <br> <hr>	
	<!-- factorial(5) 처리 : n*factorial(n-1) = 5*4*3*2*1 = 120 -->
	${factorial = (n) -> n == 1 ? 1 : n*factorial(n-1)}
	<br> <br> <hr>
	${factorial(5)}
	<br> <br> <hr>
	
	<!-- ;'' 객체 표현 안함 -->
	${factorial = (n) -> n == 1 ? 1 : n*factorial(n-1);''}
	<br> <br> <hr>	
	${factorial = (n) -> n == 1 ? 1 : n*factorial(n-1)}
	<br> <br> <hr>
	${factorial(1)}

</body>
</html>


