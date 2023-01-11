package article.service;

import java.sql.Connection;
import java.sql.SQLException;

import article.dao.ArticleContentDao;
import article.dao.ArticleDao;
import article.model.Article;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class ModifyArticleService {

	private ArticleDao articleDao = new ArticleDao();
	private ArticleContentDao contentDao = new ArticleContentDao();

	public void modify(ModifyRequest modReq) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			// 트랜잭션 시작을 위한 오톳 커밋 false 설정
			conn.setAutoCommit(false);
			
			// 게시글 번호에 해당하는 Article 객체를 구한다. 
			Article article = articleDao.selectById(conn, 
					modReq.getArticleNumber());
			// 해당 번호를 가진 게시글이 존재하지 않으면 ArticleNotFoundException 익셉션을 발생시킨다.
			if (article == null) {
				throw new ArticleNotFoundException();
			}
			// 수정하려는 사용자가 해당 게시글을 수정할 수 있는지 검사한다.
			if (!canModify(modReq.getUserId(), article)) {
				// 수정할 수 없다면 PermissionDeniedException 익셉션을 발생시킨다.
				throw new PermissionDeniedException();
			}
			// ArticleDao와 ArticleContentDao의 update() 메서드를 이용해서 제목과 내용을 수정한다.
			articleDao.update(conn, 
					modReq.getArticleNumber(), modReq.getTitle());
			contentDao.update(conn, 
					modReq.getArticleNumber(), modReq.getContent());
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} catch (PermissionDeniedException e) {
			JdbcUtil.rollback(conn);
			throw e;
		} finally {
			JdbcUtil.close(conn);
		}
	}

		// canModify 게시글을 수정할 수 있는지 검사하는 기능을 구현한다.
		// 수정하려는 사용자 ID가 게시글 작성자 ID와 동일하면 true를 리턴한다.
	private boolean canModify(String modfyingUserId, Article article) {
		return article.getWriter().getId().equals(modfyingUserId);
	}
}
