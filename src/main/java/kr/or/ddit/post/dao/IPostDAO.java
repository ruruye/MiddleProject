package kr.or.ddit.post.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.post.vo.PostVO;

public interface IPostDAO {
	
	// 글 작성
	public int insertPost(PostVO pvo);
	
	// 글 목록 가져오기
	public List<PostVO> getAllPost();
	
	// 글 삭제하기
	public int deletePost(int postId);
	
	// 글 가져오기 (부분)
	public PostVO getPostDetail(int postId);
	
	// 검색
	public List<PostVO> searchPost(Map<String , Object> map);
	
	// 전체 글 개수 구하기
	public int totalCount(Map<String , Object> map);
	
	//조회수 증가하기
	public int updateRdcnt(int num);


}
