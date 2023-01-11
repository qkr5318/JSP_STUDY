package address.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class AddressDAO {
	// 기본 주소, 상세 주소 등록
	public void insertAddress(Connection conn, String basic, String detail) {
		System.out.println("AddressDAO.insertAddress()");
		// INSERT INTO jsp_address VALUES(idx_seq.nextval, '서울시', '살기좋은구');
		try(PreparedStatement pstmt = conn.prepareStatement("INSERT INTO jsp_address VALUES(idx_seq.nextval, ?, ?)")) {
			pstmt.setString(1, basic);
			pstmt.setString(2, detail);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
