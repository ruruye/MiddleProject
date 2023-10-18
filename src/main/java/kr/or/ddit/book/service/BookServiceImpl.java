package kr.or.ddit.book.service;

import kr.or.ddit.book.dao.BookDAOImpl;
import kr.or.ddit.book.dao.IBookDAO;
import kr.or.ddit.book.vo.BookVO;
import kr.or.ddit.notice.vo.PageVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BookServiceImpl implements IBookService {
    private static IBookService bookService;
    private final IBookDAO dao;

    private BookServiceImpl(){
        dao = BookDAOImpl.getInstance();
    }

    public static IBookService getInstance() {
        if(bookService == null) bookService = new BookServiceImpl();
        return bookService;
    }

    @Override
    public List<BookVO> bookList() {
        return dao.bookList();
    }

    @Override
	public List<BookVO> bookListNine() {
    	return dao.bookListNine();
	}
    
    @Override
    public BookVO bookDetail(String bookId) {
        return dao.bookDetail(bookId);
    }

    @Override
    public int bookInsert(BookVO bookVO) {
        return dao.bookInsert(bookVO);
    }

    @Override
    public int bookUpdate(BookVO bookVO) {
        return dao.bookUpdate(bookVO);
    }

    @Override
    public int bookDelete(String bookId) {
        return dao.bookDelete(bookId);
    }

	@Override
	public List<BookVO> searchBook(Map<String, Object> map) {
		return dao.searchBook(map);
	}
	
	@Override
	public PageVO pageInfo(int page, String searchWord) {
		
		// 전체 글 갯수 구하기
		Map<String, Object> map = new HashMap<>();
		map.put("searchWord", searchWord);
		
		int count = this.totalCount(map);
		
		// 전체페이지 수 구하기
		int totalPage = (int)Math.ceil((double) count / PageVO.getPerList());
		
		// start, end
		int start = (page-1) * PageVO.getPerList() + 1;
		int end = start + PageVO.getPerList() - 1;
		if(end > count) end = count;
		
		// startPage, endPage
		int perPage = PageVO.getPerPage();
		int startPage = ((page-1) / perPage * perPage) + 1;
		int endPage = startPage + perPage -1;
		if(endPage > totalPage) endPage  = totalPage;
		
		System.out.println("start=" + start);
		System.out.println("end=" + end);
		System.out.println("startPage=" + startPage);
		System.out.println("endPage=" + endPage);
		System.out.println("totalPage=" + totalPage);
		
		PageVO pvo = new PageVO();
		
		pvo.setStart(start);
		pvo.setEnd(end);
		pvo.setStartPage(startPage);
		pvo.setEndPage(endPage);
		pvo.setTotalPage(totalPage);
		
		
		return pvo;
	}
	
	
	@Override
	public int totalCount(Map<String, Object> map) {
		return dao.totalCount(map);
	}

	
}
