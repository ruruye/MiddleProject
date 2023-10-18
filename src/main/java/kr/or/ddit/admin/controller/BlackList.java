package kr.or.ddit.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.admin.service.BlackListServiceImpl;
import kr.or.ddit.admin.service.IBlackListService;
import kr.or.ddit.admin.vo.BlackListVO;




@WebServlet("/BlackList.do")
public class BlackList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IBlackListService service = BlackListServiceImpl.getInstance();
		
		List<BlackListVO> blackList = service.getAllBlack();
		
		request.setAttribute("blackList", blackList);
		
		request.getRequestDispatcher("/page/admin/blacklistMan.jsp")
		.forward(request, response);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
