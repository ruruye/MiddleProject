package kr.or.ddit.post.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.post.service.IPostService;
import kr.or.ddit.post.service.PostServiceImpl;


@WebServlet("/post/deletePost.do")
public class DeletePost extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int postId = Integer.parseInt(request.getParameter("postid"));
		
		IPostService service = PostServiceImpl.getInstance();
		service.deletePost(postId);
		
		response.sendRedirect(request.getContextPath() + "/manager/listPostAdmin.do");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
