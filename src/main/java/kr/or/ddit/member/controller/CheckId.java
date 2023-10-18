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


@WebServlet("/member/checkId.do")
public class CheckId extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// 전달받은 ID 값을 가져옵니다.
        String id = request.getParameter("id");
        
        IMemberService service = MemberServiceImpl.getInstance();
        MemberVO vo = service.getMember(id);
        

        // 응답을 반환합니다
        if (vo == null) {
            response.getWriter().write("중복");
		} else {
            response.getWriter().write("중복아님");
		}
	}
}
