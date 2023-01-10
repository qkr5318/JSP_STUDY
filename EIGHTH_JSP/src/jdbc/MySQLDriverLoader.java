package jdbc;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class MySQLDriverLoader extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	public void init(ServletConfig config) throws ServletException {
		try {
			// 1. JDBC 드라이버 로딩
			// MySQL DB 8아래 버전은 com.mysql.jdbc.Driver을 사용했지만,
			// MySQL DB 8이상 버전은 com.mysql.cj.jdbc.Driver 로 사용합니다.
			Class.forName("com.mysql.cj.jdbc.Driver");
			// JDBC 드라이버 로딩 과정에서 문제가 있을 경우 예외처리를 합니다.
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
	
}
