package kr.or.ddit.book.dao;

import kr.or.ddit.book.vo.BookVO;
import kr.or.ddit.notice.vo.NoticeVO;

import org.apache.ibatis.session.SqlSession;
import kr.or.ddit.util.MyBatisSqlSessionFactory;

import java.util.List;
import java.util.Map;

public class BookDAOImpl implements IBookDAO {
    private static IBookDAO dao;

    private BookDAOImpl() {}

    public static IBookDAO getInstance() {
        if(dao == null) dao = new BookDAOImpl();
        return dao;
    }

    @Override
    public List<BookVO> bookList() {
        SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
        List<BookVO> list = null;

        try {
           list = session.selectList("book.bookList");
        } finally {
            session.close();
        }

        return list;
    }

    
    @Override
	public List<BookVO> bookListNine() {
    	 SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
         List<BookVO> list = null;

         try {
            list = session.selectList("book.bookListNine");
         } finally {
             session.close();
         }

         return list;
	}
    
    @Override
    public BookVO bookDetail(String bookId) {
        SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
        BookVO bookVO = null;
        try {
            bookVO = session.selectOne("book.bookDetail", bookId);
        } finally {
            session.close();
        }
        System.out.println("bookDetail.bookVO : " + bookVO);
        return bookVO;
    }

    @Override
    public int bookInsert(BookVO bookVO) {
        SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
        int cnt = 0;

         try {
            cnt = session.insert("book.bookInsert", bookVO);
            session.commit();
        } finally {
            session.close();
        }
        System.out.println("bookInsert.cnt : " + cnt);
        return cnt;
    }

    @Override
    public int bookUpdate(BookVO bookVO) {
        SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
        int cnt = 0;
        try {
            cnt = session.update("book.bookUpdate", bookVO);
            session.commit();
        } finally {
            session.close();
        }
        System.out.println("bookUpdate.cnt : " + cnt);

        return cnt;
    }

    @Override
    public int bookDelete(String bookId) {
        SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
        int cnt = 0;
        try {
            cnt = session.delete("book.bookDelete", bookId);
            session.commit();
        } finally {
            session.close();
        }
        System.out.println("bookDelete.cnt : " + cnt);

        return cnt;
    }

	@Override
	public List<BookVO> searchBook(Map<String, Object> map) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		List<BookVO> list = null;
		
		try {
			list = session.selectList("book.searchBook", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return list;
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		// 1 리턴 변수 선언
		int count = 0;
		
		// 2 count = mapper 실행
		try {
			count = sqlSession.selectOne("book.totalCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.commit();
			sqlSession.close();
		}
		
		//  3결과 리턴
		return count;
	}

	
}
