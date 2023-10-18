package kr.or.ddit.post.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.post.dao.IPostDAO;
import kr.or.ddit.post.dao.PostDAOImpl;
import kr.or.ddit.post.vo.Page2VO;
import kr.or.ddit.post.vo.PostVO;

public class PostServiceImpl implements IPostService {
	
	private static IPostService postService;
	private IPostDAO dao;
	
	private PostServiceImpl() {
		dao = PostDAOImpl.getInstance();
	}
	
	public static IPostService getInstance() {
		if(postService == null) postService = new PostServiceImpl();
		return postService;
	}
	
	@Override
	public int insertPost(PostVO pvo) {
		// TODO Auto-generated method stub
		return dao.insertPost(pvo);
	}

	@Override
	public List<PostVO> getAllPost() {
		// TODO Auto-generated method stub
		return dao.getAllPost();
	}

	@Override
	public int deletePost(int postId) {
		// TODO Auto-generated method stub
		return dao.deletePost(postId);
	}

	@Override
	public PostVO getPostDetail(int postId) {
		// TODO Auto-generated method stub
		return dao.getPostDetail(postId);
	}

	@Override
	public List<PostVO> searchPost(Map<String, Object> map) {
		return dao.searchPost(map);
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		return dao.totalCount(map);
	}

	@Override
	public Page2VO pageInfo(int page, String searchWord) {
		Map<String, Object> map = new HashMap<>();
		map.put("searchWord", searchWord);
		
		int count = this.totalCount(map);
		
		// 전체 페이지 수 구하기
		int totalPage = (int) Math.ceil((double)count/Page2VO.getPerList());
		
		// start, end
		int start = (page-1) * Page2VO.getPerList() + 1;
		int end = start + Page2VO.getPerList() - 1;
		if(end > count) end = count;
		
		// startPage, endPage
		int perPage = Page2VO.getPerPage();
		int startPage = ((page-1) / perPage * perPage) + 1;
		int endPage = startPage + perPage -1;
		if(endPage > totalPage) endPage = totalPage;
		
		System.out.println("start = " + start);
		System.out.println("end = " + end);
		System.out.println("startPage = " + startPage);
		System.out.println("endPage = " + endPage);
		System.out.println("totalPage = " + totalPage);
		
		Page2VO pvo = new Page2VO();
		
		pvo.setStart(start);
		pvo.setEnd(end);
		pvo.setStartPage(startPage);
		pvo.setEndPage(endPage);
		pvo.setTotalPage(totalPage);
		
		return pvo;
		
	}

	@Override
	public int updateRdcnt(int num) {
		// TODO Auto-generated method stub
		return dao.updateRdcnt(num);
	}

}
