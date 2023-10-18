package kr.or.ddit.loan.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.loan.vo.LoanVO;
import kr.or.ddit.util.MyBatisSqlSessionFactory;

public class LoanDAOImpl implements ILoanDAO {
    private static ILoanDAO dao;

    private LoanDAOImpl() {}

    public static ILoanDAO getInstance() {
        if(dao == null) dao = new LoanDAOImpl();
        return dao;
    }

    @Override
    public List<LoanVO> loanRecordList(String mem_id) {
        SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
        List<LoanVO> list = null;

        try {
           list = session.selectList("loans.LoansRecord", mem_id);
        } finally {
            session.close();
        }
        System.out.println("loanRecord.list : " + list);

        return list;
    }

    @Override
    public LoanVO bookDetail(String bookId) {
        SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
        LoanVO loanVO = null;
        try {
            loanVO = session.selectOne("book.bookDetail", bookId);
        } finally {
            session.close();
        }
        System.out.println("bookDetail.bookVO : " + loanVO);
        return loanVO;
    }

    @Override
    public int loanInsert(LoanVO loanVO) {
        SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
        int cnt = 0;

         try {
            cnt = session.insert("loans.LoanInsert", loanVO);
            session.commit();
        } finally {
            session.close();
        }
        System.out.println("LoanInsert.cnt : " + cnt);
        return cnt;
    }

    @Override
    public int loanUpdate(LoanVO loanVO) {
        SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
        int cnt = 0;
        try {
            cnt = session.update("loans.ReturnUpdate", loanVO);
            session.commit();
        } finally {
            session.close();
        }
        System.out.println("bookUpdate.cnt : " + cnt);

        return cnt;
    }

    @Override
    public int loanDelete(String bookId) {
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
	public List<LoanVO> returnRecordList(String mem_id) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
        List<LoanVO> list = null;

        try {
           list = session.selectList("loans.ReturnRecord", mem_id);
        } finally {
            session.close();
        }
        System.out.println("ReturnRecord.list : " + list);

        return list;
	}
}
