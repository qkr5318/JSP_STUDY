package jdbc;

import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;
// GenericObjectPoolConfig 클래스는 커넥션 풀의 최대 크기를 지정할 수 있는 setMaxTotal()메서드를 제공한다. setMaxTotal() 메서드를 포함해 커넷견 풀의 개수와 대기 시간을 설정


// DBCP (DATA BASE CONNECTION POOL)
// DBCP 이용 커넥션 풀 사용을 위해서
// 자카르타 프로젝트의 DBCP2 API를 사용해 봅니다.
// 1단계) DBCP 관련 jar 파일과 JDBC 드라이버 jar 파일 설치하기
// commons-dbcp2-2.8.0.jar, commons-logging-1.2.jar,
// commons-pool2-2.9.0.jar, mysql-connector-java-8.0.22.jar
// 2단계) 커넥션 풀 초기화하기
// 3단계) 커넥션 풀로부터 커넥션 사용하기

public class DBCPInit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		loadJDBCDriver();
		initConnectionPool();
	}


	private void loadJDBCDriver() {
		try {
			// 커넥션 풀이 내부에서 사용할 JDBC 드라이버를 로딩합니다.
			// 예제의 경우, MySQL에 연결 MySQL용 드라이버를 로딩합니다.
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("fail to load JDBC Driver", e);
		}
	}

	private void initConnectionPool() {
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/chap17?" +
					"characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true";
					
			String username = "jspexam";
			String pw = "jsppw";
			
			// 커넥션 풀이 새로운 커넥션을 생성할 때 사용할
			// 커넥션 팩토리(ConnectionFactory)를 생성합니다.
			ConnectionFactory connFactory =
					// MySQL 연결에 상요할 jdbcUrl, username, pw를
					// 생성자로 지정합니다.
					new DriverManagerConnectionFactory(jdbcUrl, username, pw);

			// PoolableConnection을 생성하는 팩토리를 생성합니다.
			// DBCP는 커넥션 풀에 커넥션을 보관할 때 PoolableConnection을 사용합니다.
			// 이 클래스는 내부적으로 실제 커넥션을 담고 있으며,
			// 커넥션 풀을 관리하는 데 필요한 기능을 추가로 제공합니다.
			// 예를들면, close() 메서드를 실행하면 실제 커넥션을 종료하지 않고
			// 풀에 커넥션을 반환 처리 합니다.
			PoolableConnectionFactory poolableConnFactory =
					new PoolableConnectionFactory(connFactory, null);
			poolableConnFactory.setValidationQuery("select 1");
			// DB 커넥션이 유효한지 여부를 검사할 때 사용할 쿼리를 지정합니다.
			// 이것은 특정 시간마다 트랜잭션 DB 세션 재접속을 검증하는
			// validationQuery를 실행하게 됩니다.
			// 오라클의 경우 : validationQuery="select 1 from dual"
			//	          환경을 셋팅합니다.

			// 커넥션 풀의 설정 정보를 생성한다.					
			GenericObjectPoolConfig	poolConfig = new GenericObjectPoolConfig(); 
			// 유휴 커넥션 검사 주기 (1000L*60L*5L) 설정
			poolConfig.setTimeBetweenEvictionRunsMillis(1000L*60L*5L); 
			// 풀에 보관중인 커넥션 유효 검사 설정(true)
			poolConfig.setTestWhileIdle(true); 
			// 접속자가 많아지면 서버가 다운이 될수 있음으로 접속자에 수를 정해놓기 위하여 최소 최대 값을 지정하여 관리를 할 수 있게하는 로직 CONNECTION POOL
			// 커넥션 최소 개수 (4) 설정 / idle 대기하는, 유휴의(쓰지않고 대기) 유휴갯수 지정
			poolConfig.setMinIdle(4); 
			// 커넥션 최대 개수 (50) 설정 **(-1)음수면 제한이 없다
			poolConfig.setMaxTotal(50); 
			
			// 커넥션 풀을 생성합니다. 생성자는 PoolableConnection을 생성할 때
			// 사용할 팩토리(PoolableConnectionFactory)와
			// 커넥션 풀 설정(GenericObjectPoolConfig)을
			// 파라미터로 전달 받습니다.
			GenericObjectPool<PoolableConnection> connectionPool =
						new GenericObjectPool<>(poolableConnFactory, poolConfig);
			// PoolableConnectionFactory에서도  GenericObjectPool에서 생성한 커넥션 풀을 연결합니다.
			poolableConnFactory.setPool(connectionPool);
			
			// 커넥션 풀을 제공하는 JDBC 드라이버를 등록합니다.
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver driver =
									(PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			// 커넥션 풀 드라이버에 GenericObjectPool에서 생성한 커넥션 풀을 등록합니다.
			// 이때, "chap17"를 커넥션 풀 이름으로 주었는데,
			// 이 경우 프로그램에서 사용하는 JDBC URL은
			// "jdbc:apache:commons:dbcp:chap17"가 됩니다.
			driver.registerPool("chap17", connectionPool);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
}
