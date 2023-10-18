package kr.or.ddit.seats.vo;

import java.sql.Date;

public class SeatResVO {
	
	private String sres_id   ;
	private String mem_id    ;
	private String seats_id  ;
	private Date sres_date ;
	private String start_time;
	private String end_time  ;
	
	public SeatResVO() {
		
	}
	
	public SeatResVO(String sres_id, String mem_id, String seats_id, Date sres_date, String start_time,
			String end_time) {
		super();
		this.sres_id = sres_id;
		this.mem_id = mem_id;
		this.seats_id = seats_id;
		this.sres_date = sres_date;
		this.start_time = start_time;
		this.end_time = end_time;
	}
	
	public String getSres_id() {
		return sres_id;
	}
	public void setSres_id(String sres_id) {
		this.sres_id = sres_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getSeats_id() {
		return seats_id;
	}
	public void setSeats_id(String seats_id) {
		this.seats_id = seats_id;
	}
	public Date getSres_date() {
		return sres_date;
	}
	public void setSres_date(Date sres_date) {
		this.sres_date = sres_date;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
}
