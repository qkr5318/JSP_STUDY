<%@page import="java.util.Arrays"%>
<%@page import="source09.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>c14_min_max jsp 소스 코딩</title>
</head>
<body>
	<!-- ;'' 객체 표현 안함 -->
	${vals = [20, 17, 30, 2, 9, 23];''}
	<br> <hr>
	<!--  최대값 소스 코딩  -->
	${vals.stream()
	      .max()
	      .get() }
	<br> <hr>
	<!-- 다음은 최소값 소스 코딩 -->
	${vals.stream()
	      .min()
	      .get() }
	 <br> <hr>
	 <%
	 	List<Member> memberList = Arrays.asList(
	 					new Member("장나라", 20),
	 					new Member("김희선", 30),
	 					new Member("김다미", 25),
	 					new Member("이영애", 40)	 					
	 			);
	 	request.setAttribute("members", memberList);
	 %>
	 <!-- 최대값 소스 코딩 = ;'' 객체 표현 안함 -->
	 ${
	 	maxAgeMemOpt = members.stream()
	 	                      .max((m1, m2) -> m1.age.compareTo(m2.age));''
	  }
      <br> <hr>
      ${maxAgeMemOpt}
      <br> <hr>
      ${maxAgeMemOpt.get()}
      <br> <hr>
      ${maxAgeMemOpt.get().name}
      <br> <hr>
      ${maxAgeMemOpt.get().age}세
      <br> <hr>
      
      <!-- 최소값 소스 코딩 = ;'' 객체 표현 안함 -->
	 ${
	 	minAgeMemOpt = members.stream()
	 	                      .min((m1, m2) -> m1.age.compareTo(m2.age));''
	  }
      <br> <hr>
      ${minAgeMemOpt}
      <br> <hr>
      ${minAgeMemOpt.get()}
      <br> <hr>
      ${minAgeMemOpt.get().name}
      <br> <hr>
      ${minAgeMemOpt.get().age}세
      <br> <hr>

</body>
</html>



