package kr.or.ddit.book.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.book.service.BookServiceImpl;
import kr.or.ddit.book.service.IBookService;
import kr.or.ddit.book.vo.BookVO;

@WebServlet("/book/bookMgmtPage.do")
public class BookMgmtPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		IBookService service = BookServiceImpl.getInstance();
		
		List<BookVO> list = service.bookList();
		
		request.setAttribute("bookList", list);
		 
		request.getRequestDispatcher("/book/bookMgmtPage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
