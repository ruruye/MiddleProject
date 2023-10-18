package kr.or.ddit.admin.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.admin.vo.BlackListVO;
import kr.or.ddit.util.MyBatisSqlSessionFactory;

public class BlackListDAOImpl implements IBlackListDAO {
	
	private static IBlackListDAO blackListDAO;

    private BlackListDAOImpl() {}

    public static IBlackListDAO getInstance() {
    	// memberDAO -> IMemberDAO 니까 상위 타입
    	// MemberDAOImpl -> 상위타입을 implements한 구현체니까 하위 타입
        if(blackListDAO == null) blackListDAO = new BlackListDAOImpl();
        return blackListDAO;
    }
	

	@Override
	public List<BlackListVO> getAllBlack() {
		List<BlackListVO> blackList = null;
		 SqlSession session = null;
		
	     try {
	    	 session = MyBatisSqlSessionFactory.getSqlSession();
	    	 blackList = session.selectList("black.getAllBlack");	
	    	 
	     } finally {
	        if(session!=null) session.close();
	     }
	     return blackList;
	}
	
	

	@Override
	public int updateBlack(BlackListVO mv) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
        	int cnt = 0;

        	try {
        		cnt = session.update("black.updateBlack", mv);
        		 if(cnt>0)session.commit();
        	} finally {
        		session.close();
        	}
        System.out.println("updateBlack.cnt : " + cnt);
        return cnt;
    }

	@Override
	public int deleteblack(BlackListVO mv) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
			int cnt = 0;

	        try {
	            cnt = session.delete("black.deleteblack", mv);
	            if(cnt>0) session.commit();
	        } finally {
	            session.close();
	        }
	        System.out.println("deleteblack.cnt : " + cnt);
	        return cnt;
	    }

}
