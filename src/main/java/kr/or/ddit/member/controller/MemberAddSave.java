package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/member/memberAddSave.do")
public class MemberAddSave extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//request.getRequestDispatcher("/member/memberAdd.jsp").forward(request, response);
		response.sendRedirect(request.getContextPath() + "/member/login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int cnt = 0;


		// 전달받은 데이터 추출
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String add1 = request.getParameter("add1");
		String add2 = request.getParameter("add2");
		String postcode = request.getParameter("postcode");
		String birthdayyear = request.getParameter("birthday-year");
		String birthdaymonth = request.getParameter("birthday-month");
		String birthdayday = request.getParameter("birthday-day");
		String email = request.getParameter("email");

		MemberVO vo = new MemberVO();
		
		vo.setMem_id(id);
		vo.setMem_pw(password);
		vo.setMem_name(name);
		vo.setMem_tel(phone);
		vo.setMem_email(email);
		vo.setMem_bir(birthdayyear + birthdaymonth + birthdayday);
		vo.setMem_adrs(postcode + "_" + add1 + "_" +add2);
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		cnt = service.joinMember(vo);
		
		
		response.sendRedirect(request.getContextPath() + "/member/login.jsp");
		
	}
}
