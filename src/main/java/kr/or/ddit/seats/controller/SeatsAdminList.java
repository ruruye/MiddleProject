package kr.or.ddit.seats.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.seats.service.ISeatsService;
import kr.or.ddit.seats.service.SeatsServiceImpl;
import kr.or.ddit.seats.vo.SeatResVO;

@WebServlet("/seats/seatsAdminList.do")
public class SeatsAdminList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		ISeatsService seatsService = SeatsServiceImpl.getInstance();
		List<SeatResVO> list = seatsService.getSeatsAll();
		
		request.setAttribute("seatsList", list);
		request.getRequestDispatcher("/seats/seatAdmin.jsp").forward(request, response);
	}

}
