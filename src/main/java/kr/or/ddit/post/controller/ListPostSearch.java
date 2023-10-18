package kr.or.ddit.post.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.post.service.IPostService;
import kr.or.ddit.post.service.PostServiceImpl;
import kr.or.ddit.post.vo.Page2VO;
import kr.or.ddit.post.vo.PostVO;

@WebServlet("/post/listPostSearch.do")
public class ListPostSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	doPost(req, resp);
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
        IPostService service = PostServiceImpl.getInstance();

        // searchNotice를 호출하기 위한 준비 작업
        Page2VO pvo = service.pageInfo(page, searchWord);

        // 3. service메소드 호출하기 - searchNotice(map) 호출하기 - 결과값 받기
        Map<String, Object> map = new HashMap<>();
        map.put("start", pvo.getStart());
        map.put("end", pvo.getEnd());
        map.put("searchWord", searchWord);

        List<PostVO> list = service.searchPost(map);

        // 4. 결과값 request에 저장하기
        request.setAttribute("listPost", list);
        request.setAttribute("pvo", pvo);
        request.setAttribute("searchWord", searchWord);
        request.setAttribute("currentPage", page);

        // 5. view 페이지로 이동
        request.getRequestDispatcher("/post/postQa.jsp").forward(request, response);
    }
}