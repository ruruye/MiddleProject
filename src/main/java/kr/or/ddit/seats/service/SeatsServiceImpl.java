package kr.or.ddit.seats.service;

import kr.or.ddit.seats.dao.ISeatsDAO;
import kr.or.ddit.seats.dao.SeatsDAOImpl;
import kr.or.ddit.seats.vo.SeatResVO;

import java.util.List;

public class SeatsServiceImpl implements ISeatsService {
    // 싱글톤
    private static ISeatsService service;
    private final ISeatsDAO dao;
    private SeatsServiceImpl() {
        dao = SeatsDAOImpl.getInstance();
    }
    public static ISeatsService getInstance() {
        if(service == null) service = new SeatsServiceImpl();
        return service;
    }

    @Override
    public SeatResVO getSeats(String id) {
        return dao.getSeats(id);
    }

    @Override
    public List<SeatResVO> getSeatsAll() {
        return dao.getSeatsAll();
    }

    @Override
    public List<SeatResVO> getSeatsReversAll() {
        return dao.getSeatsReversAll();
    }
    @Override
    public int insertSres(SeatResVO seatResVO) {
        return dao.insertSres(seatResVO);
    }

    @Override
    public int updateSres(SeatResVO seatResVO) {
        return dao.updateSres(seatResVO);
    }
}
