package kr.or.ddit.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.AuthorityVO;
import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.notice.vo.NoticeVO;



@WebServlet("/notice/listNoticeAdmin.do")
public class ListNoticeAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		INoticeService service = NoticeServiceImpl.getInstance();
		List<NoticeVO> getAllNotice = service.getAllNotice();
		
		request.setAttribute("listNoticeAdmin", getAllNotice);
		
		// id가 회원인지 관리자인지 확인하는 코드
		HttpSession session = request.getSession();
		IMemberService memberService = MemberServiceImpl.getInstance();
		AuthorityVO aVo = (AuthorityVO) session.getAttribute("user");
		String check = (aVo != null) ? aVo.getAuthority() : null;
		
		
		if ("admin".equals(check)) {
			request.getRequestDispatcher("/page/admin/noticeMan.jsp").forward(request, response);
		} else {	
			request.getRequestDispatcher("/notice/notice.jsp").forward(request, response);			
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		
	}
}
