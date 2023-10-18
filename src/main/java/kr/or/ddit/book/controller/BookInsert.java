package kr.or.ddit.book.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.book.service.BookServiceImpl;
import kr.or.ddit.book.service.IBookService;
import kr.or.ddit.book.vo.BookVO;

@WebServlet("/book/bookInsert.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10MB 식
	maxFileSize = 1024 * 1024 * 30, // 30MB
	maxRequestSize = 1024 * 1024 * 100 // 100MB
)
public class BookInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
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
			new BookVO(title, author, publisher, publishDate, genre, isbn, price, callSign);
		
		
		// 이미지 파일
		String uploadPath = getServletContext().getRealPath("/images");
		File uploadDir = new File(uploadPath);

		// 업로드 디렉토리가 존재하지 않을 경우 생성
		if (!uploadDir.exists()) {
		    uploadDir.mkdirs();
		}

		if (image != null && !image.isEmpty()) {
		    // 이미지 파일을 업로드 디렉토리에 저장
		    String filePath = uploadPath + File.separator + image;
		    File uploadedFile = new File(filePath);

	        // DB에 저장된 이미지 파일명을 업데이트
	        bookVO.setBook_img(image);
		}
		
		IBookService service = BookServiceImpl.getInstance();
		int cnt = service.bookInsert(bookVO);
		
		response.sendRedirect(request.getContextPath() + "/book/bookMgmtPage.do");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
