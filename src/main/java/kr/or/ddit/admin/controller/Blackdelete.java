package kr.or.ddit.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.admin.service.BlackListServiceImpl;
import kr.or.ddit.admin.service.IBlackListService;
import kr.or.ddit.admin.vo.BlackListVO;



@WebServlet("/Blackdelete.do")
public class Blackdelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
request.setCharacterEncoding("utf-8");
		
		IBlackListService service = BlackListServiceImpl.getInstance();
		
		String blackId = request.getParameter("blackId");
		
		System.out.println("blackid값 잘보내졌니 : " + blackId);
		BlackListVO mv = new BlackListVO();
		
		mv.setBlack_id(blackId);
		System.out.println("나는 mv값이야: " + mv);
		int blackdelete = service.deleteblack(mv);
		
		System.out.println("나는 서비스 처리값 : " + blackdelete);
		
		
		if(blackdelete != 0) {
			response.sendRedirect(request.getContextPath() +"blacklistMan.jsp");
		}else {
			
			System.out.println("삭제 실패!!!");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

