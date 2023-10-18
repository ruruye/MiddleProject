package kr.or.ddit.admin.service;

import java.util.List;

import kr.or.ddit.admin.dao.BlackListDAOImpl;
import kr.or.ddit.admin.dao.IBlackListDAO;
import kr.or.ddit.admin.vo.BlackListVO;


public class BlackListServiceImpl implements IBlackListService {
	private static IBlackListService blackListService;
    private IBlackListDAO dao;

	
	private BlackListServiceImpl() {
        dao = BlackListDAOImpl.getInstance();
    }

    public static IBlackListService getInstance() {
        if(blackListService == null) blackListService = new BlackListServiceImpl();
        return blackListService;
    }
	

	@Override
	public List<BlackListVO> getAllBlack() {
		// TODO Auto-generated method stub
		return dao.getAllBlack();
	}

	@Override
	public int updateBlack(BlackListVO mv) {
		// TODO Auto-generated method stub
		return dao.updateBlack(mv);
	}

	@Override
	public int deleteblack(BlackListVO mv) {
		// TODO Auto-generated method stub
		return dao.deleteblack(mv);
	}

}
