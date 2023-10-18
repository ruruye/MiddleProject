package kr.or.ddit.comment.service;

import kr.or.ddit.comment.dao.CommentDAOImpl;
import kr.or.ddit.comment.dao.ICommentDAO;
import kr.or.ddit.comment.vo.CommentVO;

public class CommentServiceImpl implements ICommentService {
	
	private static ICommentService commentService;
	private ICommentDAO dao;
	
	private CommentServiceImpl() {
		dao = CommentDAOImpl.getInstance();
	}
	
	public static ICommentService getInstance() {
		if(commentService == null) commentService = new CommentServiceImpl();
		return commentService;
	}

	@Override
	public int insertComment(CommentVO cvo) {
		// TODO Auto-generated method stub
		return dao.insertComment(cvo);
	}

	@Override
	public CommentVO getCommentDetail(int commId) {
		// TODO Auto-generated method stub
		return dao.getCommentDetail(commId);
	}


}
