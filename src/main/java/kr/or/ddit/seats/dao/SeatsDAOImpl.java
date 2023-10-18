package kr.or.ddit.seats.dao;

import kr.or.ddit.seats.vo.SeatResVO;
import kr.or.ddit.util.MyBatisSqlSessionFactory;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class SeatsDAOImpl implements ISeatsDAO{
    // 싱글톤
    private static ISeatsDAO dao;
    private SeatsDAOImpl() {}
    public static ISeatsDAO getInstance() {
        if (dao == null) dao = new SeatsDAOImpl();
        return dao;
    }

    @Override
    public SeatResVO getSeats(String id) {
        SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
        SeatResVO vo = null;

        try {
            vo = session.selectOne("seats.getSeats", id);
        } finally {
            if (session != null) session.close();
        }
        return vo;
    }

    @Override
    public List<SeatResVO> getSeatsAll() {
        SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
        List<SeatResVO> list = null;

        try {
			list = session.selectList("seats.getSeatsAll");
		} finally {
            if (session != null) session.close();
        }
        return list;
    }

    @Override
    public List<SeatResVO> getSeatsReversAll() {
        SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
        List<SeatResVO> list = null;

        try {
            list = session.selectList("seats.getSeatsAll");
        } finally {
            if (session != null) session.close();
        }
        return list;
    }


    @Override
    public int insertSres(SeatResVO seatResVO) {
        SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
    	int cnt = 0;

    	try {
			cnt = session.insert("seats.insertSres",seatResVO);
            session.commit();
		} finally {
            if (session != null) session.close();
		}

        return cnt;
    }

    @Override
    public int updateSres(SeatResVO seatResVO) {
        SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
        int cnt = 0;

        try {
            cnt = session.insert("seats.updateSres",seatResVO);
            session.commit();
        } finally {
            if (session != null) session.close();
        }

        return cnt;
    }
}
