package kr.or.ddit.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.util.MyBatisSqlSessionFactory;

public class NoticeDAOImpl implements INoticeDAO {

	private static INoticeDAO noticeDao;
	
	private NoticeDAOImpl() {}
	
	public static INoticeDAO getInstance() {
		if(noticeDao == null) noticeDao = new NoticeDAOImpl();
		return noticeDao;
	}
	
	@Override
	public List<NoticeVO> getAllNotice() {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		List<NoticeVO> list = null;
		
		try {
			list = session.selectList("notice.getAllNotice");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return list;
	}

	@Override
	public List<NoticeVO> searchNotice(Map<String, Object> map) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		List<NoticeVO> list = null;
		
		try {
			list = session.selectList("notice.searchNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return list;
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		int res = 0;
		
		try {
			res = session.selectOne("notice.totalCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.commit();
			if(session!=null) session.close();
		}
		
		return res;
	}

	@Override
	public int updateRdcnt(int num) {
		int res =0;
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		
		try {
			res = session.update("notice.updateRdcnt", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.commit();
			if(session!=null) session.close();
		}
		
		return res;
	}

	@Override
	public NoticeVO getNoticeDetail(int id) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		NoticeVO nvo = null;
		
		try {
			nvo = session.selectOne("notice.getNoticeDetail", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return nvo;
	}

	@Override
	public int insertNotice(NoticeVO vo) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		int res = 0;
		
		try {
			res = session.insert("notice.insertNotice", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.commit();
			if(session!=null) session.close();
		}
		
		return res;
	}

	@Override
	public int deleteNotice(int noticeId) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		int res = 0;
		
		try {
			res = session.delete("notice.deleteNotice", noticeId);
			if(res > 0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return res;
	}

}
