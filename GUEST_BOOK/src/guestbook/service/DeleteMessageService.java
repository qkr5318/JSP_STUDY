package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import guestbook.dao.MessageDao;
import guestbook.model.Message;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class DeleteMessageService {
	
	private static DeleteMessageService instance = new DeleteMessageService();
	
	public static DeleteMessageService getInstance() {
		return instance;
	}
	
	private DeleteMessageService() {
		
	}
	
	public void deleteMessage(int messageId, String password) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			// 트랜잭션 처리를 위해 오토커밋을 false로 설정함
			conn.setAutoCommit(false);
			
			MessageDao messageDao = MessageDao.getInstance();
			// 삭제할 메시지에 해당하는 Message 객체를 구한다.
			Message message = messageDao.select(conn, messageId);
			// Message가 존재하지 않으면 MessageNotFoundException을 발생시킵니다.
			if(message == null) {
				throw new MessageNotFoundException("메시지가 없습니다 ㅠ.ㅠ");
			} // Message 객체의 matchPassword() 메서드를 이용해서
			  // 파라미터로 전달받은 password가 메시지를 등록할 때 사용한 암호와 일치하는지 검사합니다.
			  // 암호가 일치하지 않으면 InvalidPasswordException를 발생시켜 줍니다.
			if(!message.matchPassword(password)) {
				throw new InvalidPasswordException("비밀번호가 유효하지 않습니다 ㅠ.ㅠ");
			}
			// messageDao.delete() 메서드를 이용해서 지정한 messageId에 해당하는 메시지를 삭제합니다.
			messageDao.delete(conn, messageId);
			// 트랜잭션을 커밋 처리 합니다.
			conn.commit();
			// 트랜잭션 처리 도중 SQLException 예외가 발생하면 트랜잭션을 롤백하고
			// ServiceException 예외를 발생시켜 줍니다.
		} catch(SQLException ex){
			JdbcUtil.rollback(conn);
			throw new ServiceException("삭제 실패 ㅠ.ㅠ : " + ex.getMessage(), ex);
		// 메시지가 없거나 암호가 일치하지 않아서 익셉션 예외처리가 발생한 경우, 트랜잭션을 롤백하고 익셉션 예외 처리를 발생시켜 줍니다.	
		} catch(InvalidPasswordException | MessageNotFoundException ex){
			JdbcUtil.rollback(conn);
			throw ex;
			
		}finally {
			JdbcUtil.close(conn);
		}
	}
	
}
