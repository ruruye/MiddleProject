package kr.or.ddit.book.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.book.service.BookServiceImpl;
import kr.or.ddit.book.service.IBookService;
import kr.or.ddit.book.vo.BookVO;
import kr.or.ddit.notice.vo.PageVO;


/**
 * Servlet implementation class listBookSearch
 */
@WebServlet("/book/listBookSearch.do")
public class listBookSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public listBookSearch() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		int page = 1;
		
		// 1. 요청 시 전송데이터 받기 - 페이지 번호, 검색 시 searchWord
        String strPage = request.getParameter("page");
        if (strPage != null) {
            page = Integer.parseInt(strPage);
        }

        String searchWord = request.getParameter("searchWord");

        // 2. service객체 얻기
        IBookService service = BookServiceImpl.getInstance();

        // searchNotice를 호출하기 위한 준비 작업
        PageVO pvo = service.pageInfo(page, searchWord);

        // 3. service메소드 호출하기 - searchNotice(map) 호출하기 - 결과값 받기
        Map<String, Object> map = new HashMap<>();
        map.put("start", pvo.getStart());
        map.put("end", pvo.getEnd());
        map.put("searchWord", searchWord);

        List<BookVO> list = service.searchBook(map);

        // 4. 결과값 request에 저장하기
        request.setAttribute("listBook", list);
        
        String test = "[";
        
        /*
        int i=0;
        for (NoticeVO noticeVO : list) {
        	i++;
			test += noticeVO.toJsonString();
			if(i < list.size()) {
				test += ",";				
			}
		}
        test += "]";
       
        
        response.getWriter().write(test);
        */
        
//        request.setAttribute("pvo", pvo);

        // 5. view 페이지로 이동
        request.getRequestDispatcher("/introduce/bookSearch.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
