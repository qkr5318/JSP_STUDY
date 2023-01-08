<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<jsp:useBean id="vo" class="jstl.MemberVO"/>
<jsp:useBean id="vo1" class="jstl.MemberVO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>taglib_set_target</title>
</head>
<body>
	
	<!-- setName()의 장나라 값으로 name 정의 -->
	<c:set target="${vo}" property="name" value="장나라"/>

	
	
	<!-- setEmail() 의 jang@gamail.com 값으로 email 정의 -->
	<c:set target="${vo}" property="email" value="jang@gamail.com"/>
	
	<!-- age 변수 값은 20으로 설정 처리함 -->
	<c:set var="age" value="20"/>
	
	<!-- 위에 age 변수의 값 20을 setAge()의 변수값으로 대입해줌 -->
	<c:set target="${vo}" property="age" value="${age}"/>



	<!-- setName()의 김희선 값으로 name 정의 -->
	<c:set target="${vo1}" property="name" value="김희선"/>
	
	<!-- setEmail() 의 kim@gamail.com 값으로 email 정의 -->
	<c:set target="${vo1}" property="email" value="kim@gamail.com"/>
	
	<!-- age 변수 값은 20으로 설정 처리함 -->
	<c:set var="age" value="40"/>
	
	<!-- 위에 age 변수의 값 20을 setAge()의 변수값으로 대입해줌 -->
	<c:set target="${vo1}" property="age" value="${age}"/>
	
	
	
	<h3>MemberVO 객체의 회원 정보</h3> <br>
	<p> 1. 회원님의 이름 = ${vo.name} </p> <br>
	<p> 2. 회원님의 메일 = ${vo.email} </p> <br>
	<p> 3. 회원님의 나이 = ${vo.age} </p> <br>
	<hr> <br>

	<h3>VO1 객체의 회원 정보</h3>	
	<p> 1. 두번째 회원님의 이름 = ${vo1.name} </p> <br>
	<p> 2. 회원님의 메일 = ${vo1.email} </p> <br>
	<p> 3. 회원님의 나이 = ${vo1.age} </p> <br>
	

</body>
</html>