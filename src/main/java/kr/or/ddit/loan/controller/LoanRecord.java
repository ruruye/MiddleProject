package kr.or.ddit.loan.controller;

import java.io.IOException;
import java.util.List;

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

@WebServlet("/myPage/loanRecord.do")
public class LoanRecord extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ILoanService loanService = LoanServiceImpl.getInstance();
		HttpSession session = request.getSession();
        MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		List<LoanVO> loanList = loanService.loanRecordList(loginMember.getMem_id());
		request.setAttribute("loanList", loanList);
		request.getRequestDispatcher("/page/myPage/loanRecord.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
