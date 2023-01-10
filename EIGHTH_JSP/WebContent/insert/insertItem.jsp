<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.Occurs"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String idValue = request.getParameter("id");
	
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
	PreparedStatement pstmtItem = null;
	PreparedStatement pstmtDetail = null;
	
	String jdbcDriver ="jdbc:mysql://localhost:3306/chap17?" +
         "characterEncoding=UTF-8&serverTimezone=UTC";
	String dbUser = "jspexam";
	String dbpass = "jsppw";
	
	Throwable occuredExeption = null;
	//Throwable 클래스는 예외처리를 할 수 있는 최상위 클래스이다.
	try{
	
	int id = Integer.parseInt(idValue);

	// 2. 데이터베이스 커넥션 생성
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbpass);
	
	// 오토커밋(자동커밋) 처리를 false로 설정함
	conn.setAutoCommit(false);
	//트랜잭션을 구현하는 방법에는 다음의 두 가지 방식이 있다.

	//JDBC의 오토 커밋 모드를 false로 지정하는 방법
	//JTA(Java Transaction API)를 이용하는 방법
	
	// insert into item values(10, '컴퓨터');
	String query = "insert into item values(?, ?);";
	
	// 3. PreparedStatement 생성
	pstmtItem = conn.prepareStatement(query);
	pstmtItem.setInt(1, id);
	pstmtItem.setString(2, "상품 이름 " + id);
	// 4. 쿼리 실행
	pstmtItem.executeUpdate();
	
	// error 파라미터가 존재할 경우 익셉션(예외 처리)을 발생시킵니다.
	if(request.getParameter("error") != null){
		throw new Exception("의도적 익셉션 발생!");
	} // error 처리가 되면 그 뒤 아래 구문들이 실행이 되지 않고 item으로 insert 한도 커밋 처리가 안되고 아래 catch문에서 트랜잭션 처리 과정에서 정상 처리가 아닌 예외가 발생하여  rollback을 하여 값을 넣기 전 상황으로 돌아간다. 
	
	// insert into item_detail values(10, '컴퓨터');
	String QueryDetail = "insert into item_detail values(?, ?);";
	pstmtDetail = conn.prepareStatement(QueryDetail);
	pstmtDetail.setInt(1, id);
	pstmtDetail.setString(2, "상세 설명" + id);
	pstmtDetail.executeUpdate();
	
	conn.commit();// 세션 연결 상태에서 커밋 처리를 해줍니다.	
	
	}catch(Throwable e){
		if(conn != null){
			try{
				// 트랜잭션을 커밋하기 전에 에러가 발생하면 임시로 보관한 모든 쿼리 결과를 실제 데이터에 반영하지 않고 취소한다.
				//즉, 트랜잭션이 시작되면 트랜잭션 범위 내에 있는 모든 쿼리 결과가 DB에 반영되거나 또는 반영되지 않게 된다.
				// 이때 트랜잭션을 반영하지 않고 취소하는 것을 롤백(rollback)이라고 한다.
				// 트랜젝션 처리 과정에서 정상 처리 완료가 아닌
				// 예외 상황이 발생하면 롤백 처리를 합니다.
				conn.rollback();
				//트랜잭션을 커밋하기 전에 에러가 발생하면 임시로 보관한 모든 쿼리 결과를 실제 데이터에 반영하지 않고 취소한다.
				//즉, 트랜잭션이 시작되면 트랜잭션 범위 내에 있는 모든 쿼리 결과가 DB에 반영되거나 또는 반영되지 않게 된다. 
				//이때 트랜잭션을 반영하지 않고 취소하는 것을 롤백(rollback)이라고 한다
			}catch(SQLException ex){
				
			out.println(ex.getMessage());
			ex.printStackTrace();
			}
		} // 앞서 롤백 처리한 익셉션을 occuredException에 할당 처리 합니다.
			occuredExeption = e;
	
		} finally{
			// 6.사용한 Statement 종료
			if(pstmtDetail != null) try{
				pstmtDetail.close();
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
<title>insertItem.jsp 소스 코딩</title>
</head>
<body>
<% if(occuredExeption != null) {
%>
	에러가 발생했습니다. <%= occuredExeption.getMessage() %>
			
<%
} else{
%>
트랜젝션 데이터가 성공적으로 데이터베이스 Insert 되었습니다.
<%
}
%>
</body>
</html>