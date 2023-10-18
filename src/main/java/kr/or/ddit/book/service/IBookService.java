package kr.or.ddit.book.service;

import kr.or.ddit.book.vo.BookVO;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.notice.vo.PageVO;

import java.util.List;
import java.util.Map;

public interface IBookService {
    // 도서 전체 목록
    public List<BookVO> bookList();
    
    // 도서 전체 목록
    public List<BookVO> bookListNine();

    // 도서 세부 사항
    public BookVO bookDetail(String bookId);

    // 도서 입고
    public int  bookInsert(BookVO bookVO);
    
    // 도서 수정
    public int  bookUpdate(BookVO bookVO);
    
    // 도서 삭제
    public int  bookDelete(String bookId);
    
    // 도서 검색
 	public List<BookVO> searchBook(Map<String, Object> map);
 	
 	//
 	public PageVO pageInfo(int page, String searchWord);
 	
 	// 전체 글 개수 구하기
 	public int totalCount(Map<String, Object> map);
}
