<%@page import="java.io.Reader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String memberID = request.getParameter("memberID");
%>     
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 정보 viewMemberListHistory.jsp 소스 코딩</title>
</head>
<body>
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
String query = "select * from member_history where MEMBERID = '"+memberID+"';";

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
	<td>히스토리</td>
	<td>
	<%
		String history = null;
		Reader reader = null;
		try{
			// getCharacterStream()은
			// long varchar 타입의 값 지정할 때 사용함
			reader = rs.getCharacterStream("history");
		if(reader != null){
			StringBuffer buff = new StringBuffer();
			char[] ch = new char[512];
			int len = -1;
			while((len = reader.read(ch)) != -1){
			// append(char[] ch, int 오프셋, int len)
			// 필요한 길이에 대해 지정된 오프셋에서 시작하여
			// 문자 배열의 하위 배열을 추가합니다.
			buff.append(ch, 0, len);
			}
			history = buff.toString();
		}
	}catch(IOException ex){
		out.println("익셉션 발생 : " + ex.getMessage());
	} finally{
		if(reader != null)
			try{
				reader.close();
			} catch(IOException ex){
				
			}
	}
	%>
	<%= history %>
	</td>	
</tr>
</table>
	<%
		}else{
	%>
		<%= memberID %> 회원의 히스토리가 없습니다.
	<%
		}	
	}catch(SQLException ex){
	%>
		에러 발생 : <%= ex.getMessage() %>
	<%	
	} finally{
		// 6. 사용한 Statement 종료
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
</body>
</html>