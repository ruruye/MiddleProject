package kr.or.ddit.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;


@WebServlet("/notice/listNoticeRdcnt.do")
public class ListNoticeRdcnt extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 요청 시 num 받기
        int num = Integer.parseInt(request.getParameter("num"));

        INoticeService service = NoticeServiceImpl.getInstance();

        int res = service.updateRdcnt(num);

        request.setAttribute("res", res);

        request.getRequestDispatcher("/notice/notice.jsp").forward(request, response);
    }
}


