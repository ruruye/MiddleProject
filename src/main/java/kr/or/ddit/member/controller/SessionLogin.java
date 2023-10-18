package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.dao.IMemberDAO;
import kr.or.ddit.member.dao.MemberDAOImpl;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.AuthorityVO;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/member/sessionLogin.do")
public class SessionLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		IMemberDAO daoImpl = MemberDAOImpl.getInstance();

		String id = request.getParameter("userId");
		String pass = request.getParameter("userPassword");
		
		AuthorityVO sendVo = new AuthorityVO();
		sendVo.setId(id);
		sendVo.setPassword(pass);

		AuthorityVO aVo = daoImpl.getAuthority(sendVo);
		String authority = null;
		if (aVo != null ) {
			authority = aVo.getAuthority();
		} 
		
		if (null == authority || "".equals(aVo.getAuthority())) {
		    request.setAttribute("loginFail", "loginFail");
		    request.getRequestDispatcher("/member/login.jsp").forward(request, response);
		    return;
		} else if ("member".equals(authority)) {
			MemberVO mv = new MemberVO();
			mv.setMem_id(id);
			mv.setMem_pw(pass);

			// DB에서 해당 ID와 패스워드가 일치하는 회원 정보를 구해온다.
			MemberVO loginMemberVO = daoImpl.loginMember(mv);
			if (loginMemberVO != null) {
				session.setAttribute("loginMember", loginMemberVO);
				session.setAttribute("user", aVo);
			}
		} else if ("admin".equals(authority)) {
			session.setAttribute("user", aVo);
		}
		response.sendRedirect(request.getContextPath() + "/book/bookList.do");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
