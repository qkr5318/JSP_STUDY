<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String memberID = request.getParameter("MEMBERID");
	String name = request.getParameter("NAME");

	int updateCount = 0;
	
//	1. JDBC 드라이버 로딩
	// MySQL DB 8아래 버전은 com.mysql.jdbc.Driver을 사용했지만,
	// MySQL DB 8이상 버전은 com.mysql.cj.jdbc.Driver 로 사용합니다.
	Class.forName("com.mysql.cj.jdbc.Driver");

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
	String jdbcDriver ="jdbc:mysql://localhost:3306/chap17?" +
         "characterEncoding=UTF-8&serverTimezone=UTC";
	String dbUser = "jspexam";
	String dbpass = "jsppw";
	// select * from member order by MEMBERID desc;
	String query = "update member set name = '"+ name + "' where MEMBERID = '"+ memberID +"';";
	
	// 2. 데이터베이스 커넥션 생성
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbpass);
	
	// 3. Statement 생성
	stmt = conn.createStatement();
	
	// 4. 쿼리 실행
	updateCount = stmt.executeUpdate(query);
	
	
	
	
	}catch(SQLException ex){
		out.println(ex.getMessage());
		ex.printStackTrace();
	} finally{
		// 6.사용한 Statement 종료
		if(rs != null) try{
			rs.close();
		}catch(SQLException ex){
			ex.printStackTrace();
		}
		if(stmt != null) try{
			stmt.close();
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
<title>이름 변경 처리 update.jsp 소스 코딩</title>
</head>
<body>
	<% if(updateCount > 0){
		
		%>
		<%= memberID %>의 이름은 <%= name %>(으)로 변경 처리 했습니다.
	<%
	} else{
	%>
	<%= memberID %> 아이디가 존재하지 않습니다.
	<%	
	}
	%>
	
	
	
</body>
</html>