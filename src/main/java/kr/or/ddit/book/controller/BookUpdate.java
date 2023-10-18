package kr.or.ddit.book.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.book.service.BookServiceImpl;
import kr.or.ddit.book.service.IBookService;
import kr.or.ddit.book.vo.BookVO;
import kr.or.ddit.member.vo.AuthorityVO;

@WebServlet("/book/bookUpdate.do")
public class BookUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		
		IBookService service = BookServiceImpl.getInstance();
		
		BookVO vo = service.bookDetail(id);
		
		request.setAttribute("bookVO", vo);
	    		
		request.getRequestDispatcher("/book/bookUpdate.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String publisher  = request.getParameter("publisher");
		String publishDateStr = request.getParameter("publish-date");
		String genre = request.getParameter("genre");
		String isbn = request.getParameter("isbn");
		int price = Integer.parseInt(request.getParameter("price"));
		String callSign = request.getParameter("call-sign");
		String image = request.getParameter("image");

		 // 날짜
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    java.util.Date utilDate;
		try {
			utilDate = sdf.parse(publishDateStr);
		} catch (ParseException e) {
			utilDate = null;
			e.printStackTrace();
		}
		java.sql.Date publishDate = new java.sql.Date(utilDate.getTime());

		BookVO bookVO = 
			new BookVO(id, title, author, publisher, publishDate, genre, isbn, price, callSign);
		bookVO.setBook_img(image);
		
		IBookService service = BookServiceImpl.getInstance();
		
		int cnt = service.bookUpdate(bookVO);
		
		request.setAttribute("updateCheck", "update");
		response.sendRedirect(request.getContextPath() + "/book/bookMgmtPage.do");
	}

}
