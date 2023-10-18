package kr.or.ddit.notice.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.notice.vo.NoticeVO;

public interface INoticeDAO {
	
	public List<NoticeVO> getAllNotice();
	
	// 검색
	public List<NoticeVO> searchNotice(Map<String, Object> vo);
	
	// 전체 글 개수 구하기
	public int totalCount(Map<String, Object> map);
	
	// 조회수 증가하기
	public int updateRdcnt(int num);
	
	// 부분 공지사항글 조회하기
	public NoticeVO getNoticeDetail(int id);
	
	// 공지 작성하기
	public int insertNotice(NoticeVO vo);
	
	// 공지사항 삭제하기
    public int deleteNotice(int noticeId);

}
