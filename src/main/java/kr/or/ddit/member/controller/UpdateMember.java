package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/member/upadteMember.do")
public class UpdateMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원ID에 맞는 회원 정보를 검색해서 회원 정보 수정폼에 보낸다.
		request.setCharacterEncoding("utf-8");
		
		String memId = request.getParameter("mem_id");
		
		IMemberService service = MemberServiceImpl.getInstance();
		kr.or.ddit.member.vo.MemberVO vo = service.getMember(memId);
		
		request.setAttribute("memberVo", vo);
		request.getRequestDispatcher("/member/update.jsp")
			.forward(request, response);
}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 회원 정보를 받는다.
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String add1 = request.getParameter("add1");
		String add2 = request.getParameter("add2");
		String postcode = request.getParameter("postcode");
		String birthdayyear = request.getParameter("birthday-year");
		String birthdaymonth = request.getParameter("birthday-month");
		String birthdayday = request.getParameter("birthday-day");
		String email = request.getParameter("email");
		
		// 받아온 회원 정보를 VO에 저장한다.
		MemberVO vo = new MemberVO();
		vo.setMem_id(id);
		vo.setMem_name(name);
		vo.setMem_tel(phone);
		vo.setMem_email(email);
		vo.setMem_bir(birthdayyear + birthdaymonth + birthdayday);
		vo.setMem_adrs(postcode + "_" + add1 + "_" +add2);
		
		// 회원 정보를 DB에 update 한다.
		IMemberService service = MemberServiceImpl.getInstance();
		int cnt = service.updateMember(vo);
		
		// 작업이 완료되면 List페이지로 이동
		response.sendRedirect(request.getContextPath() + "/book/bookList.do");
	}
}
