package jdbc.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
//	커넥션을 구할 때 사용할 ConnectionProvider 작성
//
//	JDBC URL을 보면 web.xml에서 지정한 poolName 값인 board를 풀 이름으로 사용했다.
	public static Connection getConnection() throws SQLException{
		return DriverManager.getConnection("jdbc:apache:commons:dbcp:board");
	}
	
	
}
