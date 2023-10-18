package kr.or.ddit.comment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comment.service.CommentServiceImpl;
import kr.or.ddit.comment.service.ICommentService;
import kr.or.ddit.comment.vo.CommentVO;


@WebServlet("/comment/commentAdd2.do")
public class CommentAdd2 extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/page/admin/postCommentAdd.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		/*
        post_id: location.href.split("?")[1].split("=")[1], // 임시 대응
        comm_cn: commContent.val().trim(),
        admin_id: 'a123'
        */ 
		
		
		// 입력한 정보 받기
		String commCn = request.getParameter("comm_cn");
		String postId = request.getParameter("post_id");
		String adminId = request.getParameter("admin_id");
		
		
		// 받아온 정보 저장하기
		CommentVO cvo = new CommentVO();
		cvo.setAdmin_id(adminId);
		cvo.setComm_cn(commCn);
		cvo.setPost_id(Integer.parseInt(postId));
		
		ICommentService service = CommentServiceImpl.getInstance();
		service.insertComment(cvo);
		
		response.getWriter().write("success");
		
	    //response.sendRedirect(request.getContextPath() + "/comment/commentAdd.do");
	}

}
