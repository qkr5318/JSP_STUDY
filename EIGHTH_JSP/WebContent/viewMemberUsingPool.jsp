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
<title>viewMemberUsingPool jsp 소스 코딩</title>
</head>
<body>
<!-- 커넥션 풀을 사용해서 member 리스트를 화면으로 출력 처리 함 -->

MEMBER 테이블의 내용
<table width="100%" border="1">
<tr>
	<td align="center">이름</td>
	<td align="center">아이디</td>
	<td align="center">이메일</td>
</tr>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		// 드라이버에 생성된 DBCP CHAP17 
		String jdbcDriver = "jdbc:apache:commons:dbcp:chap17";
		String query = "select * FROM member order by MEMBERID";
	
		// 2. 데이터베이스 커넥션 생성
		conn = DriverManager.getConnection(jdbcDriver);
		
		// 3. Statement 생성
		stmt = conn.createStatement();
		
		// 4. 쿼리 실행
		rs = stmt.executeQuery(query);
		
		// 5. 쿼리 실행 결과 출력
		while(rs.next()){
		%>	
		<tr align="center">
			<td><%= rs.getString("NAME") %> </td>
			<td><%= rs.getString("MEMBERID") %> </td>
			<td><%= rs.getString("EMAIL") %> </td>
		</tr>
		<%	
			}
		}catch(SQLException ex){
			out.println(ex.getMessage());
			ex.printStackTrace();		
		} finally{
		
			// 6. 사용한 Statement 종료
			if (rs != null) try{
				rs.close();
			} catch(SQLException ex){  }
			
			if (stmt != null) try{
				stmt.close();
			} catch(SQLException ex){  }
			
			// 7. 커넥션 종료
			if (conn != null) try{
				conn.close();
			} catch(SQLException ex){  }
	}
%>
</table>
</body>
</html>