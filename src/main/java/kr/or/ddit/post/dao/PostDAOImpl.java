package kr.or.ddit.post.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.post.vo.PostVO;
import kr.or.ddit.util.MyBatisSqlSessionFactory;

public class PostDAOImpl implements IPostDAO {
	
	private static IPostDAO postDAO;
	
	private PostDAOImpl() {}
	
	public static IPostDAO getInstance() {
		if(postDAO == null) postDAO = new PostDAOImpl();
		return postDAO;
	}

	@Override
	public int insertPost(PostVO pvo) {
		
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		int res = 0;
		
		//res = mapper수행
		try {
			res = sqlSession.insert("post.insertPost", pvo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
				
		return res;
	}

	@Override
	public List<PostVO> getAllPost() {
        SqlSession session = MyBatisSqlSessionFactory.getSqlSession();  // MyBatis 처리용 객체 생성
		
		List<PostVO> postList = null;  // 반환값이 저장될 변수
		
		try {
			postList = session.selectList("post.getAllPost");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return postList;
	}

	@Override
	public int deletePost(int postId) {
        SqlSession session = MyBatisSqlSessionFactory.getSqlSession();  // MyBatis 처리용 객체 생성
		
		int cnt = 0;
		
		try {
			cnt = session.delete("post.deletePost", postId);
			if(cnt > 0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}	
		
		return cnt;
	}

	@Override
	public PostVO getPostDetail(int postId) {
        SqlSession session = MyBatisSqlSessionFactory.getSqlSession();  // MyBatis 처리용 객체 생성
		
        PostVO postVO = null;
		
		try {
			postVO = session.selectOne("post.getPostDetail", postId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}	
		
		return postVO;
	}

	@Override
	public List<PostVO> searchPost(Map<String, Object> map) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		List<PostVO> list = null;
		
		try {
			list = session.selectList("post.searchPost", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
		return list;
		
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		int res = 0;
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		
		try {
			res = session.selectOne("post.totalCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
		return res;
	}

	@Override
	public int updateRdcnt(int num) {
		int res =0;
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		
		try {
			res = session.update("post.updateRdcnt", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.commit();
			if(session!=null) session.close();
		}
		
		return res;
	}
	
	

}
