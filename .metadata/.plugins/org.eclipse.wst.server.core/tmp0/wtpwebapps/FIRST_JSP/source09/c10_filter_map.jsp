<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${vals = [1, 2, 3, 4, 5];
		filteredVals = vals.stream()
						   .filter(x -> x%2 == 0)
						   .toList()
	 }
	 <br> <br> <hr>
	 ${vals = [1, 2, 3, 4, 5];
	 	mapedVals = vals.stream()
	 					.map(x -> x*x)
	 					.toList()
	 
	  }
	  <br> <br> <hr>
	  ${vals = [1, 2, 3, 4, 5];
	  	mapedVals = vals.stream()
	  					.filter(x -> x%2 == 0)
	  					.map(x -> x*x)
	  					.toList()
	   }
</body>
</html>