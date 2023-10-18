package kr.or.ddit.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.book.service.BookServiceImpl;
import kr.or.ddit.book.service.IBookService;
import kr.or.ddit.book.vo.BookVO;


@WebServlet("/book/bookDetail.do")
public class BookDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookId  = request.getParameter("id");
		
		IBookService service = BookServiceImpl.getInstance();
		
		BookVO vo = service.bookDetail(bookId);
		
		request.setAttribute("requestDetail", vo);
		
		request.getRequestDispatcher("/introduce/bookdetail.jsp").forward(request, response);
		
		
		
	}

}
