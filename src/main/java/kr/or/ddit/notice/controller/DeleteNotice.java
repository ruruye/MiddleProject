package kr.or.ddit.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.notice.dao.INoticeDAO;
import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;


@WebServlet("/notice/deleteNotice.do")
public class DeleteNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DeleteNotice() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String noticeIdStr = request.getParameter("noticeid");
		
		int noticeId = 0; // 기본값 설정
		if (noticeIdStr != null && !noticeIdStr.isEmpty()) {
		    noticeId = Integer.parseInt(noticeIdStr);
		}
		
		INoticeService service = NoticeServiceImpl.getInstance();
		service.deleteNotice(noticeId);
		
		response.sendRedirect(request.getContextPath() + "/notice/listNoticeAdmin.do");
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
