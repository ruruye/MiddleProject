package kr.or.ddit.comment.dao;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.comment.vo.CommentVO;
import kr.or.ddit.post.vo.PostVO;
import kr.or.ddit.util.MyBatisSqlSessionFactory;

public class CommentDAOImpl implements ICommentDAO {
	
	private static ICommentDAO commentDAO;
	
	private CommentDAOImpl() {}
	
	public static ICommentDAO getInstance() {
		if(commentDAO == null) commentDAO = new CommentDAOImpl();
		return commentDAO;
	}

	@Override
	public int insertComment(CommentVO cvo) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		int res = 0;
		
		//res = mapper수행
		try {
			res = sqlSession.insert("comment.insertComment", cvo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
				
		return res;
	}

	@Override
	public CommentVO getCommentDetail(int commId) {
        SqlSession session = MyBatisSqlSessionFactory.getSqlSession();  // MyBatis 처리용 객체 생성
		
        CommentVO commentVO = null;
		
		try {
			commentVO = session.selectOne("comment.getCommentDetail", commId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}	
		
		return commentVO;
	}

}
