package kr.or.ddit.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.notice.vo.NoticeVO;

@WebServlet("/notice/insertNotice.do")
public class InsertNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertNotice() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/page/admin/noticeWrite.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
		
		// 입력한 정보 받기
		String noticeTit = request.getParameter("title");
		String noticeCn = request.getParameter("content");
		
		// 받아온 정보 저장하기
		NoticeVO noticeVo = new NoticeVO();
		
		noticeVo.setAdmin_id("admin");
        noticeVo.setNotice_tit(noticeTit);
        noticeVo.setNotice_cn(noticeCn);
		
		INoticeService service = NoticeServiceImpl.getInstance();
		service.insertNotice(noticeVo);
		
		response.sendRedirect(request.getContextPath() + "/notice/listNoticeAdmin.do");
	}

}
