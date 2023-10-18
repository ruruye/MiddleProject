package kr.or.ddit.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.book.service.BookServiceImpl;
import kr.or.ddit.book.service.IBookService;

@WebServlet("/book/bookDelete.do")
public class BookDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		IBookService service = BookServiceImpl.getInstance();
		
		String id = request.getParameter("id");
		int cnt = service.bookDelete(id);
		
		request.setAttribute("deleteCheck", "delete");
		response.sendRedirect(request.getContextPath() + "/book/bookMgmtPage.do");
	}

}
