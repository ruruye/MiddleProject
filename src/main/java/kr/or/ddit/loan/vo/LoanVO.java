package kr.or.ddit.loan.vo;

import java.sql.Date;

public class LoanVO {

	private String loans_id;
	private String mem_id;
	private String book_id;
	private String book_tit;
	private Date loans_date;
	private Date return_date;
	private Date overdue_date;
	private int overdue;
	private String book_img;

	public LoanVO() {
	}
	
	public LoanVO(String mem_id, String book_id) {
		this.mem_id = mem_id;
		this.book_id = book_id;
	}

	public LoanVO(String loans_id, String mem_id, String book_id) {
		this.loans_id = loans_id;
		this.mem_id = mem_id;
		this.book_id = book_id;
	}

	public LoanVO(String loans_id, String mem_id, String book_id, String book_tit, Date loans_date, Date return_date,
			Date overdue_date, int overdue, String book_img) {
		this.loans_id = loans_id;
		this.mem_id = mem_id;
		this.book_id = book_id;
		this.book_tit = book_tit;
		this.loans_date = loans_date;
		this.return_date = return_date;
		this.overdue_date = overdue_date;
		this.overdue = overdue;
		this.book_img = book_img;
	}

	public String getLoans_id() {
		return loans_id;
	}

	public void setLoans_id(String loans_id) {
		this.loans_id = loans_id;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getBook_id() {
		return book_id;
	}

	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}

	public String getBook_tit() {
		return book_tit;
	}

	public void setBook_tit(String book_tit) {
		this.book_tit = book_tit;
	}

	public Date getLoans_date() {
		return loans_date;
	}

	public void setLoans_date(Date loans_date) {
		this.loans_date = loans_date;
	}

	public Date getReturn_date() {
		return return_date;
	}

	public void setReturn_date(Date return_date) {
		this.return_date = return_date;
	}

	public Date getOverdue_date() {
		return overdue_date;
	}

	public void setOverdue_date(Date overdue_date) {
		this.overdue_date = overdue_date;
	}

	public int getOverdue() {
		return overdue;
	}

	public void setOverdue(int overdue) {
		this.overdue = overdue;
	}

	public String getBook_img() {
		return book_img;
	}

	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}

}
