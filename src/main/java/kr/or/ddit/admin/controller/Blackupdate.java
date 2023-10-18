package kr.or.ddit.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.admin.service.BlackListServiceImpl;
import kr.or.ddit.admin.service.IBlackListService;
import kr.or.ddit.admin.vo.BlackListVO;



@WebServlet("/Blackupdate.do")
public class Blackupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
request.setCharacterEncoding("utf-8");
		
		IBlackListService service = BlackListServiceImpl.getInstance();
		
		String memId = request.getParameter("memId");
		String blankReason = request.getParameter("blankReason");
		
		System.out.println("memId값 잘보내졌니 : " + memId);
		System.out.println("이유값 잘보내졌니 : " + blankReason);
		
		
		BlackListVO mv = new BlackListVO();
		
		mv.setMem_id(memId);
		mv.setBlank_reason(blankReason);
		
		System.out.println("나는 mv값이야: " + mv);
		int blackupdate = service.updateBlack(mv);
		
		System.out.println("나는 서비스 처리값 : " + blackupdate);
		
		//결과값을 저장
		request.setAttribute("result", blackupdate);
				
				
		//view페이지로 이동
		request.getRequestDispatcher("/page/admin/result.jsp")
					.forward(request, response);
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
