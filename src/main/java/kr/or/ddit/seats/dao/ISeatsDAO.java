package kr.or.ddit.seats.dao;

import kr.or.ddit.seats.vo.SeatResVO;

import java.util.List;

public interface ISeatsDAO {
    public SeatResVO getSeats(String id);

    public List<SeatResVO> getSeatsAll();

    public List<SeatResVO> getSeatsReversAll();

    public int insertSres(SeatResVO seatResVO);

    public int updateSres(SeatResVO seatResVO);

}
