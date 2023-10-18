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
import kr.or.ddit.member.vo.MemberVO;



@WebServlet("/LibraryLogin.do")
public class LibraryLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// http 요청 보낼 때
	// url 상세 주소
	// method 
	// body
	
	// 함수 호출하는거라고 생각하면
	// 내가 원하는 함수를 호출하는지 먼저 확인해
	// 원하는 함수에 원하는 변수가 들어갔는지 확인해
	// 아이디, 비번을 넣어야 함
	
//	DB에서 해당 ID와 패스워드가 일치하는 회원 정보를 구해온다.
//		MemberDaoImpl dao = MemberDaoImpl.getInstance(); // Dao객체
		
//		MemberVO loginMemVo = dao.getLoginMember(memVo);
		
//		
//		HttpSession session = request.getSession();
		
//		if(loginMemVo!=null) {	//	로그인 성공
//			session.setAttribute("loginMember", loginMemVo);
//		}
		
//		response.sendRedirect(request.getContextPath()
//				+ "/basic/session/sessionLoginDB.jsp");
//	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userid = request.getParameter("userName");
		String pass = request.getParameter("userPassword");
		
		MemberVO memVo = new MemberVO();
		memVo.setMem_id(userid);
		memVo.setMem_pw(pass);
		// 부모 객체 타입에 자식 객체 넣는 경우 -> O
		// 자식 객체 타입에 부모 객체 넣는 경우 -> X
		// getInstance IMemberDao 반환
		// MemberDaoImpl
		// IMemberDao를 구현한게 MemberDAOImpl
		// 어떤게 상위 타입 -> IMemberDao
		// 어떤게 하위 타입 -> MemberDAOImpl
		// 하위타입 -> 상위 타입을 넣으려고 함 -> X
		
		
		IMemberService service = MemberServiceImpl.getInstance();
		MemberVO loginMemVo = service.loginMember(memVo);
		
		HttpSession session = request.getSession();
		
		
		
		if(loginMemVo!=null) { // 로그인 성공 
			session.setAttribute("loginMember", loginMemVo);
		
		}
		
		response.sendRedirect(request.getContextPath() +"/member/login_ok.jsp");
		
		 
		
		
		
		
		// 아이디로 데이터베이스에서 정보 가져와
		
//		System.out.println("userid : " + userid);
//		System.out.println("pass : " + pass);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("call doPost~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		doGet(request, response);
	}

}
