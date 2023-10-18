package kr.or.ddit.seats.controller;

import java.io.IOException;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.seats.service.ISeatsService;
import kr.or.ddit.seats.service.SeatsServiceImpl;
import kr.or.ddit.seats.vo.SeatResVO;

@WebServlet("/seats/seatReturn.do")
public class SeatReturn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		ISeatsService seatsService = SeatsServiceImpl.getInstance();
		SeatResVO vo = new SeatResVO();

		String seatId = request.getParameter("seatId");
		
		// 현재 시각 가져오기
		LocalTime currentTime = LocalTime.now();

		// 분을 버리고 시간을 24시간 표기법으로 변환
		LocalTime roundedTime = currentTime.withMinute(0);

		// 오후 시간인 경우에만 12를 더해줌
		if (roundedTime.getHour() >= 12) {
		    roundedTime = roundedTime.plusHours(12);
		}

		// "HH:mm" 형식으로 시간을 문자열로 변환
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
		String endTime = roundedTime.format(formatter);
		
		vo.setSres_id(seatId);
		vo.setEnd_time(endTime);
		
		int cnt = seatsService.updateSres(vo);
		
		HttpSession session = request.getSession();
		session.setAttribute("returnCheck", "returnCheck");
		
		response.sendRedirect(request.getContextPath() + "/seats/seatsAdminList.do");
	}

}
