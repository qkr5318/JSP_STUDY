package jdbc;

import java.io.IOException;
import java.io.StringReader;
import java.sql.DriverManager;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

// DBCP 이용 커넥션 풀 사용을 위해서
// 자카르타 프로젝트의 DBCP2 API를 사용해 봅니다.
// 1단계) DBCP 관련 jar 파일과 JDBC 드라이버 jar 파일 설치하기
// commons-dbcp2-2.8.0.jar, commons-logging-1.2.jar,
// commons-pool2-2.9.0.jar, mysql-connector-java-8.0.22.jar
// 2단계) 커넥션 풀 초기화하기
// 3단계) 커넥션 풀로부터 커넥션 사용하기

public class DBCPInitListener implements ServletContextListener {  // 수정 (1)

	@Override  
	public void contextInitialized(ServletContextEvent sce) {   // 수정 (2)
		String poolConfig = sce.getServletContext().getInitParameter("poolConfig");  // 수정 (3)
		Properties prop = new Properties();  // 수정 (4)
		try {
			prop.load(new StringReader(poolConfig));  // 수정 (5)
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		loadJDBCDriver(prop);    // 수정 (6)
		initConnectionPool(prop);   // 수정 (7)
	}

	
	private void loadJDBCDriver(Properties prop) {    // 수정 (8)
		String driverClass = prop.getProperty("jdbcdriver");    // 수정 (9)
		try {
			// 커넥션 풀이 내부에서 사용할 JDBC 드라이버를 로딩합니다.
			// 예제의 경우, MySQL에 연결 MySQL용 드라이버를 로딩합니다.
			Class.forName(driverClass);                     // 수정 (10)
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("fail to load JDBC Driver", e);
		}
	}

	private void initConnectionPool(Properties prop) {   // 수정(11)
		try {
			String jdbcUrl = prop.getProperty("jdbcUrl");   // 수정(12)
			String username = prop.getProperty("dbUser") ;   // 수정(13)
			String pw = prop.getProperty("dbPass");          // 수정(14)
				
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
			// 커넥션 최소 개수 (4) 설정
			poolConfig.setMinIdle(4); 
			// 커넥션 최대 개수 (50) 설정
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
			String poolName = prop.getProperty("poolName");   // 수정(15)
			driver.registerPool(poolName, connectionPool);    // 수정(16)
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override   // 수정(17) : 추가
	public void contextDestroyed(ServletContextEvent sce) {
		
	}
	
}
