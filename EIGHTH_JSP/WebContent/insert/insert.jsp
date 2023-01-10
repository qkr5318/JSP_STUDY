<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String memberID = request.getParameter("memberID");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");

	
//	1. JDBC 드라이버(DBMS와 통신을 담당하는 자바 클래스) 로딩
	// MySQL DB 8아래 버전은 com.mysql.jdbc.Driver을 사용했지만,
	// MySQL DB 8이상 버전은 com.mysql.cj.jdbc.Driver 로 사용합니다.
	Class.forName("com.mysql.cj.jdbc.Driver");// ("JDBC드라이버 로딩코드")
	// JDBC : 각 DBMS에 알맞는 클라이언트
	// JDBC 프로그램 코딩 흐름
	// 1) JDBC 드라이버 로드
	// 2) DB 연결
	// 3) DB에 데이터를 읽거나 쓰기(SQL문)
	// 4) DB 연결 종료

	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
	String jdbcDriver ="jdbc:mysql://localhost:3306/chap17?" +
         "characterEncoding=UTF-8&serverTimezone=UTC";
	String dbUser = "jspexam";
	String dbpass = "jsppw";

	// 2. 데이터베이스 커넥션 생성
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbpass);
	
	// insert into member values('nicetoday', '1468', '김국진', 'kimmgukjin@naver.com');
	String query = "insert into member values(?, ?, ?, ?)";
	
	// 3. PreparedStatement 생성
	pstmt = conn.prepareStatement(query);
	pstmt.setString(1, memberID);
	pstmt.setString(2, password);
	pstmt.setString(3, name);
	pstmt.setString(4, email);
	
	// 4. 쿼리 실행
	pstmt.executeUpdate();	
	
	
	
	}catch(SQLException ex){
		out.println(ex.getMessage());
		ex.printStackTrace();
	} finally{
		// 6.사용한 Statement 종료
		if(pstmt != null) try{
			pstmt.close();
		}catch(SQLException ex){
			ex.printStackTrace();
		}
		
		// 7. 커넥션 종료
		if(conn != null) try{
			conn.close();
		}catch(SQLException ex){
			ex.printStackTrace();
		}
	}

%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>MEMBER 테이블에 새로운 레코드 삽입 처리 insert.jsp 소스 코딩</title>
</head>
<body>
	<%= memberID %>가 MEMBER 테이블에 정상적으로 레코드 삽입 처리되었습니다.
</body>
</html>