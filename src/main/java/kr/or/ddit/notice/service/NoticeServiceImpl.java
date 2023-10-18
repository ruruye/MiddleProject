package kr.or.ddit.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.notice.dao.INoticeDAO;
import kr.or.ddit.notice.dao.NoticeDAOImpl;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.notice.vo.PageVO;

public class NoticeServiceImpl implements INoticeService {

	private static INoticeService noticeService;
	
	private INoticeDAO dao;
	
	private NoticeServiceImpl() {
		dao = NoticeDAOImpl.getInstance();
	}
	
	public static INoticeService getInstance() {
		if(noticeService == null) noticeService = new NoticeServiceImpl();
		return noticeService;
	}
	
	@Override
	public List<NoticeVO> getAllNotice() {
		return dao.getAllNotice();
	}

	@Override
	public List<NoticeVO> searchNotice(Map<String, Object> map) {
		return dao.searchNotice(map);
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		return dao.totalCount(map);
	}

	@Override
	public int updateRdcnt(int num) {
		return dao.updateRdcnt(num);
	}

	@Override
	public PageVO pageInfo(int page, String searchWord) {
		Map<String, Object> map = new HashMap<>();
		map.put("searchWord", searchWord);
		
		int count = this.totalCount(map);
		
		// 전체 페이지수 구하기
		int totalPage = (int) Math.ceil((double)count/PageVO.getPerList());

		// start, end
		int start = (page-1) * PageVO.getPerList() +1;
		int end = start + PageVO.getPerList() -1;
		if(end > count) end = count;
		
		// startPage, endPage
		int perPage = PageVO.getPerPage();
		int startPage = ((page-1) / perPage * perPage) +1;
		int endPage = startPage + perPage -1;
		if(endPage > totalPage) endPage = totalPage;
		
		System.out.println("start = " + start);
		System.out.println("end = " + end);
		System.out.println("startPage = " + startPage);
		System.out.println("endPage = " + endPage);
		System.out.println("totalPage = " + totalPage);
		
		PageVO pvo = new PageVO();
		
		pvo.setStart(start);
		pvo.setEnd(end);
		pvo.setStartPage(startPage);
		pvo.setEndPage(endPage);
		pvo.setTotalPage(totalPage);
		
		return pvo;
	}

	@Override
	public NoticeVO getNoticeDetail(int id) {
		return dao.getNoticeDetail(id);
	}

	@Override
	public int insertNotice(NoticeVO vo) {
		return dao.insertNotice(vo);
	}

	@Override
	public int deleteNotice(int noticeId) {
		return dao.deleteNotice(noticeId);
	}


	
}
