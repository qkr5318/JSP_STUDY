<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sorted_limit_count 소스 코딩</title>
</head>
<body>
	${
		nums = [1, 2, 3, 4, 5];
		nums.stream()
			.sorted()
			.limit(3)
			.toList()
	 }
	 <br> <hr>
	 ${
	 	vals = [20, 54, 19, 42];
	 	sortedVals = vals.stream()
	 					 .count()
	  }
</body>
</html>