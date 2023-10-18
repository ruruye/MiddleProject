package kr.or.ddit.loan.service;

import java.util.List;

import kr.or.ddit.loan.vo.LoanVO;

public interface ILoanService {
    // 도서 전체 목록
    public List<LoanVO> loanRecordList(String mem_id);
    
    // 반납 연제 목록
    public List<LoanVO> returnRecordList(String mem_id);

    // 도서 세부 사항
    public LoanVO bookDetail(String bookId);

    // 도서 입고
    public int  loanInsert(LoanVO loanVO);
    
    // 도서 반납
    public int  loanUpdate(LoanVO loanVO);
    
    // 도서 삭제
    public int  loanDelete(String bookId);
}
