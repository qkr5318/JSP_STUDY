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
		list = [1, 2, 3, 4, 5];''
	 }
	 <br> <hr>
	 <!--  4보다 큰 원소가 존재하는지 확인 = ;'' 객체 표현 안함 -->
	 ${matchOpt = list.stream()
	 				  .anyMatch(v -> v > 4);''
	  }
	  ${matchOpt.get()}
	  <br> <hr>
	   <!--  5보다 큰 원소가 존재하는지 확인(allMatch = ;'' 객체 표현 안함 -->
	 ${matchOpt = list.stream()
	 				  .allMatch(x -> x > 5);''
	  }
	  ${matchOpt.get()}
	  <br> <hr>
	     <!--  5보다 큰 원소가 존재하는지 확인(noneMatch) = ;'' 객체 표현 안함 -->
	 ${matchOpt = list.stream()
	 				  .noneMatch(x -> x > 5);''
	  }
	  ${matchOpt.get()}
	  <br> <hr>
</body>
</html>