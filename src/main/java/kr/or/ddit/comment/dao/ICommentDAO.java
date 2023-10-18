package kr.or.ddit.comment.dao;

import kr.or.ddit.comment.vo.CommentVO;
import kr.or.ddit.post.vo.PostVO;

public interface ICommentDAO {
	
	// 댓글 작성
	public int insertComment(CommentVO cvo);
	
	// 댓글 가져오기 (부분)
	public CommentVO getCommentDetail(int commId);

}
