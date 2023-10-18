package kr.or.ddit.loan.service;

import java.util.List;

import kr.or.ddit.loan.dao.ILoanDAO;
import kr.or.ddit.loan.dao.LoanDAOImpl;
import kr.or.ddit.loan.vo.LoanVO;

public class LoanServiceImpl implements ILoanService {
    private static ILoanService bookService;
    private final ILoanDAO dao;

    private LoanServiceImpl(){
        dao = LoanDAOImpl.getInstance();
    }

    public static ILoanService getInstance() {
        if(bookService == null) bookService = new LoanServiceImpl();
        return bookService;
    }

    @Override
    public List<LoanVO> loanRecordList(String mem_id) {
        return dao.loanRecordList(mem_id);
    }

    @Override
    public LoanVO bookDetail(String bookId) {
        return dao.bookDetail(bookId);
    }

    @Override
    public int loanInsert(LoanVO loanVO) {
        return dao.loanInsert(loanVO);
    }

    @Override
    public int loanUpdate(LoanVO loanVO) {
        return dao.loanUpdate(loanVO);
    }

    @Override
    public int loanDelete(String bookId) {
        return dao.loanDelete(bookId);
    }

	@Override
	public List<LoanVO> returnRecordList(String mem_id) {
		// TODO Auto-generated method stub
		return dao.returnRecordList(mem_id);
	}
}
