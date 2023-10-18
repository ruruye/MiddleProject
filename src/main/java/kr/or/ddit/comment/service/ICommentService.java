package kr.or.ddit.comment.service;

import kr.or.ddit.comment.vo.CommentVO;

public interface ICommentService {
	
	// 댓글 작성
	public int insertComment(CommentVO cvo);
	
	// 댓글 가져오기 (부분)
	public CommentVO getCommentDetail(int commId);

}
