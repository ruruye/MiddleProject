package kr.or.ddit.post.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comment.service.CommentServiceImpl;
import kr.or.ddit.comment.service.ICommentService;
import kr.or.ddit.comment.vo.CommentVO;
import kr.or.ddit.post.service.IPostService;
import kr.or.ddit.post.service.PostServiceImpl;
import kr.or.ddit.post.vo.PostVO;


@WebServlet("/post/postDetail.do")
public class PostDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String postid = request.getParameter("postid");
		
		IPostService service = PostServiceImpl.getInstance();
		PostVO getPostDetail = service.getPostDetail(Integer.parseInt(postid));
		
		ICommentService service2 = CommentServiceImpl.getInstance();
		
		CommentVO getCommentDetail = service2.getCommentDetail(Integer.parseInt(postid));
		request.setAttribute("commentDetail", getCommentDetail);
		
        request.setAttribute("post", getPostDetail);
		
		request.getRequestDispatcher("/post/postDetail.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
