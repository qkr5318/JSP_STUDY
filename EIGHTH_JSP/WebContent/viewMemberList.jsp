<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewMemberList 소소 코딩</title>
</head>
<body>

MEMBER 테이블의 내용
<table width="100%" border="1">
	<tr>
		<td align="center">이름</td>
		<td align="center">아이디</td>
		<td align="center">이메일</td>
	</tr>

<% // 1. JDBC 드라이버 로딩
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
	String query = "select * from member order by NAME desc;";
	
	// 2. 데이터베이스 커넥션 생성
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbpass);
	
	// 3. Statement 생성
	stmt = conn.createStatement();
	
	// 4. 쿼리 실행
	rs = stmt.executeQuery(query);
	
	//5. 쿼리 실행 결과 출력
	while(rs.next()){
		%>
		<tr align="center">
			<td><%= rs.getString("NAME") %> </td>
			<td><%= rs.getString("MEMBERID") %> </td>
			<td><%= rs.getString("EMAIL") %> </td>
		</tr>
		<%}
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
		
		// 7. 커넥션 종료`
		if(conn != null) try{
			conn.close();
		}catch(SQLException ex){
			ex.printStackTrace();
		}
	}

%>
</table>

</body>
</html>