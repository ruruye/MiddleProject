package kr.or.ddit.notice.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.AuthorityVO;
import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.notice.vo.PageVO;

@WebServlet("/notice/listNoticeSearch.do")
public class ListNoticeSearch extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ListNoticeSearch() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        int page = 1;

        // 1. 요청 시 전송데이터 받기 - 페이지 번호, 검색 시 searchWord
        String strPage = request.getParameter("page");
        if (strPage != null) {
            page = Integer.parseInt(strPage);
        }

        String searchWord = request.getParameter("searchWord");

        // 2. service객체 얻기
        INoticeService service = NoticeServiceImpl.getInstance();

        // searchNotice를 호출하기 위한 준비 작업
        PageVO pvo = service.pageInfo(page, searchWord);

        // 3. service메소드 호출하기 - searchNotice(map) 호출하기 - 결과값 받기
        Map<String, Object> map = new HashMap<>();
        map.put("start", pvo.getStart());
        map.put("end", pvo.getEnd());
        map.put("searchWord", searchWord);

        List<NoticeVO> list = service.searchNotice(map);

        // 4. 결과값 request에 저장하기
        request.setAttribute("listNotice", list);
        request.setAttribute("pvo", pvo);
        request.setAttribute("searchWord", searchWord);
        request.setAttribute("currentPage", page);
        
        // 5. view 페이지로 이동
        // response.sendRedirect(request.getContextPath() + "/notice/listNotice.do");
        // id가 회원인지 관리자인지 확인하는 코드
 		HttpSession session = request.getSession();
 		IMemberService memberService = MemberServiceImpl.getInstance();
 		AuthorityVO aVo = (AuthorityVO) session.getAttribute("user");
 		String check = (aVo != null) ? aVo.getAuthority() : null;
 		
 		if ("admin".equals(check)) {
 			request.getRequestDispatcher("/page/admin/noticeMan.jsp").forward(request, response);
 		} else {	
 			request.getRequestDispatcher("/notice/notice.jsp").forward(request, response);			
 		}
        
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	doPost(req, resp);
    }
}
