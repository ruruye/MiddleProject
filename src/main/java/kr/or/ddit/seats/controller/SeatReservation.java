package kr.or.ddit.seats.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.seats.service.ISeatsService;
import kr.or.ddit.seats.service.SeatsServiceImpl;
import kr.or.ddit.seats.vo.SeatResVO;

@WebServlet("/seats/seatReservation.do")
public class SeatReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		ISeatsService seatsService = SeatsServiceImpl.getInstance();
		SeatResVO vo = new SeatResVO();
		int cnt = 0;

		String id = request.getParameter("userId");
		String selectedSeat = request.getParameter("selectedSeat");
		String date = request.getParameter("dateInput");
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");

		selectedSeat = "1-"+selectedSeat;
		
		vo.setMem_id(id);
		vo.setSeats_id(selectedSeat);
		// 문자열을 java.sql.Date로 변환
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date parsed;
		try {
		    parsed = format.parse(date);
		    Date toDate = new Date(parsed.getTime());

		    vo.setSres_date(toDate);
		} catch (ParseException e) {
		    e.printStackTrace();
		}
		vo.setStart_time(startTime);
		vo.setEnd_time(endTime);
	
		SeatResVO checkVo = seatsService.getSeats(id);
		if (checkVo != null) {
			HttpSession session = request.getSession();
			session.setAttribute("message", "검색값 있음");
			response.sendRedirect(request.getContextPath() + "/seats/seatsList.do");
			return;
		}
	
		cnt = seatsService.insertSres(vo);	
		response.sendRedirect(request.getContextPath() + "/seats/seatsList.do");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
