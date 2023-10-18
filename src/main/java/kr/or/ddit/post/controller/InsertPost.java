package kr.or.ddit.post.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.post.service.IPostService;
import kr.or.ddit.post.service.PostServiceImpl;
import kr.or.ddit.post.vo.PostVO;


@WebServlet("/post/insertPost.do")
public class InsertPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/post/writeQa.jsp").forward(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		// 입력한 정보 받기
		String postTit = request.getParameter("title");
		String postCn = request.getParameter("content");
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("loginMember");
		
		// 받아온 정보 저장하기
		PostVO postVo = new PostVO();
		postVo.setMem_id(memberVO.getMem_id());
		postVo.setPost_tit(postTit);
		postVo.setPost_cn(postCn);
		postVo.setPost_category("질문");
		
		IPostService service = PostServiceImpl.getInstance();
		service.insertPost(postVo);
		
		response.sendRedirect(request.getContextPath()+ "/post/listPostSearch.do");
		
	}

}
