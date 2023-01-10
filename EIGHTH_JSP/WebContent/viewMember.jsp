<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberID = request.getParameter("memberID");


%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>회원 정보 viewMember.jsp 소스코딩</title>
</head>
<body>
<!-- 파라미터로 아이디를 전달받으면 MEMBER 테이블로부터 해당 회원 정보를 읽어와서 출력하는 JSP 프로그램을 제작해 봅니다. -->
<%  // 1. JDBC 드라이버 로딩
// MySQL DB 8아래 버전은 com.mysql.jdbc.Driver을 사용했지만,
// MySQL DB 8이상 버전은 com.mysql.cj.jdbc.Driver 로 사용합니다.
Class.forName("com.mysql.cj.jdbc.Driver");

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try{
String jdbcDriver = "jdbc:mysql://localhost:3306/chap17?" +
		"characterEncoding=UTF-8&serverTimezone=UTC";
String dbUser = "jspexam";
String dbPass = "jsppw";

// select * from member_history where MEMBERID = 'goodday';
String query = "select * from member where MEMBERID = '"+memberID+"';";

// 2. 데이터베이스 커넥션 생성
conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

// 3. Statement 생성
stmt = conn.createStatement();

// 4. 쿼리 실행
rs = stmt.executeQuery(query);

//5. 쿼리 실행 결과 출력
	if(rs.next()){
%>
<table border="1">
<tr>
	<td>아이디</td>
	<td><%=memberID%> </td>		
</tr>
<tr>
<tr>
	<td>암호</td>
	<td><%=rs.getString("PASSWORD")%> </td>		
</tr>
<tr>
	<td>이름</td>
	<td><%=rs.getString("NAME")%> </td>		
</tr>
<tr>
	<td>이메일</td>
	<td><%=rs.getString("EMAIL")%> </td>		
</tr>
</table>
<%
	} else {
%>

<%= memberID %>에 해당하는 정보가 존재하지 않습니다.
<%
		}
	}catch(SQLException ex){

%>
에러발생 : <%=ex.getMessage() %>
<%
	}finally{
		if(rs != null) try{rs.close();} catch(SQLException ex){}
		if(stmt != null) try{stmt.close();} catch(SQLException ex){}
		if(conn != null) try{conn.close();} catch(SQLException ex){}
	}
%>








</body>
</html>