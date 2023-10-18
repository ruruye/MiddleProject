package kr.or.ddit.loan.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.loan.service.ILoanService;
import kr.or.ddit.loan.service.LoanServiceImpl;
import kr.or.ddit.loan.vo.LoanVO;
import kr.or.ddit.member.vo.MemberVO;

/**
 * Servlet implementation class BookLoan
 */
@WebServlet("/bookLoan.ajax")
public class BookLoan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookLoan() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션에서 id 받아오기
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		// 파라미터에서 book_id받아오기
		String book_id = request.getParameter("book_id");
		LoanVO loanVO = new LoanVO(member.getMem_id(), book_id);
		
		// 보통 gson, jackson, json library를 사용해서 자바 객체를 JSON 객체로 변환시켜주는게 좋지만
		// 여기서는 간단한 JSON이기 때문에 그냥 직접 만들었음
		ILoanService loanService = LoanServiceImpl.getInstance();
		int loanInsert = loanService.loanInsert(loanVO);
		
		if(loanInsert>0) {
			response.getWriter().append("{\"loanYn\":\"y\"}");
		}else {
			response.getWriter().append("{\"loanYn\":\"n\"}");
		}
		
	}

}
